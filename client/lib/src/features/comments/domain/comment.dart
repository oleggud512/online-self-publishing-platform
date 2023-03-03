import 'package:client/src/common/log.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/identifiable.dart';
import '../../profile/domain/profile.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

enum CommentRate {
  @JsonValue(1) like,
  @JsonValue(-1) dislike
}

@freezed
class Comment with _$Comment, Identifiable {
  factory Comment({
    @JsonKey(name: "_id") @Default("") String id,
    required Profile author,
    @Default("") String content,
    @Default("") String subject,
    @Default(0) int depth,
    @Default(0) int rate,

    @Default([]) List<Comment> answers,
    @Default(false) bool hasAnswers,

    CommentRate? myRate,

    required DateTime createdAt,
    required DateTime updatedAt
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
}

List<Comment> commentListFromJson(List<dynamic> list) {
  return list.map((c) => Comment.fromJson(c as Map<String, dynamic>)).toList();
}