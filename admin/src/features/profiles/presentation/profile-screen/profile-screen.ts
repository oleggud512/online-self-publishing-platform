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


@autoinject
export class ProfileScreen {
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
    this.profile = await this.profileRepo.getProfile(this.profileId)
    console.log(this.profile)
    this.permissions = await this.profileRepo.getPermissions(this.profileId)
    this.blocked = await this.profileRepo.isBlocked(this.profileId)
  }

  async togglePublishBook() {
    this.permissions.publishBook = await this.profileRepo.togglePublishBook(this.profileId)
  }

  async toggleAddComment() {
    if (!this.permissions.addComment) {
      this.permissions.addComment = 
        await this.profileRepo.toggleAddComment(this.profileId)
      return
    }

    const res = 
      await DatePickerDialog.show(this.dialogService, 'Unblock comments at...')
    if (res?.output) {
      this.permissions.addComment = 
        await this.profileRepo.toggleAddComment(this.profileId, res.output)
    } else {
      console.log('CANNOT RESTRICT COMMENTS')
    }
  }

  async toggleBlocked() {
    this.blocked = await this._toggleRestriction(
      this.blocked, 
      this.profileRepo.toggleBlocked
    )
  }

  async _toggleRestriction(
    permission: boolean, 
    toggler: (...args: any[]) => Promise<any>
  ) : Promise<boolean> {
    if (!permission) {
      return await toggler(this.profileId)
    }

    const res = 
      await DatePickerDialog.show(this.dialogService, 'Unblock comments at...')
    if (res?.output) {
      return await toggler(this.profileId, res.output)
    }
    
    console.log('CANNOT change restriction')
    return permission
  }

  onShowReport(report: Report) {
    this.router.navigateToRoute(MyRoute.report, { id: report._id })
  }
  
}