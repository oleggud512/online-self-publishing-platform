export class ProfilePermissions {
  public publishBook: boolean
  public addComment: boolean

  constructor(data: ProfilePermissions) {
    this.publishBook = data.publishBook
    this.addComment = data.addComment
  }
}