import { AppError } from "../../common/app-error"
import { Report, ReportSubject } from "./Report"
import { ReportType, ReportTypes } from "./ReportType"


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