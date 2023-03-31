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
    @Default(ReadingsState.unpublished) ReadingsState state,
    // @JsonKey(name: 'book') required String bookId,
    required Book book,
    @JsonKey(toJson: ignore, includeIfNull: false) List<Comment>? comments,

    DateTime? createdAt,
    DateTime? updatedAt
  }) = _Chapter;

  factory Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);
}

chapterListFromJson(List<dynamic> list) {
  return list.map((c) => Chapter.fromJson(c as Map<String, dynamic>))
    .toList();
}

extension ChapterStateExtension on Chapter {
  bool get isPublished => state == ReadingsState.published;
  bool get isUnpublished => state == ReadingsState.unpublished;
}

extension ChapterLifecycleExtension on Chapter { 
  bool exists() => id.isNotEmpty;
}