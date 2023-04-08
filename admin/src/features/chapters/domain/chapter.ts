import { Book } from "features/books/domain/book"
import { BaseCommentSubject } from "features/comments/domain/comment-subject"

export class Chapter implements BaseCommentSubject {
  _id: string

  name: string
  content: string
  book: Book
  state: string
  
  createdAt?: Date
  updatedAt?: Date

  constructor(data: any) {
    this._id = data._id

    this.name = data.name
    this.content = data.content
    this.state = data.state
    this.book = new Book(data.book)

    if (data.createdAt) this.createdAt = new Date(data.createdAt)
    if (data.updatedAt) this.updatedAt = new Date(data.updatedAt)
  }
}
