export class ProfilePermissions {
  publishBook: boolean = false
  addComment: boolean = false

  constructor(data: any) {
    if (data.publishBook) this.publishBook = data.publishBook
    if (data.addComment) this.addComment = data.addComment
  }
}