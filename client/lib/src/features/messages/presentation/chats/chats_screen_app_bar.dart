import 'package:client/src/common/build_context_ext.dart';
import 'package:flutter/material.dart';

class ChatsScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
@override
  final Size preferredSize;

  const ChatsScreenAppBar({Key? key}) : preferredSize = const Size.fromHeight(56.0), super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(context.ll!.screenTitle.messages)
    );
  }
}