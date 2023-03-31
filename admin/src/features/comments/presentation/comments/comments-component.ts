import { RouterConfiguration, NavigationInstruction } from "aurelia-router"
import { autoinject, bindable } from "aurelia-framework"
import { Comment } from "features/comments/domain/comment"
import { CommentRepository } from "features/comments/data/comment-repository"
import { Sorting } from "features/reports/domain/sorting"
import { EventAggregator } from "aurelia-event-aggregator"
import { SegmentButton } from "components/segmented-buttons/segment-button"
import i18next from "i18next"
import { NavigateCommentEvent } from "../../application/navigate-comment-event"
import { PubSub } from "shared/pub-sub"
import { Subscription } from "rxjs"
import { CommentDeletedEvent } from "features/comments/application/comment-deleted-event"

@autoinject
export class CommentsComponentCustomElement {
  t = i18next.t

  @bindable subjectId: string
  @bindable selectedComment?: string
  comments?: Comment[]

  onSortingChangedCallback
  pageSize = 40
  sorting: Sorting = 'new'

  navigateCommentSbs: Subscription
  deleteCommentSbs: Subscription

  constructor(private commentRepo: CommentRepository, public pubSub: PubSub) { 
    this.onSortingChangedCallback = this.onSortingChanged.bind(this)
  }

  attached() {
    this.refresh().then(() => {
      this.navigateCommentSbs = this.pubSub.on(NavigateCommentEvent, (ev) => {
        console.log('other listen')
        this.selectedComment = ev.commentId
        console.log(this.selectedComment)
      })
    })
    this.deleteCommentSbs = this.pubSub.on(CommentDeletedEvent, (ev) => {
      const index = this.comments.findIndex(c => c._id == ev.commentId)
      if (index < 0) return
      this.comments.splice(index, 1)
    })
  }

  detached() {
    this.deleteCommentSbs.unsubscribe()
    this.navigateCommentSbs.unsubscribe()
  }
  
  async loadMore() {
    const page = await this.commentRepo.getComments(this.subjectId, { 
      sorting: this.sorting, 
      from: this.comments.length,
      pageSize: this.pageSize
    })
    this.comments.push(...page)
  }
  
  async onSortingChanged(newSorting: Sorting) {
    this.sorting = newSorting;
    this.refresh()
  }
  async refresh() {
    this.comments = await this.commentRepo.getComments(this.subjectId, { 
      sorting: this.sorting,
      pageSize: this.pageSize
    })
  }

  sortingSegments = [ 
    new SegmentButton('new', this.t('new')), 
    new SegmentButton('old', this.t('old')),
    new SegmentButton('popular', this.t('popular')),
  ]

}