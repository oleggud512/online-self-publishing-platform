import 'package:client/src/router/menu_button_leading.dart';
import 'package:client/src/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/utils/debounce.dart';
import '../../../localization/application/ll.dart';
import '../book_filters/books_query_state.dart';


class BooksAppBar extends StatelessWidget implements PreferredSizeWidget {
@override
  final Size preferredSize;

  BooksAppBar({Key? key}) : preferredSize = const Size.fromHeight(56.0), super(key: key);

  final debouncer = Debouncer();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return AppBar(
          leading: const MenuButtonLeading(),
          title: TextFormField(
            initialValue: ref.watch(booksQueryState),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              hintText: curLl(context)!.searchPlaceholder
            ),
            onChanged: (v) {
              debouncer.debounce(() {
                ref.watch(booksQueryState.notifier).state = v;
              });
            }
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.filter_alt_outlined),
              onPressed: () {
                context.goNamed(MyRoute.bookFilters.name);
              }
            )
          ]
        );
      },
    );
  }
}