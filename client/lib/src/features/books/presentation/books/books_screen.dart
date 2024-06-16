import 'package:client/src/common/pagination/page_list_widget.dart';
import 'package:client/src/shared/errors/exceptions.dart';
import 'package:client/src/features/books/presentation/book_list/book_list_item_widget.dart';
import 'package:client/src/features/books/presentation/books/books_screen_controller.dart';
import 'package:client/src/shared/errors/map_error_to_widget.dart';
import 'package:client/src/shared/errors/widgets/default_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../common/constants/constants.dart';
import 'books_screen_app_bar.dart';

class BooksScreen extends ConsumerStatefulWidget {
  const BooksScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BooksScreenState();
}
class _BooksScreenState extends ConsumerState<BooksScreen> {
  final refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(booksScreenControllerProvider);
    final cont = ref.watch(booksScreenControllerProvider.notifier);
    
    return Scaffold(
      appBar: BooksAppBar(),
      body: state.when(
        data: (books) => PageListWidget(
          paginationController: cont, 
          refreshController: refreshController, 
          child: ListView.separated(
            padding: const EdgeInsets.all(p16),
            separatorBuilder: (context, i) => h8gap,
            itemCount: books.length,
            itemBuilder: (context, index) {
              return BookListItemWidget(book: books[index]);
            },
          ),
        ),
        loading: defaultLoading,
        error: mapErrorToWidget,
      )
    );
  }
}