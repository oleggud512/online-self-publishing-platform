import 'package:freezed_annotation/freezed_annotation.dart';

import '../../profile/domain/profile.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@Freezed(toJson: false)
class Chat with _$Chat {
  factory Chat({
    required Profile other,
    @Default("") String lastMessage,
  }) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}

chatListFromJson(List<dynamic> list) {
  return list.map((c) => Chat.fromJson(c as Map<String, dynamic>))
    .toList();
}