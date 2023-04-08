import { autoinject } from "aurelia-framework"
import { RouterConfiguration, NavigationInstruction, Router } from "aurelia-router"
import { BookRepository } from "features/books/data/book-repository"
import { Book } from "features/books/domain/book"
import { BookPermissions } from "features/books/domain/book-permissions"
import { Chapter } from "features/chapters/domain/chapter"
import { Comment } from "features/comments/domain/comment"
import i18next from "i18next"
import { MyRoute } from "router"
import * as nprog from "nprogress"

@autoinject
export class BookScreen {
  public t = i18next.t

  bookId: string

  book: Book
  permissions: BookPermissions
  
  comments: Comment[]

  constructor(private bookRepo: BookRepository, private router: Router) { }

  activate(params, routerConfig: RouterConfiguration, inst: NavigationInstruction) {
    this.bookId = params.id  
    this.refresh()
  }

  async refresh() {
    nprog.start()
    this.book = await this.bookRepo.getBook(this.bookId)
    await this.getPermissions()
    nprog.done()
    console.log(this.book)
  }

  async getPermissions() {
    this.permissions = await this.bookRepo.getPermissions(this.bookId)
  }

  async togglePublish() {
    nprog.start()
    this.permissions.publishBook = await this.bookRepo.togglePublish(this.bookId)
    nprog.done()
  }
  
  onChapter(chapter: Chapter) {
    this.router.navigateToRoute(MyRoute.chapter, { id: chapter._id })
  }
}
