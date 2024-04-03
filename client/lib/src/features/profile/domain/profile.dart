import 'package:client/src/common/ignore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/identifiable.dart';
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
class Profile with _$Profile, Identifiable {
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
    @JsonKey(toJson: ignore, includeIfNull: false) List<Book>? books,
    // подписан ли я на этого пользователя. Null, если я без аккаунта
    @JsonKey(toJson: ignore, includeIfNull: false) bool? isSubscribed,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
}

extension ProfileExt on Profile {
  Profile setSubscribed(bool subscribed) {
    return copyWith(
      subscribers: subscribed ? (subscribers ?? 0) + 1 : subscribers! - 1,
      isSubscribed: subscribed
    );
  }
}

profileListFromJson(List<dynamic> list) {
  return list.map((p) => Profile.fromJson(p as Map<String, dynamic>))
    .toList();
}