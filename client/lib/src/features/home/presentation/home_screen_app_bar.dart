import 'package:client/src/common/build_context_ext.dart';
import 'package:client/src/router/menu_button_leading.dart';
import 'package:flutter/material.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
@override
  final Size preferredSize;

  const HomeScreenAppBar({Key? key}) : preferredSize = const Size.fromHeight(56.0), super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const MenuButtonLeading(),
      title: Text(context.ll!.screenTitle.home)
    );
  }
}