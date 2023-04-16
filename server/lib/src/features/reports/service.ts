import { Types } from "mongoose"
import { AppError } from "../../common/app-error"
import { Constants } from "../../shared/Constants"
import { Sorting } from "../comments/Sorting"
import { IReport, Report, ReportState, ReportSubject } from "./Report"
import { ReportType, ReportTypes } from "./ReportType"
import "../../common/ext-array-builder"
import { 
  actionPopulateOptions, 
  fullReportPopulateOptions, 
  smallReportPopulateOptions 
} from "./report-query-utils"
import { promise, promiseBuilder } from "../../common/error-handling"
import { Action } from "./Action"
import * as actionService from "./action-service"
import { ReportAggregationBuilder } from "./report-aggregation-builder"
import { ActionAggregationBuilder } from "./action-aggregation-builder"
import * as socket from "../messages/socket"
import { AppErrors } from "../../shared/errors"
import * as bookService from "../books/service"
import { IBook } from "../books/Book"
import { IProfile } from "../profiles/Profile"
import * as notificationService from "../notifications/service"
import * as restrictionService from "../restrictions/service"
import { Restriction } from "../restrictions/Restriction"

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
  reportType: string,
  defendant: string,
  description: string
) : Promise<boolean> {
  if (!ReportTypes.values.includes(reportType) || 
      !ReportSubject.values.includes(subjectName)) {
    throw new AppError("incorrect values")
  }
  const report = new Report({
    author,
    subject: subjectName == ReportSubject.profile 
      ? subject
      : new Types.ObjectId(subject),
    subjectName,
    reportType,
    defendant,
    description
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
  const report = await Report.findOne({_id: new Types.ObjectId(reportId)})
    .populate(fullReportPopulateOptions)
  console.log(report)
  return report
}


export async function takeReport(
  adminId: string, 
  reportId: string
) : Promise<IReport> {
  var [report, err] = await promiseBuilder(
    async () => await Report.findById(reportId)
  )
  if (err || !report || report.state != ReportState.pending) {
    throw new AppError("error take report")
  }
  report.admin = adminId
  report.state = ReportState.inProgress
  return await (await report.save()).populate(fullReportPopulateOptions)
}


export async function closeReport(reportId: string) {
  var [report, err] = await promiseBuilder(
    async () => await Report.findById(reportId)
      .populate(smallReportPopulateOptions)
  )

  if (err || !report || report.state != ReportState.inProgress) {
    throw new AppError("error close report")
  }
  
  
  if (report.subjectName == ReportSubject.book) {
    const restrictions = await restrictionService
      .getRestrictions((report.subject as IBook)._id)
    if (restrictions
        .find(r => r.restriction == Restriction.Name.publishBook)) {
      await bookService.togglePublish(
        (report.subject as IBook)._id, 
        (report.admin as IProfile)._id
      )
    }
  }

  report.state = ReportState.closed
  await report.save()
  return await Report.findById(reportId).populate(fullReportPopulateOptions)
}


// reopen report when closed.
export async function openReport(reportId: string) {
  var [report, error] = await promise(Report
    .findById(reportId)
    .populate(smallReportPopulateOptions)
    .exec())

  if (error || !report || [ReportState.pending, ReportState.inProgress]
      .includes(report.state)) {
    throw new AppError(AppErrors.cannotReopenReport)
  }

  report.state = ReportState.inProgress
  await report.save()
  return await Report.findById(reportId).populate(fullReportPopulateOptions)
}


export async function rejectReport(reportId: string) {
  var [ report, error ] = await promise(
    Report.findById(reportId).populate(fullReportPopulateOptions).exec())

  if (error || !report || report.state != ReportState.pending) {
    throw new AppError("cantRejectReport")
  }
  
  report.state = ReportState.rejected
  await report.save()

  notificationService.sendReportRejectedNotification(report)

  return report
}


// похоже, это нужно сделать доступным всем зарегистрированным, и проверять 
// profileId на соответствие report.admin или report.subject или report.subject.author
export async function addMessageAction(
  reportId: string, 
  profileId: string, 
  content: string
) {
  const report = await Report.findById(reportId)

  if (!report || ![report.admin, report.defendant].includes(profileId)) {
    throw new AppError(AppErrors.cannotAddMessage)
  }

  const [action, error] = await promise(actionService.addMessage({ 
    authorId: profileId, 
    reportId: reportId, 
    content: content 
  }))
  
  if (error) throw error

  socket.addMessage({
    _id: "",
    from: {
      _id: profileId == report.admin 
        ? reportId 
        : profileId,
      email: "",
      name: profileId == report.admin ? report.reportType : ""
    },
    createdAt: action!.createdAt,
    updatedAt: action!.updatedAt,
    to: reportId,
    content: content
  })
  console.log(action)
  return await action?.populate(actionPopulateOptions)
}


export async function getChats(
  forProfile: string, 
  from: number, 
  pageSize: number
) {
  const chats = await new ReportAggregationBuilder(forProfile)
    .chats()
    .page(from, pageSize)
    .build()
  console.log(chats)
  return chats
}


export async function getMessages(
  ofReport: string, 
  forProfile: string, 
  from: number, 
  pageSize: number
) {
  const messages = await new ActionAggregationBuilder(forProfile)
    .messages(ofReport)
    .page(from, pageSize)
    .build()
  console.log({ messages })
  return messages
}
