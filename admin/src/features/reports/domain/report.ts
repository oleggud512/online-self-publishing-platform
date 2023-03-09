import { ReportState } from "./report-state";
import { ReportSubject } from "./report-subject";

export class Identifiable {
  _id: string
}

export class Owned {
  author: Profile
}

export class Entity implements Identifiable {
  _id: string
  createdAt?: Date
  updatedAt?: Date
}

export class BaseReportSubject implements Entity {
  _id: string
  createdAt?: Date
  updatedAt?: Date
}

export class BaseCommentSubject implements Identifiable {
  _id: string
}

export class Report implements Entity, Owned {
  _id: string
  author: Profile
  subject: BaseReportSubject
  subjectName: string
  reportType: ReportType
  state: string

  admin?: Profile
  actions?: Action[]

  createdAt: Date
  updatedAt: Date
  
  constructor(data: any) { 
    this._id = data._id
    if (data.admin) this.admin = new Profile(data.admin)
    this.author = new Profile(data.author)
    this.subject = this._parseSubject(data.subject, data.subjectName)
    this.subjectName = data.subjectName
    this.reportType = new ReportType(data.reportType)
    this.state = data.state

    if (data.createdAt) this.createdAt = new Date(data.createdAt)
    if (data.updatedAt) this.updatedAt = new Date(data.updatedAt)
  }

  private _parseSubject(data: any, subjectName: string) : BaseReportSubject {
    switch (subjectName) {
      case (ReportSubject.book): return new Book(data)
      case (ReportSubject.profile): return new Profile(data)
      case (ReportSubject.comment): return new Comment(data)
    }
  }

  public get isOnProfile() {
    // return this.subject instanceof Profile
    console.log(`IS ON PROFILE CALLED and returned ${this.subjectName == ReportSubject.profile}`)
    return this.subjectName === ReportSubject.profile
  }
  public get isOnBook() {
    console.log(`IS ON BOOK CALLED and returned ${this.subjectName == ReportSubject.book}`)
    // return this.subject instanceof Book
    return this.subjectName === ReportSubject.book
  }
  public get isOnComment() {
    // return this.subject instanceof Comment
    console.log(`IS ON COMMENT CALLED and returned ${this.subjectName == ReportSubject.comment}`)
    return this.subjectName === ReportSubject.comment
  }
}

// class ActionMeta {}
// class MessageActionMeta extends ActionMeta {
//   content: string
// }
// class BookActionMeta extends ActionMeta {
//   book: Book
// }
// class ChapterActionMeta extends ActionMeta {
//   book: Book
//   chapter: Chapter
// }


// export class Action implements Entity, Owned {
//   _id: string
//   author: Profile
//   meta: any
  
//   createdAt?: Date
//   updatedAt?: Date

//   constructor(data: any) {
//     this._id = data._id
//     this.author = new Profile(data.author)
//     this.meta = data.meta

//     if (data.createdAt) this.createdAt = new Date(data.createdAt)
//     if (data.updatedAt) this.updatedAt = new Date(data.updatedAt)
//   }
// }

// class SomeAct implements Entity, Owned, MessageActionMeta {
//   _id: string;
//   author: Profile;

//   createdAt?: Date;
//   updatedAt?: Date;

  
// }

export class ReportType implements Identifiable {
  _id: string
  description: string
  displayName: string
  name: string
  subjectName: string[]

  constructor(data: any) {
    this._id = data._id
    this.description = data.description
    this.displayName = data.displayName
    this.name = data.name
    this.subjectName = data.subjectName
  }
}

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

export class Chapter implements BaseCommentSubject {
  _id: string

  name: string
  content: string
  book: string
  state: string
  
  createdAt?: Date
  updatedAt?: Date

  constructor(data: any) {
    this._id = data._id

    this.name = data.name
    this.content = data.content
    this.state = data.state
    this.book = data.book

    if (data.createdAt) this.createdAt = new Date(data.createdAt)
    if (data.updatedAt) this.updatedAt = new Date(data.updatedAt)
  }
}

export class Profile implements BaseReportSubject {
  _id: string
  name: string
  email: string
  avatarUrl?: string
  description?: string
  displayName?: string
  subscribers: number = 0
  subscriptions: number = 0
  bookCount: number = 0
  gender?: string
  age?: number

  createdAt?: Date
  updatedAt?: Date

  constructor(data: any) {
    this._id = data._id

    this.name = data.name
    this.email = data.email
    this.avatarUrl = data.avatarUrl
    this.description = data.description
    this.displayName = data.displayName
    if (data.subscribers) this.subscribers = data.subscribers
    if (data.subscriptions) this.subscriptions = data.subscriptions
    if (data.bookCount) this.bookCount = data.bookCount
    this.gender = data.gender
    this.age = data.age

    if (data.createdAt) this.createdAt = new Date(data.createdAt)
    if (data.updatedAt) this.updatedAt = new Date(data.updatedAt)
  }

}

export enum CommentSubject {
  book = 'Book',
  chapter = 'Chapter'
}
export function parseCommentSubject(data: string) {
  switch (data) {
    case 'Book': return CommentSubject.book
    case 'Chapter': return CommentSubject.chapter
  }
  throw `incorrect data ${data}`
}

export class Comment implements BaseReportSubject, Owned {
  _id: string
  author: Profile
  subject: BaseCommentSubject
  subjectName: CommentSubject
  rate: number = 0
  depth: number = 0
  content: string

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