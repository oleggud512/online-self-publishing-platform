import {
  autoinject,
  View,
  computedFrom,
  bindable,
  observable,
  BindingEngine,
  Disposable,
  TaskQueue,
} from "aurelia-framework";
import {
  RouterConfiguration,
  NavigationInstruction,
  Router,
} from "aurelia-router";
import { ReportState } from "features/reports/domain/report-state";
import { ReportRepository } from "features/reports/data/report-repository";
import { ReportFilters } from "features/reports/domain/report-filters";
import { SegmentButton } from "components/segmented-buttons/segment-button";
import { ReportSubject } from "features/reports/domain/report-subject";
import { ReportOwner } from "features/reports/domain/report-owner";
import { Report } from "features/reports/domain/report";
import { MyRoute } from "router";
import i18next from "i18next";

@autoinject
export class ReportsScreen {
  public t = i18next.t;

  reports: Report[] = [];

  hasMore = true;
  pageSize = 40;

  stateSbs: Disposable;
  sortingSbs: Disposable;
  ownerSbs: Disposable;
  subjectNameSbs: Disposable;

  navigateToReportCallback: (report: Report) => {};

  constructor(
    public reportRepo: ReportRepository,
    private router: Router,
    private taskQueue: TaskQueue,
    private bindingEngine: BindingEngine
  ) {
    this.stateSbs = bindingEngine
      .expressionObserver(this, "filters.state")
      .subscribe(() => this.refresh());
    this.sortingSbs = bindingEngine
      .expressionObserver(this, "filters.sorting")
      .subscribe(() => this.refresh());
    this.ownerSbs = bindingEngine
      .expressionObserver(this, "filters.owner")
      .subscribe(() => this.refresh());
    this.subjectNameSbs = bindingEngine
      .expressionObserver(this, "filters.subjectName")
      .subscribe(() => this.refresh());

    this.navigateToReportCallback = this.navigateToReport.bind(this);
  }

  detached() {
    this.stateSbs.dispose();
    this.sortingSbs.dispose();
    this.ownerSbs.dispose();
    this.subjectNameSbs.dispose();
  }

  activate(
    params,
    routerConfig: RouterConfiguration,
    inst: NavigationInstruction
  ) {
    const state = history.state;
    if (state && state.reports) {
      this.reports = state.reports;
      // console.log({reports: this.reports})
      window.scrollTo(0, state.scrollPos);
    } else {
      this.refresh().then(() => console.log(this.reports));
    }

    console.log({ "activate end": this.reports });
  }

  navigateToReport(report: Report) {
    console.log(this instanceof ReportsScreen);
    const reportUrl = this.router.generate(MyRoute.report, { id: report._id });
    const reportsUrl = this.router.generate(MyRoute.reports);
    console.log(report);
    history.pushState(
      { reports: this.reports, scrollPos: window.scrollY },
      "",
      reportsUrl
    );
    this.router.navigate(reportUrl);
  }

  async refresh() {
    this.reports = await this.reportRepo.getReports(
      this.filters,
      0,
      this.pageSize
    );
  }

  async loadMore() {
    const newPage = await this.reportRepo.getReports(
      this.filters,
      this.reports.length,
      this.pageSize
    );
    if (newPage.length > 0) {
      this.reports = [...this.reports, ...newPage];
    } else {
      this.hasMore = false;
    }
  }

  filters: ReportFilters = {
    state: ReportState.pending,
    sorting: "new",
    owner: ReportOwner.all,
  };

  stateSegments = [
    new SegmentButton(ReportState.pending, this.t("pending")),
    new SegmentButton(ReportState.inProgress, this.t("inProgress")),
    new SegmentButton(ReportState.closed, this.t("closed")),
    new SegmentButton(ReportState.rejected, this.t("rejected")),
  ];

  subjectSegments = [
    new SegmentButton(ReportSubject.book, this.t("books")),
    new SegmentButton(ReportSubject.profile, this.t("profiles")),
    new SegmentButton(ReportSubject.comment, this.t("comments")),
  ];

  isMySegments = [
    new SegmentButton(ReportOwner.my, this.t("my")),
    new SegmentButton(ReportOwner.all, this.t("all")),
  ];

  sortingSegments = [
    new SegmentButton("new", this.t("new")),
    new SegmentButton("old", this.t("old")),
  ];

  onTake(report: Report) {
    alert("take clicked");
  }
}
