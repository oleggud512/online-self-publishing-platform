
import 'package:client/src/common/log.dart';
import 'package:client/src/features/auth/application/my_id_provider.dart';
import 'package:client/src/features/books/data/book_repository.dart';
import 'package:client/src/features/books/domain/book.dart';
import 'package:client/src/features/books/presentation/book_list/book_list_item_widget_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/local_bookmarks_provider.dart';

part 'book_list_item_widget_controller.g.dart';

@riverpod
class BookListItemWidgetController extends _$BookListItemWidgetController {
  BookRepository get bookRepo => ref.watch(bookRepositoryProvider);

  @override
  BookListItemWidgetState build(Book book) {
    printSuccess('building BookListItemWidgetController state = ${book.state} bookmarked = ${book.bookmarked ?? "null"}'); 
    return BookListItemWidgetState(
      book: book.copyWith(
        bookmarked: ref.watch(myIdProvider) == null 
          ? ref.watch(localBookmarksControllerProvider.notifier) 
              .isBookmarked(book.id) 
          : book.bookmarked 
      ),
      isMy: ref.watch(myIdProvider) == book.author.id
    );
  }

  Future<bool> toggleBookmark() async {
    final isToggled = await bookRepo.toggleBookmark(state.book.id);
    state = state.copyWith(book: state.book.toggleBookmark());
    return isToggled;
  }

}