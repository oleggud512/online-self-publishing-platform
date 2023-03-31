import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/widgets/my_avatar.dart';
import '../../../../shared/constants.dart';
import '../../domain/message.dart';

class MessageWidget extends ConsumerWidget {
  const MessageWidget({
    super.key,
    required this.isMy,
    required this.message
  });

  final Message message;
  final bool Function(Message message) isMy;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool my = isMy(message);
    return ListTile(
      leading: my ? null : MyAvatar(url: message.from.avatarUrl ?? ""),
      trailing: !my ? null : MyAvatar(url: message.from.avatarUrl ?? ""),
      title: Text(message.content),
      subtitle: Text("${my ? "me" : message.from.name} ${Constants.dateFormat.format(message.createdAt)}")
    );
  }
}