import 'package:freezed_annotation/freezed_annotation.dart';

import '../../profile/domain/profile.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  factory Comment({
    @JsonKey(name: "_id") @Default("") String id,
    required Profile author,
    @Default("") String content,
    @Default(0) likes,

    required DateTime createdAt,
    required DateTime updatedAt
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
}