import 'package:client/src/common/pagination/page_list_widget.dart';
import 'package:client/src/features/auth/application/my_id_provider.dart';
import 'package:client/src/features/messages/application/from_chat_event.dart';
import 'package:client/src/features/messages/domain/chat.dart';
import 'package:client/src/features/messages/presentation/chats/chats_screen_controller.dart';
import 'package:client/src/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../common/constants/constants.dart';
import '../../../../common/pub_sub.dart';
import '../../../../common/widgets/my_avatar.dart';
import '../../domain/message.dart';
import 'chat_screen_controller.dart';
import 'chat_screen_state.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({
    super.key,
    required this.chat
  });

  final Chat chat;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatScreenState();
}
class _ChatScreenState extends ConsumerState<ChatScreen> {
  ChatScreenController get cont => 
      ref.watch(chatScreenControllerProvider(widget.chat).notifier);
  ChatScreenState get state => 
      ref.watch(chatScreenControllerProvider(widget.chat));

  final textCont = TextEditingController();
  final refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    final state = this.state;
    final cont = this.cont;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.pop();
            ref.watch(pubSub.notifier).push(FromChatEvent());
          },
        ),
        title: Text(state.chat.other.displayName ?? state.chat.other.name),
        actions: [
          MyAvatar(url: state.chat.other.avatarUrl ?? "")
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageListWidget(
              paginationController: cont,
              refreshController: refreshController,
              child: ListView.builder(
                reverse: true,
                itemCount: state.messages.length,
                itemBuilder: (context, index) {
                  return buildMessage(state.messages[index]);
                }
              )
            )
          ),
          Padding(
            padding: const EdgeInsets.all(p8),
            child: TextFormField(
              controller: textCont,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    cont.send(textCont.text);
                    textCont.clear();
                  },
                )
              ),
            )
          )
        ]
      )
    );
  }

  Widget buildMessage(Message message) { 
    bool my = ref.watch(myIdProvider) == message.from.id;
    return ListTile(
      leading: my ? null : MyAvatar(url: message.from.avatarUrl ?? ""),
      trailing: !my ? null : MyAvatar(url: message.from.avatarUrl ?? ""),
      title: Text(message.content),
      subtitle: Text("${my ? "me" : message.from.name} ${Constants.dateFormat.format(message.createdAt)}")
    );
  }
}