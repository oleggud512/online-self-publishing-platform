import { Document, Schema, model, Types } from "mongoose";

export type IAction = {
  _id: string
  report: string
  author: string
  actionType: string
  // or
  content?: string
  // or | and
  book?: {
    _id: string
    name: string
  }
  // or
  chapter?: {
    _id: string
    name: string
  }

  createdAt?: Date
  updatedAt?: Date
}

/*
 * admin sees in the report.
 * */
export class ActionType {
  static message = "message"

  static deleteComment = "deleteComment"

  static updateProfile = "updateProfile"
  static allowPublishBook = "allowPublishBook"
  static restrictPublishBook = "restrictPublishBook"
  static allowAddComment = "allowAddComment"
  static restrictAddComment = "restrictAddComment"
  static profileBlocked = "profileBlocked"
  static profileUnblocked = "profileUnblocked"

  static addBook = "addBook"
  static updateBook = "updateBook"
  static deleteBook = "deleteBook"
  static publishBook = "publishBook"
  static unpublishBook = "unpublishBook"
  static unpublishBookPermanently = "unpublishBookPermanently"
  static publishBookPermanently = "publishBookPermanently"

  static addChapter = "addChapter"
  static updateChapter = "updateChapter"
  static deleteChapter = "deleteChapter"
  static publishChapter = "publishChapter"
  static unpublishChapter = "unpublishChapter"

  static get values() {
    return [
      ActionType.message,
      ActionType.deleteComment,

      ActionType.updateProfile,
      ActionType.allowPublishBook,
      ActionType.restrictPublishBook,
      ActionType.allowAddComment,
      ActionType.restrictAddComment,
      ActionType.profileBlocked,
      ActionType.profileUnblocked,

      ActionType.addBook,
      ActionType.updateBook,
      ActionType.deleteBook,
      ActionType.publishBook,
      ActionType.unpublishBook,
      ActionType.unpublishBookPermanently,
      ActionType.publishBookPermanently,

      ActionType.addChapter,
      ActionType.updateChapter,
      ActionType.deleteChapter,
      ActionType.publishChapter,
      ActionType.unpublishChapter,
    ]
  }
}

const ActionSchema = new Schema({
  actionType: { type: String, required: true },
  author : { type: String, ref: 'Profile', required: true },
  report : { type: Types.ObjectId, ref: 'Report', required: true },
  content: { type: String },
  profile: { type: String, ref: 'Profile' },
  book   : { type: Schema.Types.ObjectId, ref: 'Book' },
  chapter: { type: Schema.Types.ObjectId, ref: 'Chapter' },
}, { timestamps: true })

export const Action = model<IAction>('Action', ActionSchema)
