import { BaseReportSubject, Report } from "features/reports/domain/report"

export class Profile implements BaseReportSubject {
  _id: string

  avatarUrl?: string

  name: string
  displayName?: string
  
  description?: string
  
  subscribers: number = 0
  subscriptions: number = 0
  bookCount: number = 0
  
  gender?: string
  age?: number
  email: string

  reports?: Report[]
  reported?: Report[]

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

    if (data.reported) this.reported = (data.reported as any[]).map(r => new Report(r))
    if (data.reports) this.reports = (data.reports as any[]).map(r => new Report(r))

    if (data.createdAt) this.createdAt = new Date(data.createdAt)
    if (data.updatedAt) this.updatedAt = new Date(data.updatedAt)
  }

}