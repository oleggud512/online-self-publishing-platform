
import 'package:client/src/common/log.dart';
import 'package:client/src/features/auth/application/my_id_provider.dart';
import 'package:client/src/features/books/data/book_repository.dart';
import 'package:client/src/features/books/domain/book.dart';
import 'package:client/src/features/books/presentation/book_list/book_list_item_widget_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../common/pub_sub.dart';
import '../../application/local_bookmarks_provider.dart';

part 'book_list_item_widget_controller.g.dart';

class BookmarkStateChanged extends PubSubEvent {
  String bookId;
  bool newBookmarked;

  BookmarkStateChanged(this.bookId, this.newBookmarked);
}

@riverpod
class BookListItemWidgetController extends _$BookListItemWidgetController {
  BookRepository get _bookRepo => ref.watch(bookRepositoryProvider);

  @override
  BookListItemWidgetState build(Book book) {
    printSuccess('building BookListItemWidgetController state = ${book.state} bookmarked = ${book.bookmarked ?? "null"}'); 
    printInfo(book.bookmarked);
    listen();
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

  void listen() {
    ref.listen(pubSub, (prev, next) {
      if (next is BookmarkStateChanged && next.bookId == state.book.id) {
        state = state.copyWith.book(bookmarked: next.newBookmarked);
      }
    });
  }
  Future<bool> toggleBookmark() async {
    final isToggled = await _bookRepo.toggleBookmark(state.book.id);
    state = state.copyWith(book: state.book.toggleBookmark());
    if (isToggled) {
      ref.watch(pubSub.notifier)
        .push(BookmarkStateChanged(state.book.id, state.book.bookmarked!));
    }
    return isToggled;
  }

}
