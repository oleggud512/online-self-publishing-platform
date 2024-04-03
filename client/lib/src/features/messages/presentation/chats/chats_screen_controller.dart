
import 'dart:async';

import 'package:client/src/common/log.dart';
import 'package:client/src/common/pagination/pagination_controller.dart';
import 'package:client/src/features/messages/data/chat_repository.dart';
import 'package:client/src/features/messages/domain/chat.dart';
import 'package:client/src/features/messages/presentation/chats/chats_screen_state.dart';
import 'package:client/src/shared/socket.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/message.dart';

part 'chats_screen_controller.g.dart';

@riverpod
class ChatsScreenController extends _$ChatsScreenController 
    with PaginationController<Chat>{
  ChatRepository get chatRepo => ref.watch(chatRepositoryProvider);

  NextMessageHandler? nextMessageHandeler;
  
  @override
  FutureOr<ChatsScreenState> build() async {
    printInfo('on ChatsScreenController build');
    nextMessageHandeler = NextMessageHandler(_onNextMessage);
    ref.onDispose(() async {
      printInfo("on ChatsScreenController dispose nextMessageHandeler = ($nextMessageHandeler)");
      await nextMessageHandeler?.dispose();
    });

    ref.onCancel(() {
      printInfo('on ChatsScreenController cancel');
    });
    ref.onResume(() {
      printInfo('on ChatsScreenController resume');
    });
    final chats = await getItems(0);
    Future(() => loadAdminChats());
    return ChatsScreenState(chats: chats);
  }

  Future<void> loadAdminChats() async {
    state = AsyncData(state.value!.copyWith(
      adminChats: await chatRepo.getAdminChats()
    ));
  }

  /// populates some chat
  void _onNextMessage(Message nextMessage) {
    Chat? chatToUpdate;

    try {
      chatToUpdate = state.value!.chats.firstWhere(
        (chat) => [nextMessage.from.id, nextMessage.to].contains(chat.other.id)
      );
    } catch (e) {
      return;
    }

    Chat newChat = chatToUpdate.copyWith(lastMessage: nextMessage.content);
    
    state = AsyncData(state.value!.copyWith(
      chats: List<Chat>.from(state.value!.chats)..replaceRange(
        state.value!.chats.indexOf(chatToUpdate),
        state.value!.chats.indexOf(chatToUpdate) + 1,
        [newChat]
      )
    ));
  }
  
  @override
  List<Chat> get listState => state.value!.chats;

  @override 
  set listState(List<Chat> newChats) => 
      state = AsyncData(state.value!.copyWith(chats: newChats));
  
  @override
  PaginationItemsCallback<Chat> get getItems => (int from) {
    return chatRepo.getChats(from);
  };
}