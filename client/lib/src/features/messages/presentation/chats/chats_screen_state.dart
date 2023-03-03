import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/chat.dart';

part 'chats_screen_state.freezed.dart';

@freezed
class ChatsScreenState with _$ChatsScreenState {
  factory ChatsScreenState({
    required List<Chat> chats
  }) = _ChatsScreenState;
}