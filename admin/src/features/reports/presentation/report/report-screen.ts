import { autoinject } from "aurelia-framework"
import { RouterConfiguration, NavigationInstruction } from "aurelia-router"
import { ReportRepository } from "features/reports/data/report-repository"
import { Report } from "features/reports/domain/report"
import i18next from "i18next"

@autoinject
export class ReportScreen {
  public t = i18next.t
  
  constructor(private reportRepo: ReportRepository) { }
  reportId: string
  report: Report | undefined

  activate(params, routerConfig: RouterConfiguration, inst: NavigationInstruction) {
    this.reportId = params.id
    this.refresh()
  }

  async refresh() {
    this.report = await this.reportRepo.getReport(this.reportId)
    console.log(this.report)
  }
}
