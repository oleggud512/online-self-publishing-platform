import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/comment.dart';

part 'comment_widget_state.freezed.dart';

@freezed
class CommentWidgetState with _$CommentWidgetState {
  factory CommentWidgetState({
    required Comment comment,
    @Default(false) isFieldShown,
    @Default("") String fieldState,
    @Default(false) bool isEdit,
    @Default("") String editState
  }) = _CommentWidgetState; 
}