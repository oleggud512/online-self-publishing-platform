import { Owned } from "../../../domain"
import { BaseReportSubject } from "features/reports/domain/report"
import { Profile } from "features/profiles/domain/profile"
import { Book } from "features/books/domain/book"
import { BaseCommentSubject, CommentSubject } from "./comment-subject"
import { Chapter } from "features/chapters/domain/chapter"

export class Comment implements BaseReportSubject, Owned {
  _id: string
  author: Profile
  subject: BaseCommentSubject
  subjectName: CommentSubject
  rate: number = 0
  depth: number = 0
  content: string
  hasAnswers: boolean = false
  answers: Comment[] = []

  createdAt?: Date
  updatedAt?: Date

  constructor(data: any) {
    this._id = data._id

    this.author = new Profile(data.author)
    this.content = data.content
    this.subjectName = data.subjectName
    this.subject = this._parseCommentSubject(data.subject, data.subjectName)
    this.rate = data.rate
    this.depth = data.depth
    if (data.hasAnswers) this.hasAnswers = data.hasAnswers
    if (data.answers) this.answers = (data.answers as any[]).map(c => new Comment(c))

    if (data.createdAt) this.createdAt = new Date(data.createdAt)
    if (data.updatedAt) this.updatedAt = new Date(data.updatedAt)
  }

  private _parseCommentSubject(subject: any, subjectName: string) {
    switch (subjectName) {
      case CommentSubject.book: return new Book(subject)
      case CommentSubject.chapter: return new Chapter(subject)
    }
  }

}