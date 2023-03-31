import 'dart:async';

import 'package:client/src/common/log.dart';
import 'package:client/src/features/auth/application/my_id_provider.dart';
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
      with PaginationController<Message> {
  ChatRepository get chatRepo => ref.watch(chatRepositoryProvider);

  NextMessageHandler? nextMessageHandeler;

  @override
  ChatScreenState build(Chat chat) {
    printWarning("on ChatScreenController build");
    
    if (chat.source == ChatSource.admin) { 
      printSuccess("admin");
      nextMessageHandeler = NextMessageHandler(_onNextMessage, chat.other.id);
    } else if (chat.source == ChatSource.user) {
      printSuccess("user");
      nextMessageHandeler = NextMessageHandler(_onNextMessage);
    }

    ref.onDispose(() async {
      printWarning("on ChatScreenController dispose");
      await nextMessageHandeler?.dispose();
    });
    Future(refresh);
    return ChatScreenState(chat: chat);
  }

  /// adds next message
  void _onNextMessage(Message nextMessage) {
    // nextMessageHandler by default handles messages from any user to this user. 
    // here we filter them to only of this user or the other user. 
    // chat.other.id - reportId nextMessage.from.id
    // [state.chat.other.id, ref.watch(myIdProvider)].contains(nextMessage.from.id) 
    if (![ref.watch(myIdProvider), state.chat.other.id].contains(nextMessage.from.id)) return;
    printInfo("messageArrived");
    // if (![
    //   nextMessage.from.id, 
    //   ref.watch(myIdProvider),
    //   // nextMessage.to,
    //   ].contains(state.chat.other.id)) return;
    state = state.copyWith(
      messages: [nextMessage, ...state.messages]
    );
  }

  /*
  Chat {
    other: Profile {
      id
      name
    }
    lastMessage: string
  }
  messages: [
    Message {
      from: Profile {
        id
        name
      }
      to: string
      content: string

      createdAt: Date
      updatedAt: Date
    }
  ]
  когда слушаем сообщения из сокета то там нам приходят сообщения 
  от любого пользователя к этому пользователя и 
  от этого пользователя к любому пользователю

  в случае если это админский чат то будет
  от любого репорта к этому пользователю и 
  от этого пользователя к любому репорту

  from.id - reportId / myId
  to - reportId / myId
  */

  void send(String content) async {
    switch (state.chat.source) {
      case ChatSource.admin:
        await chatRepo.addAdminMessage(state.chat.other.id, content);
        break;
      case ChatSource.user:
        await chatRepo.addMessage(state.chat.other.id, content);
        break;
      default:
    }
  }
  
  @override
  List<Message> get listState => state.messages;

  @override
  set listState(List<Message> newMessages) => 
      state = state.copyWith(messages: newMessages);
  
  @override
  PaginationItemsCallback<Message> get getItems => (int from) {
    switch (state.chat.source) {
      case ChatSource.admin: return chatRepo.getAdminMessages(state.chat.other.id, from);
      case ChatSource.user: return chatRepo.getMessages(state.chat.other.id, from);
    }
  };
}