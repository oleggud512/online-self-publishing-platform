import { autoinject } from "aurelia-framework"
import { RouterConfiguration, NavigationInstruction } from "aurelia-router"
import { DatePickerDialog } from "components/date-picker-dialog/date-picker-dialog"
import { BookRepository } from "features/books/data/book-repository"
import { Book } from "features/books/domain/book"
import { BookPermissions } from "features/books/domain/book-permissions"
import { Comment } from "features/comments/domain/comment"

@autoinject
export class BookScreen {
  bookId: string

  book: Book
  permissions: BookPermissions
  
  comments: Comment[]

  constructor(private bookRepo: BookRepository) { }

  activate(params, routerConfig: RouterConfiguration, inst: NavigationInstruction) {
    this.bookId = params.id  
    this.refresh()
  }

  async refresh() {
    this.book = await this.bookRepo.getBook(this.bookId)
    this.getPermissions()
    console.log(this.book)
  }

  async getPermissions() {
    this.permissions = await this.bookRepo.getPermissions(this.bookId)
  }

  async togglePublish() {
    this.permissions.publishBook = await this.bookRepo.togglePublish(this.bookId)
  }
}