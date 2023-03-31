import { bindable } from "aurelia-framework"
import { Book } from "features/books/domain/book"

export class BookItemCustomElement {
  @bindable book: Book
}