import 'package:client/src/features/messages/domain/chat.dart';
import 'package:client/src/router/router.dart';
import 'package:client/src/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/my_avatar.dart';

class ChatWidget extends ConsumerStatefulWidget {
  const ChatWidget({super.key, required this.chat});

  final Chat chat;

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends ConsumerState<ChatWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () { 
        context.pushNamed(MyRoute.chat.name, 
          params: {
            'id': widget.chat.other.id,
          },
          extra: widget.chat
        );
      },
      leading: MyAvatar(url: widget.chat.other.id),
      title: Text(widget.chat.other.displayName ?? widget.chat.other.name),
      subtitle: Text(widget.chat.lastMessage),
    );
  }
}