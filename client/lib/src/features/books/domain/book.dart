import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../common/ignore.dart';
import '../../chapters/domain/chapter.dart';
import '../../comments/domain/comment.dart';
import '../../profile/domain/profile.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
class Book with _$Book {
  factory Book({
    @JsonKey(name: "_id") @Default("") String id, //     persistent // just always will be here
    required Profile author,                      // add persistent // required for addiction a new book
    String? coverUrl,                            //     persistent
    @Default("") String name,                     //     persistent
    String? description,                          //     persistent
    @Default(0) int likes,                        //     persistent
    @JsonKey(toJson: ignore, includeIfNull: false) List<String>? tags,                           // optional
    @JsonKey(toJson: ignore, includeIfNull: false) List<String>? genres,                         // optional
    @JsonKey(toJson: ignore, includeIfNull: false) List<Comment>? comments,                      // optional
    @JsonKey(toJson: ignore, includeIfNull: false) List<Chapter>? chapters                       // optional
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}