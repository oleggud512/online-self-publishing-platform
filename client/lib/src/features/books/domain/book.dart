import 'package:client/src/features/books/domain/filtering_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../common/ignore.dart';
import '../../../shared/identifiable.dart';
import '../../chapters/domain/chapter.dart';
import '../../comments/domain/comment.dart';
import '../../profile/domain/profile.dart';

part 'book.freezed.dart';
part 'book.g.dart';

enum BookStatus { completed, inProgress, abandoned }

enum ReadingsState { published, unpublished }

ReadingsState readingsStateFromString(String readingsState) {
  return ReadingsState.values
      .firstWhere((state) => state.name == readingsState);
}

Profile _authorFromJson(Map<String, dynamic> json) {
  return Profile.fromJson(json);
}

String _authorToJson(Profile author) {
  return author.id;
}

@freezed
class Book with _$Book, Identifiable {
  factory Book({
    @JsonKey(name: "_id") @Default("") String id, //     persistent // just always will be here
    @JsonKey(
      toJson: _authorToJson,
      fromJson: _authorFromJson
    ) required Profile author,                      // add persistent // required for addiction a new book
    String? coverUrl,                            //     persistent
    @Default("") String name,                     //     persistent
    String? description,                          //     persistent
    @Default(0) int likes,                        //     persistent
    @Default(BookStatus.inProgress) BookStatus status,
    @Default(ReadingsState.unpublished) ReadingsState state,
    @Default([]) List<String> tags,                           // optional
    @Default([]) List<String> genres,                         // optional
    @JsonKey(toJson: ignore, includeIfNull: false) List<Comment>? comments,                      // optional
    @JsonKey(toJson: ignore, includeIfNull: false) List<Chapter>? chapters,                       // optional
  
    @Default(false) bool liked,                       // optional
    bool? bookmarked
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}

List<Book> bookListFromJson(List<dynamic> list) { 
  return list.map((e) => Book.fromJson(e as Map<String, dynamic>)).toList();
}


extension Lifetime on Book {
  bool exists() => id.isNotEmpty;
}

extension Like on Book {
  Book toggleLike() {
    return copyWith(
      likes: liked ? likes - 1 : likes + 1,
      liked: !liked
    );
  }
}

extension BookmarkExt on Book {
  Book toggleBookmark() {
    return copyWith(
      bookmarked: bookmarked == null ? true : !bookmarked!
    );
  }
}