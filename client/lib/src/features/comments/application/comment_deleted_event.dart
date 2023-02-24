import '../../../common/pub_sub.dart';

class CommentDeletedEvent extends PubSubEvent {
  final String commentId;

  CommentDeletedEvent(this.commentId);
}