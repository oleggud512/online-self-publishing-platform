import { FilterQuery, PopulateOptions, Query } from "mongoose"
import { AppError } from "../../common/app-error"
import { Constants } from "../../shared/Constants"
import { Sorting } from "../comments/Sorting"
import { IReport, Report, ReportState, ReportSubject } from "./Report"
import { ReportType, ReportTypes } from "./ReportType"
import "../../common/ext-array-builder"
import { fullReportPopulateOptions, smallReportPopulateOptions } from "./report-query-utils"
import { promise, promiseBuilder } from "../../common/error-handling"


export async function getReportTypes(subjectName: string | undefined) {
  if (subjectName) {
    return await ReportType.find({ subjectName: subjectName })
  }
  return await ReportType.find()
}


export async function addReport(
  author: string, 
  subject: string, 
  subjectName: string, 
  reportType: string
) : Promise<boolean> {
  if (!ReportTypes.values.includes(reportType) || 
      !ReportSubject.values.includes(subjectName)) {
    throw new AppError("incorrect values")
  }
  const report = new Report({
    author,
    subject,
    subjectName,
    reportType
  })
  await report.save()
  return true
}


export async function getReports(
  subjectName: string | undefined, 
  state: string, 
  owner: string,
  sorting: Sorting,
  forProfile: string,
  from: number,
  pageSize: number
) : Promise<any[]> {
  const reports = await Report.find({
    state: state,
    admin: owner == 'my' ? forProfile : { $exists: true },
    subjectName: subjectName ? subjectName : { $exists: true }
  }).populate(smallReportPopulateOptions)
    .sort(sorting == 'new' ? { createdAt: -1 } : { createdAt: 1 } )
    .skip(from)
    .limit(pageSize)
  return reports
}


export async function getReport(reportId: string) {
  const report = await Report.findById(reportId).populate(fullReportPopulateOptions)
  return report
}


export async function takeReport(adminId: string, reportId: string) : Promise<IReport> {
  var [report, err] = await promiseBuilder(
    async () => await Report.findById(reportId)
  )
  if (err || !report || report.state != ReportState.pending) throw new AppError("error take report")
  report.admin = adminId
  report.state = ReportState.inProgress
  return await (await report.save()).populate(fullReportPopulateOptions)
}


export async function closeReport(adminId: string, reportId: string) {
  var [report, err] = await promiseBuilder(
    async () => await Report.findById(reportId)
  )
  if (err || !report || report.state != ReportState.inProgress) throw new AppError("error take report")
  report.admin = adminId
  report.state = ReportState.closed
  return await (await report.save()).populate(fullReportPopulateOptions)
}
