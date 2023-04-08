import { model, Schema, Types } from "mongoose"
import * as mongoose from 'mongoose'
import { Book, IBook } from "../books/Book"
import { ReportSubject } from "../reports/Report"
import { ReportTypes } from "../reports/ReportType"
import { IProfile, Profile } from "../profiles/Profile"

export namespace Restriction {
  export class Name {
    static publishBook = 'publishBook'
    static addComment = 'addComment'
    static block = 'block'
    
    static values = [
      this.publishBook, 
      this.addComment,
      this.block
    ]
  }

  export class Subject {
    static book = "Book"
    static profile = "Profile"

    static values = [
      this.book,
      this.profile
    ]
  }

  export interface IBase<SubjectType extends string | IProfile | IBook = string> {
    _id: string
    subject: SubjectType
    subjectName: string
    restriction: string
    before: Date
  }
  export type IOfProfile = IBase<IProfile>
  export type IOfBook = IBase<IBook>

  const RestrictionSchema = new Schema({
    subject: { 
      type: Schema.Types.Mixed, 
      required: true, 
      refPath: "subjectName" 
    },
    subjectName: {
      type: String,
      required: true,
      enum: Subject.values
    },
    restriction: {
      type: String,
      required: true,
      enum: Name.values
    },
    before: { type: Schema.Types.Date }
  }, { timestamps: true })

  export const Model = model<IBase<string>>('Restriction', RestrictionSchema);
}
