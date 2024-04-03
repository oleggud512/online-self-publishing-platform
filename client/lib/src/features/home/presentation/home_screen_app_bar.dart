import 'package:client/src/features/localization/application/ll.dart';
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
      title: Text(curLl(context)!.screenTitle.home)
    );
  }
}