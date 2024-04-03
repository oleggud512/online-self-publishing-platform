import 'package:client/src/common/widgets/error_handler.dart';
import 'package:client/src/features/messages/presentation/chats/chats_screen_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../common/constants/constants.dart';
import '../../../../common/pagination/page_list_widget.dart';
import '../../../../shared/constants.dart';
import '../../domain/chat.dart';
import 'chat_widget.dart';
import 'chats_screen_controller.dart';
import 'chats_screen_state.dart';

class ChatsScreen extends ConsumerStatefulWidget {
  const ChatsScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatsScreenState();
}
class _ChatsScreenState extends ConsumerState<ChatsScreen> {
  ChatsScreenController get cont => ref.watch(chatsScreenControllerProvider.notifier);
  AsyncValue<ChatsScreenState> get state => ref.watch(chatsScreenControllerProvider);

  final refreshController = RefreshController();

  openChat(Chat chat) {
    context.pushNamed(MyRoute.chat.name, 
      pathParameters: {
        'id': chat.other.id,
      },
      extra: chat
    );
  }

  @override
  Widget build(BuildContext context) {
    return state.when(
      data: (state) {
        return Scaffold(
          appBar: const ChatsScreenAppBar(),
          body: Column(
            children: [
              Expanded(
                child: PageListWidget(
                  paginationController: cont,
                  refreshController: refreshController, 
                  child: ListView.builder(
                    itemCount: state.chats.length,
                    itemBuilder: (context, index) {
                      return ChatWidget(
                        chat: state.chats[index], 
                        onTap: () => openChat(state.chats[index])
                      );
                    },
                  ),
                ),
              ),
              if (state.adminChats != null) ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: p200),
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int index = 0; index < state.adminChats!.length; index++) ChatWidget(
                          chat: state.adminChats![index],
                          // onTap: openChat(state.chats[index]),
                          onTap: () => openChat(state.adminChats![index])
                        )
                      ]
                    ),
                  ),
                )
              )
            ],
          ),
        );
      },
      loading: defaultLoading,
      error: defaultErrorHandler
    );
  }
}