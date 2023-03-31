export class BookPermissions {
  publishBook: boolean = false

  constructor(data: any) {
    if (data.publishBook) this.publishBook = data.publishBook
  }
}