import { DialogService } from "aurelia-dialog"
import { autoinject } from "aurelia-framework"
import { Router, RouterConfiguration, NavigationInstruction } from "aurelia-router"
import { DatePickerDialog } from "components/date-picker-dialog/date-picker-dialog"
import { Role } from "features/authentication/domain/role"
import { ProfileRepository } from "features/profiles/data/profile-repository"
import { Profile } from "features/profiles/domain/profile"
import { ProfilePermissions } from "features/profiles/domain/profile-permissions"
import { Report } from "features/reports/domain/report"
import * as auth from "firebase/auth"
import { MyRoute } from "router"
import * as nprog from "nprogress"
import i18next from "i18next"


@autoinject
export class ProfileScreen {
  public t = i18next.t
  profileId: string
  
  profile?: Profile
  permissions?: ProfilePermissions
  blocked = false

  get profileName() {
    return this.profile.displayName ?? this.profile.name
  }

  constructor(
    private router: Router, 
    private dialogService: DialogService,
    private profileRepo: ProfileRepository
  ) {}

  activate(params, routerConfig: RouterConfiguration, inst: NavigationInstruction) {
    this.profileId = params.id
    this.refresh()
  }

  async refresh() {
    nprog.start()
    this.profile = await this.profileRepo.getProfile(this.profileId)
    console.log(this.profile)
    this.permissions = await this.profileRepo.getPermissions(this.profileId)
    this.blocked = await this.profileRepo.isBlocked(this.profileId)
    nprog.done()
  }

  async togglePublishBook() {
    nprog.start()
    this.permissions.publishBook = await this.profileRepo.togglePublishBook(this.profileId)
    nprog.done()
  }

  async toggleAddComment() {
    if (!this.permissions.addComment) {
      nprog.start()
      this.permissions.addComment = 
        await this.profileRepo.toggleAddComment(this.profileId)
      nprog.done()
      return
    }

    const res = 
      await DatePickerDialog.show(this.dialogService, 'Unblock comments at...')
    if (res?.output) {
      nprog.start()
      this.permissions.addComment = 
        await this.profileRepo.toggleAddComment(this.profileId, res.output)
      nprog.done()
    } else {
      console.log('CANNOT RESTRICT COMMENTS')
    }
  }

  async toggleBlocked() {
    nprog.start()
    this.blocked = await this.profileRepo.toggleBlocked(this.profileId)
    nprog.done()
  }

  async _toggleRestriction(
    permission: boolean, 
    toggler: (...args: any[]) => Promise<any>
  ) : Promise<boolean> {
    if (!permission) {
      nprog.start()
      const res = await toggler(this.profileId)
      nprog.done()
      return res
    }

    const dialogResult = 
      await DatePickerDialog.show(this.dialogService, 'Unblock comments at...')
    if (dialogResult?.output) {
      nprog.start()
      const result = await toggler(this.profileId, dialogResult.output)
      nprog.done()
      return result
    }
    
    console.log('CANNOT change restriction')
    return permission
  }

  onShowReport(report: Report) {
    this.router.navigateToRoute(MyRoute.report, { id: report._id })
  }
  
}
