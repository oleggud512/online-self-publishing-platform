import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/common/widgets/error_handler.dart';
import 'package:client/src/features/localization/application/current_locale.dart';
import 'package:client/src/features/localization/application/current_localization.dart';
import 'package:client/src/features/messages/presentation/chats/chats_screen_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../common/constants/constants.dart';
import '../../../../common/pagination/page_list_widget.dart';
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

  @override
  Widget build(BuildContext context) {
    return state.when(
      data: (state) {
        return Scaffold(
          appBar: ChatsScreenAppBar(),
          body: PageListWidget(
            paginationController: cont,
            refreshController: refreshController, 
            child: ListView.builder(
              itemCount: state.chats.length,
              itemBuilder: (context, index) {
                return ChatWidget(chat: state.chats[index]);
              },
            ),
          ),
        );
      },
      loading: defaultLoading,
      error: defaultErrorHandler
    );
  }
}