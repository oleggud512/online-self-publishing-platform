import { bindable, computedFrom, autoinject } from "aurelia-framework"
import { ReportRepository } from "features/reports/data/report-repository"
import { Report } from "features/reports/domain/report"
import { ReportState } from "features/reports/domain/report-state"
import { ReportSubject } from "features/reports/domain/report-subject"
import i18next from "i18next"

@autoinject
export class ReportItem {
  t = i18next.t

  constructor(private reportRepo: ReportRepository) { }

  @bindable report: Report
  @bindable onHeaderClick: (report: Report) => {}


  @computedFrom('report.subjectName')
  get isOnProfile() {
    return this.report.subjectName == ReportSubject.profile
  }
  @computedFrom('report.subjectName')
  get isOnBook() {
    return this.report.subjectName == ReportSubject.book
  }
  @computedFrom('report.subjectName')
  get isOnComment() {
    return this.report.subjectName == ReportSubject.comment
  }

  get actionName() {
    switch (this.report.state) {
      case (ReportState.pending): return this.t("take")
      case (ReportState.inProgress): return this.t("close")
      case (ReportState.closed): return this.t("closed")
    }
  }

  get actionDisabled() {
    return this.report.state == ReportState.closed
  }

  async onReportAction() {
    switch (this.report.state) {
      case ReportState.pending: 
        console.log("pending. I need to takeReport")
        this.report = await this.reportRepo.takeReport(this.report._id)
        break
      case ReportState.inProgress:
        this.report = await this.reportRepo.closeReport(this.report._id)
        break
    }
  }
}