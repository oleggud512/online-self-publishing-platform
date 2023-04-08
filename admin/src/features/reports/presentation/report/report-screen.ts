import { DialogService } from "aurelia-dialog"
import { autoinject, View } from "aurelia-framework"
import {
  Router,
  RouterConfiguration,
  NavigationInstruction,
} from "aurelia-router";
import { YesNoDialog } from "components/yes-no-dialog/yes-no-dialog"
import { ReportRepository } from "features/reports/data/report-repository"
import { Report } from "features/reports/domain/report"
import { ReportState } from "features/reports/domain/report-state";
import i18next from "i18next"
import * as nprog from "nprogress"

@autoinject
export class ReportScreen {
  public t = i18next.t
  
  reportId: string
  report: Report | undefined
  
  messageField: string

  get couldReject() {
    return this.report?.state == ReportState.pending
  }
  
  constructor(
    private reportRepo: ReportRepository, 
    private dialogService: DialogService,
    private router: Router
  ) { }

  created(owningView: View, myView: View) {
    try {
      const ta = 
        myView.fragment.querySelector("#messageField") as HTMLTextAreaElement
      this.autoGrow(ta)
    } catch (e) {
      console.error('NO #messageField FOUND')
    }
  }

  autoGrow(textarea: HTMLTextAreaElement) {
    textarea.style.maxHeight = `7rem`
    textarea.oninput = (ev: InputEvent) => {
      textarea.style.height = "auto";
      textarea.style.height = `${textarea.scrollHeight}px`;
    }
  }

  activate(
    params: any, 
    routerConfig: RouterConfiguration, 
    inst: NavigationInstruction
  ) {
    this.reportId = params.id
    this.refresh()
  }

  async refresh() {
    this.report = await this.reportRepo.getReport(this.reportId)
    console.log(this.report)
  }

  async sendMessage() {
    console.log(this.messageField)
    nprog.start()
    const newMessage = 
      await this.reportRepo.sendMessage(this.messageField, this.reportId)
    nprog.done()
    console.log({newMessage})
    this.report.actions.unshift(newMessage)
    this.messageField = ""
    setTimeout(() => window.scrollTo(0, document.body.scrollHeight), 50)
  }

  async onInsufficientReport() {
    const resp = await YesNoDialog.show(this.dialogService, 'Are you sure you want to delete report?')
    if ( resp.output) {
      nprog.start()
      this.report = await this.reportRepo.rejectReport(this.reportId)
      nprog.done()
      this.router.navigateBack()
    } else {
      console.log('DO NOTHING')
    }
  }
}
