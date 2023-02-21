import 'package:client/src/common/hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../common/constants/constants.dart';
import '../../../../common/pagination/page_list_widget.dart';
import '../../../../common/widgets/error_handler.dart';
import '../../../books/presentation/book_list/book_list_item_widget.dart';
import 'bookmarks_screen_controller.dart';

class BookmarksScreen extends ConsumerWidget {
  BookmarksScreen({super.key});

  final refreshController = RefreshController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bookmarksScreenControllerProvider);
    final cont = ref.watch(bookmarksScreenControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text('bookmarks'.hardcoded)
      ),
      body: state.when(
        data: (books) => PageListWidget(
          paginationController: cont, 
          refreshController: refreshController, 
          child: ListView.separated(
            padding: const EdgeInsets.all(p8),
            separatorBuilder: (context, i) => h8gap,
            itemCount: books.length,
            itemBuilder: (context, index) {
              return BookListItemWidget(book: books[index]);
            },
          ),
        ),
        loading: defaultLoading,
        error: defaultErrorHandler
      ),
    );
  }
}