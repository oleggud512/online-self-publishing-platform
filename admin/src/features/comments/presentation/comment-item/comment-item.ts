import { Comment } from "features/reports/domain/report"
import { bindable } from "aurelia-framework"

export class CommentItemCustomElement {
  @bindable comment: Comment
}