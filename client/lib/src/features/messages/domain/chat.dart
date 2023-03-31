import 'package:freezed_annotation/freezed_annotation.dart';

import '../../profile/domain/profile.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

enum ChatSource {
  admin, 
  user
}

@Freezed(toJson: false)
class Chat with _$Chat {
  factory Chat({
    @Default(ChatSource.user) ChatSource source,
    required Profile other,
    @Default("") String lastMessage,
  }) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}

chatListFromJson(List<dynamic> list) {
  return list.map((c) => Chat.fromJson(c as Map<String, dynamic>))
    .toList();
}