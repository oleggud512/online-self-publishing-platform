import 'package:client/src/features/messages/domain/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/widgets/my_avatar.dart';

class ChatWidget extends ConsumerStatefulWidget {
  const ChatWidget({super.key, required this.chat, required this.onTap});

  final Chat chat;
  final VoidCallback onTap;

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends ConsumerState<ChatWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onTap,
      leading: MyAvatar(url: widget.chat.other.id),
      title: Text(widget.chat.other.displayName ?? widget.chat.other.name),
      subtitle: Text(widget.chat.lastMessage),
    );
  }
}