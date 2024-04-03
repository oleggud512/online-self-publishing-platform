import 'package:client/src/common/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

    return Align(
      alignment: my ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          color: my ? Theme.of(context).colorScheme.surfaceVariant : null,
          border: Border.all(color: Theme.of(context).colorScheme.outline),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(p16),
            topRight: const Radius.circular(p16),
            bottomLeft: my ? const Radius.circular(p16) : Radius.zero,
            bottomRight: !my ? const Radius.circular(p16) : Radius.zero
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(p16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: p128,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // if (!my) ...[
                //   Text(message.from.displayName ?? message.from.name,
                //     style: Theme.of(context).textTheme.labelSmall?.copyWith(
                //       color: Theme.of(context).colorScheme.outline
                //     )
                //   ),
                //   h8gap
                // ],
                Text(message.content),
                Text(Constants.dateFormat.format(message.createdAt), 
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.outline
                  )
                )
              ]
            ),
          )
        )
      )
    );
    // return ListTile(
    //   leading: my ? null : MyAvatar(url: message.from.avatarUrl ?? ""),
    //   trailing: !my ? null : MyAvatar(url: message.from.avatarUrl ?? ""),
    //   title: Text(message.content),
    //   subtitle: Text("${my ? "me" : message.from.name} ${Constants.dateFormat.format(message.createdAt)}")
    // );
  }
}
