import 'package:client/src/features/auth/application/my_id_provider.dart';
import 'package:client/src/features/books/data/book_repository.dart';
import 'package:client/src/features/books/domain/book.dart';
import 'package:client/src/features/books/presentation/book/book_screen_state.dart';
import 'package:client/src/features/localization/application/current_localization.dart';
import 'package:client/src/features/localization/data/localization_controller.dart';
import 'package:client/src/shared/scaffold_messanger.dart';
import 'package:client/src/shared/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/local_bookmarks_provider.dart';

part 'book_screen_controller.g.dart';

@riverpod
class BookScreenController extends _$BookScreenController {
  BookRepository get bookRepo => ref.watch(bookRepositoryProvider);

  @override
  FutureOr<BookScreenState> build(String bookId) async {
    final book = await bookRepo.getBook(bookId);
    return BookScreenState(
      book: book.copyWith(
        bookmarked: ref.watch(myIdProvider) == null 
          ? ref.watch(localBookmarksControllerProvider.notifier)
              .isBookmarked(book.id)
          : book.bookmarked 
      ),
      isMy: ref.watch(myIdProvider) == book.author.id,
    );
  }

  Future<void> refresh() async {
    try {
      state = AsyncData(state.value!.copyWith(book: await bookRepo.getBook(bookId)));
    } catch (e) {
      Utils.showMessage(ref, "Can't refresh book");
    }
  }

  Future<bool> toggleLike() async {
    final isToggled = await bookRepo.toggleLike(state.value!.book.id);
    if (isToggled) {
      state = AsyncData(state.value!.copyWith(book: state.value!.book.toggleLike()));
    }
    return isToggled;
  }

  Future<bool> toggleBookmark() async {
    final isToggled = await bookRepo.toggleBookmark(state.value!.book.id);
    state = AsyncData(state.value!.copyWith(book: state.value!.book.toggleBookmark()));
    return isToggled;
  }
  
  void bookUpdated(Book newBook) {
    state = AsyncValue.data(state.value!.copyWith(book: newBook));
  }

  void changeBookState() async {
    try {
      final newState = await bookRepo.changeState(state.value!.book.id);
      state = AsyncData(
        state.value!.copyWith(
          book: state.value!.book.copyWith(
            state: newState
          )
        )
      );
    } on StateChangeNotPermitted catch (_) {
      Utils.showMessage(ref, ref.watch(currentLocalizationProvider).errors.cantPublish);
    }
  }
}
