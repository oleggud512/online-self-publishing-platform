import { Book } from "features/reports/domain/report";
import { bindable } from "aurelia-framework"

export class BookItemCustomElement {
  @bindable book: Book
}