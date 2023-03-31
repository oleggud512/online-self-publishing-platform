import { BaseCommentSubject } from "features/comments/domain/comment-subject"
import { Profile } from "features/profiles/domain/profile"
import { BaseReportSubject } from "features/reports/domain/report"
import { Owned } from "../../../domain"

export class Book implements BaseReportSubject, BaseCommentSubject, Owned {
  _id: string

  name: string
  author: Profile
  description?: string
  coverUrl?: string
  genres: string[] = []
  tags: string[] = []
  likes: number = 0
  state: string  // TODO: parse to enum
  status: string // TODO: parse to enum

  createdAt?: Date
  updatedAt?: Date

  constructor(data: any) {
    this._id = data._id

    this.name = data.name
    this.author = new Profile(data.author)
    this.description = data.description
    this.coverUrl = data.coverUrl
    this.genres = data.genres
    this.tags = data.tags
    this.likes = data.likes
    this.state = data.state
    this.status = data.status

    if (data.createdAt) this.createdAt = new Date(data.createdAt)
    if (data.updatedAt) this.updatedAt = new Date(data.updatedAt)
  }

}
