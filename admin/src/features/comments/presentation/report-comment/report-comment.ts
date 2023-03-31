import {bindable, autoinject } from 'aurelia-framework'
import { Router } from "aurelia-router"
import { EventAggregator } from "aurelia-event-aggregator"
import { Comment } from 'features/comments/domain/comment'
import { CommentSubject } from 'features/comments/domain/comment-subject'
import { MyRoute } from 'router'
import { NavigateCommentEvent } from '../../application/navigate-comment-event'
import { PubSub } from 'shared/pub-sub'

@autoinject
export class ReportCommentCustomElement {
  @bindable comment: Comment

  constructor(private router: Router, public pubSub: PubSub) { }

  get subjectRoute() {
    return this.comment.subjectName == CommentSubject.book
      ? MyRoute.book
      : MyRoute.chapter
  }

  get subjectId() {
    return this.comment.subject._id
  }

  navigateSubject() {
    const url = this.router.generate(this.subjectRoute, { id: this.subjectId })
    this.pubSub.emit(new NavigateCommentEvent(this.comment._id))
    console.log('navigateSubject() { }')
    this.router.navigate(`${url}`)
  }

}