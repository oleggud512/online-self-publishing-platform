import 'package:client/src/common/build_context_ext.dart';
import 'package:client/src/common/constants/constants.dart';
import 'package:client/src/common/pagination/page_list_widget.dart';
import 'package:client/src/common/pagination/pagination_controller.dart';
import 'package:client/src/common/pagination/pagination_list_widget_controller.dart';
import 'package:client/src/common/widgets/error_handler.dart';
import 'package:client/src/features/books/presentation/book_list/book_list_item_widget.dart';
import 'package:client/src/shared/pagination_list_callback_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../books/domain/book.dart';

class PopularBooksScreen extends ConsumerWidget {
  PopularBooksScreen({super.key});

  PaginationItemsCallback<Book>? callback;
  RefreshController refreshController = RefreshController();
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    callback ??= PaginationCallbackFactory.instance
      .createPopularBooksCallback(ref);
    final cont = ref.watch(paginationListWidgetControllerProvider(callback!)
      .notifier);
    final state = ref.watch(paginationListWidgetControllerProvider(callback!));
    return Scaffold(
      appBar: AppBar(title: Text(context.ll!.book.popularBooks)),
      body: state.when(
        data: (books) => PageListWidget(
          paginationController: cont,
          refreshController: refreshController,
          child: ListView.separated(
            padding: const EdgeInsets.all(p16),
            separatorBuilder: (_, __) => h16gap,
            itemCount: books.length,
            itemBuilder: (context, i) {
              return BookListItemWidget(
                listDirection: Axis.vertical, 
                book: books[i] as Book
              );
            }
          )
        ),
        loading: defaultLoading,
        error: defaultErrorHandler
      )
    );
  }
}


