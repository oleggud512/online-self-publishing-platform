import { Document, Schema, model, Types } from "mongoose"
import { IBook } from "../books/Book"
import { IComment } from "../comments/Comment"
import { IProfile } from "../profiles/Profile"
import { IAction } from "./Action"


export const ReportState = {
  pending: "pending",
  inProgress: "inProgress",
  closed: "closed",
  rejected: 'rejected'
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
  author: string | IProfile
  subject: string | IBook | IProfile | IComment
  subjectName: string
  state: string
  admin: string | IProfile
  defendant: string | IProfile

  actions?: IAction[]

  createdAt?: Date
  updatedAt?: Date
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
    
    admin: { type: String, ref: "Profile", default: null},
    defendant: { type: String, ref: "Profile", required: true }
  }, 
  { 
    timestamps: true, 
    toJSON: { virtuals: ["actions"] }, 
    toObject: { virtuals: ["actions"] }
  }
)

ReportSchema.virtual("actions", {
  ref: 'Action',
  localField: '_id',
  foreignField: 'report',
  justOne: false,
  options: { 
    sort: { createdAt: -1 } 
  }
})


export const Report = model<IReport>("Report", ReportSchema)