export class ReportSubject {
  static book = 'Book'
  static profile = 'Profile'
  static comment = 'Comment'

  static get values() {
    return [ ReportSubject.book, ReportSubject.profile, ReportSubject.comment ]
  }
}