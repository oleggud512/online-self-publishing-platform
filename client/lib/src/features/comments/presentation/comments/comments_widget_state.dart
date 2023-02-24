
import 'package:client/src/features/comments/data/comment_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/comment.dart';

part 'comments_widget_state.freezed.dart';

@freezed
class CommentsWidgetState with _$CommentsWidgetState {
  factory CommentsWidgetState({
    @Default([]) List<Comment> comments,
    @Default(CommentsSorting.nnew) String sorting,
  }) = _CommentsWidgetState;
}