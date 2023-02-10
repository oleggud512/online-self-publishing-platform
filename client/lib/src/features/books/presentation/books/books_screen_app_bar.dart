import 'package:client/src/common/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../localization/application/ll.dart';


class BooksAppBar extends StatelessWidget with PreferredSizeWidget {
@override
  final Size preferredSize;

  BooksAppBar({Key? key}) : preferredSize = const Size.fromHeight(56.0), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return AppBar(
          title: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              hintText: curLl(context)!.searchPlaceholder
            ),
            onChanged: (v) {
              printInfo('books query changed: $v');
            }
          )
        );
      },
    );
  }
}