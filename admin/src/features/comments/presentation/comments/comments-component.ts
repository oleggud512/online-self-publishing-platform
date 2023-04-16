import { autoinject, bindable } from "aurelia-framework"
import { Comment } from "features/comments/domain/comment"
import { CommentRepository } from "features/comments/data/comment-repository"
import { Sorting } from "features/reports/domain/sorting"
import { SegmentButton } from "components/segmented-buttons/segment-button"
import i18next from "i18next"
import { NavigateCommentEvent } from "../../application/navigate-comment-event"
import { PubSub } from "shared/pub-sub"
import { Subscription } from "rxjs"
import { CommentDeletedEvent } from "features/comments/application/comment-deleted-event"
import * as nprog from "nprogress"


@autoinject
export class CommentsComponentCustomElement {
  t = i18next.t

  @bindable subjectId: string
  selectedComment?: string
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
    // after comments is loaded we fetch comment from report-comment.ts to select
    this.refresh().then(() => {
      this.navigateCommentSbs = this.pubSub.on(NavigateCommentEvent, (ev) => {
        console.log('other listen')
        this.selectedComment = ev.commentId
        console.log(this.selectedComment)
      })
    })
    // listen to comment deletion
    this.deleteCommentSbs = this.pubSub.on(CommentDeletedEvent, (ev) => {
      const index = this.comments.findIndex(c => c._id == ev.commentId)
      if (index < 0) return;
      this.comments.splice(index, 1)
    })
  }

  detached() {
    this.deleteCommentSbs.unsubscribe()
    this.navigateCommentSbs.unsubscribe()
  }
  
  async loadMore() {
    nprog.start()
    const page = await this.commentRepo.getComments(this.subjectId, { 
      sorting: this.sorting, 
      from: this.comments.length,
      pageSize: this.pageSize
    })
    nprog.done()
    this.comments.push(...page)
  }
  
  async onSortingChanged(newSorting: Sorting) {
    this.sorting = newSorting;
    this.refresh()
  }
  async refresh() {
    nprog.start()
    try {
      this.comments = await this.commentRepo.getComments(this.subjectId, { 
        sorting: this.sorting,
        pageSize: this.pageSize
      })
    } catch (e) {
      console.log('error while fetching comments. Do something with it.')
      console.log({theError: e})
    }
    nprog.done()
  }

  sortingSegments = [ 
    new SegmentButton('new', this.t('new')), 
    new SegmentButton('old', this.t('old')),
    new SegmentButton('popular', this.t('popular')),
  ]

}
