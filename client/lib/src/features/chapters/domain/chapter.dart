import 'package:client/src/features/books/domain/book.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/ignore.dart';
import '../../comments/domain/comment.dart';

part 'chapter.freezed.dart';
part 'chapter.g.dart';

@freezed
class Chapter with _$Chapter {
  factory Chapter({
    @JsonKey(name: "_id") @Default("") String id,
    @Default("") String name,
    @Default("") String content,
    @JsonKey(toJson: ignore, includeIfNull: false) Book? book,
    @JsonKey(toJson: ignore, includeIfNull: false) List<Comment>? comments,
  }) = _Chapter;

  factory Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);
}