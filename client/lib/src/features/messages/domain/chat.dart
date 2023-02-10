import 'package:freezed_annotation/freezed_annotation.dart';

import '../../profile/domain/profile.dart';
import 'message.dart';

part 'chat.freezed.dart';
// part 'chat.g.dart';

@Freezed(toJson: false, fromJson: false)
class Chat with _$Chat {
  factory Chat({
    required Profile other,
    @Default("") String firstMessage,
    Profile? me,
    List<Message>? messages,
  }) = _Chat;
}