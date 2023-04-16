import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/common/pagination/pagination_list_widget_controller.dart';
import 'package:client/src/features/books/application/books_changed_event.dart';
import 'package:client/src/features/localization/application/current_localization.dart';
import 'package:client/src/shared/constants.dart';
import 'package:client/src/shared/pagination_list_callback_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/log.dart';
import '../../../../common/pagination/pagination_controller.dart';
import '../../../../common/pagination/simple_pagination_list_screen.dart';
import '../../../../common/pub_sub.dart';
import '../../../auth/application/my_id_provider.dart';
import '../../data/book_repository.dart';
import '../../domain/book.dart';
import '../../domain/filters.dart';
import '../book_list/book_list_item_widget.dart';

class ProfileBooksScreen extends ConsumerWidget {
  ProfileBooksScreen({
    super.key,
    required this.ofProfile
  });

  final String ofProfile;

  PaginationItemsCallback<Book>? callback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    callback ??= PaginationCallbackFactory.instance
          .createProfileBooksCallback(ref, ofProfile);
    final cont = ref.watch(paginationListWidgetControllerProvider(callback!).notifier);
    ref.listen(pubSub, (prev, next) {
      if (next is BooksChangedEvent) cont.refresh();
    });
    final ll = ref.watch(currentLocalizationProvider);

    return Scaffold(
      body: SimplePaginationListScreen<Book>(
        callback: callback!,
        title: ll.screenTitle.profileBooks,
        itemBuilder: (context, item) {
          return BookListItemWidget(book: item);
        },
      ),
      floatingActionButton: ofProfile == ref.watch(myIdProvider) 
        ? FloatingActionButton.extended(
          onPressed: () {
            context.pushNamed(MyRoute.addBook.name,
              params: { 'id': ofProfile }
            );
          }, 
          icon: const Icon(Icons.add),
          label: Text(ll.book.addNewBook)
        ) 
        : null,
    );
  }
}
