import { Document, Schema, model, Types } from "mongoose";
import { IBook } from "../books/Book";
import { IComment } from "../comments/Comment";
import { IProfile } from "../profiles/Profile";


export const ReportState = {
  pending: "pending",
  inProgress: "inProgress",
  closed: "closed"
}


export class ReportSubject {
  public static book : string = 'Book'
  public static profile: string = 'Profile'
  public static comment: string = 'Comment'
  
  public static get values() {
    return [
      ReportSubject.book,
      ReportSubject.profile,
      ReportSubject.comment
    ]
  }
}


export type IReport = {
  _id: string
  reportType: string
  author: string
  subject: string
  subjectName: string
  state: string
  admin: string

  actions?: any[]
}


const ReportSchema = new Schema(
  {
    reportType: { type: String, required: true, ref: "ReportType" },
    author: { type: String, required: true, ref: "Profile" },
    subject: { 
      type: Schema.Types.Mixed, 
      refPath: "subjectName",
      required: true 
    },
    subjectName: { 
      type: String, 
      enum: ReportSubject.values,
      required: true 
    },
    state: { type: String, default: ReportState.pending },
    admin: { type: String, default: null, ref: "Profile" }
  }, 
  { timestamps: true }
)


export const Report = model<IReport>("Report", ReportSchema)