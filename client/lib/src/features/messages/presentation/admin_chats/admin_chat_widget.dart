import 'package:client/src/features/messages/domain/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminChatWidget extends ConsumerWidget {
  AdminChatWidget({super.key, required this.chat});

  Chat chat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}