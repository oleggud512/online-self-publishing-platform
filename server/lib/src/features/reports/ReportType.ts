import { Document, Schema, model } from "mongoose";

export type IReportType = {
  _id: string
  subjectName: string[]
  name: string
  description: string
  displayName: string
}

const ReportTypeSchema = new Schema({
  subjectName: { type: [String] },
  name: { type: String },
  description: { type: String },
  displayName: { type: String }
})

export const ReportType = model<IReportType>("ReportType", ReportTypeSchema)

export class ReportTypes {
  public static inappropriateContent : string = 'inappropriate_content'
  public static plagiarism : string = 'plagiarism'
  public static spam : string = 'spam'
  public static harassment : string = 'harassment'
  public static falseInformation : string = 'false_information'
  public static copyrightInfringement : string = 'copyright_infringement'
  public static inappropriateBehavior : string = 'inappropriate_behavior'

  public static get values() {
    return [
      ReportTypes.inappropriateContent,
      ReportTypes.plagiarism,
      ReportTypes.spam,
      ReportTypes.harassment,
      ReportTypes.falseInformation,
      ReportTypes.copyrightInfringement,
      ReportTypes.inappropriateBehavior,
    ]
  }
}