export class CommentSubjects {
  static book : string = 'Book'
  static chapter : string = 'Chapter'

  static get values() {
    return [CommentSubjects.book, CommentSubjects.chapter]
  }
}