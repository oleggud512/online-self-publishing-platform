import { PubSubEvent } from "shared/pub-sub"

export class CommentDeletedEvent extends PubSubEvent {
  constructor(public commentId: string) { super() }
}