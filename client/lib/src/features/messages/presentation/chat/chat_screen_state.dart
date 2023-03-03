import 'package:client/src/features/messages/domain/chat.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/message.dart';

part 'chat_screen_state.freezed.dart';

@freezed
class ChatScreenState with _$ChatScreenState {
  factory ChatScreenState({
    required Chat chat,
    @Default([]) List<Message> messages
  }) = _ChatScreenState;
}