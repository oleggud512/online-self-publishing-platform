import 'package:client/src/features/localization/application/ll.dart';
import 'package:client/src/features/profile/presentation/authors/authors_query_state.dart';
import 'package:client/src/router/menu_button_leading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/utils/debounce.dart';

class AuthorsAppBar extends StatelessWidget implements PreferredSizeWidget {
  AuthorsAppBar({Key? key}) : preferredSize = const Size.fromHeight(56.0), super(key: key);
  
  @override
  final Size preferredSize;

  final debouncer = Debouncer();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return AppBar(
          leading: const MenuButtonLeading(),
          title: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              hintText: curLl(context)!.searchPlaceholder
            ),
            onChanged: (v) {
              debouncer.debounce(
                () => ref.read(authorsQueryStateProvider.notifier).state = v
              );
            }
          )
        );
      },
    );
  }
}