import 'dart:async';

import 'package:client/src/common/log.dart';
import 'package:client/src/features/messages/domain/chat.dart';
import 'package:client/src/features/messages/presentation/chat/chat_screen_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../common/pagination/pagination_controller.dart';
import '../../../../shared/socket.dart';
import '../../data/chat_repository.dart';
import '../../domain/message.dart';

part 'chat_screen_controller.g.dart';

@riverpod
class ChatScreenController extends _$ChatScreenController 
      with PaginationController<Message>{
  ChatRepository get chatRepo => ref.watch(chatRepositoryProvider);

  NextMessageHandler? nextMessageHandeler;

  @override
  ChatScreenState build(Chat chat) {
    printWarning("on ChatScreenController build");
    nextMessageHandeler = NextMessageHandler(_addMessage);
    ref.onDispose(() async {
      printWarning("on ChatScreenController dispose");
      await nextMessageHandeler?.dispose();
    });
    Future(refresh);
    return ChatScreenState(chat: chat);
  }

  void _addMessage(Message nextMessage) {
    if (![nextMessage.from.id, nextMessage.to].contains(state.chat.other.id)) return;
    state = state.copyWith(
      messages: [nextMessage, ...state.messages]
    );
  }

  void send(String content) async {
    await chatRepo.addMessage(state.chat.other.id, content);
  }
  
  @override
  List<Message> get listState => state.messages;

  @override
  set listState(List<Message> newMessages) => 
      state = state.copyWith(messages: newMessages);
  
  @override
  PaginationItemsCallback<Message> get getItems => (int from) {
    return chatRepo.getMessages(state.chat.other.id, from);
  };
}