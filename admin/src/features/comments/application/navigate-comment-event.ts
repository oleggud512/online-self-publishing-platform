import { PubSubEvent } from "shared/pub-sub";

export class NavigateCommentEvent extends PubSubEvent {
  constructor(public commentId: string) { super() }
}