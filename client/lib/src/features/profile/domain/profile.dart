import 'package:client/src/common/ignore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../books/domain/book.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

enum Gender {
  m,
  f,
  other,
  preferNotToSay
}

@freezed
class Profile with _$Profile {
  factory Profile({
    @JsonKey(name: "_id") @Default("") String id,
    @Default("") String name,
    String? avatarUrl,
    String? displayName,
    String? description,
    int? age,
    Gender? gender,
    @Default("") String email,
    @JsonKey(toJson: ignore, includeIfNull: false) int? subscribers,
    @JsonKey(toJson: ignore, includeIfNull: false) int? subscriptions,
    @JsonKey(toJson: ignore, includeIfNull: false) int? booksCount,
    @JsonKey(toJson: ignore, includeIfNull: false) List<Book>? books
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
}

// extension ProfileExtension on Profile {
//   bool get isRemote => RegExp(r"http[s]?:\/\/").hasMatch(avatarUrl ?? "");
// }