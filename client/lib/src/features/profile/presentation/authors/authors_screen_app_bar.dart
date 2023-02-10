import 'package:client/src/features/localization/application/ll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/log.dart';

class AuthorsAppBar extends StatelessWidget with PreferredSizeWidget {
@override
  final Size preferredSize;

  AuthorsAppBar({Key? key}) : preferredSize = const Size.fromHeight(56.0), super(key: key);

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
              printInfo('authors query changed: $v');
            }
          )
        );
      },
    );
  }
}