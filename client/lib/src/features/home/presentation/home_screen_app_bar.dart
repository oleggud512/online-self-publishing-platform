import 'package:client/src/features/localization/application/ll.dart';
import 'package:flutter/material.dart';

class HomeScreenAppBar extends StatelessWidget with PreferredSizeWidget {
@override
  final Size preferredSize;

  HomeScreenAppBar({Key? key}) : preferredSize = const Size.fromHeight(56.0), super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(curLl(context)!.screenTitle.home)
    );
  }
}