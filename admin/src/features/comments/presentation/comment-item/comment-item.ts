import { bindable, autoinject } from "aurelia-framework"
import { CommentDeletedEvent } from "features/comments/application/comment-deleted-event"
import { CommentRepository } from "features/comments/data/comment-repository"
import { Comment } from "features/comments/domain/comment"
import { Subscription } from "rxjs"
import { PubSub } from "shared/pub-sub"
import * as nprog from "nprogress"


@autoinject
export class CommentItemCustomElement {
  @bindable comment: Comment
  @bindable selected: boolean = true
  @bindable selectedCommentId: string

  sbs: Subscription
  
  constructor(private commentRepo: CommentRepository, private pubSub: PubSub) { }

  attached() {
    this._listenCommentDeleted()
  }
  
  _listenCommentDeleted() {
    this.sbs = this.pubSub.on(CommentDeletedEvent, (ev) => {
      const index = this.comment.answers.findIndex(c => c._id == ev.commentId)
      if (index < 0) return
      this.comment.answers.splice(index, 1)
    })
  }
  
  detached() {
    this.sbs.unsubscribe()
  }

  get isSelected() : boolean {
    return this.comment._id == this.selectedCommentId && this.selected
  }

  tap(event: Event) { 
    if (!(event.currentTarget == event.target)) return
    this.selected = false
  }

  async delete() {
    nprog.start()
    const deleted = await this.commentRepo.deleteComment(this.comment._id)
    nprog.done()
    if (deleted) {
      this.pubSub.emit(new CommentDeletedEvent(this.comment._id))
    } else {
      console.log("CANNOT DELETE THIS COMMENT")
    }
  }

  async loadMore() {
    nprog.start()
    const answers = await this.commentRepo.getComments(this.comment.subject._id, {
      questionId: this.comment._id,
    })
    nprog.done()
    this.comment.answers = answers
  }
}
