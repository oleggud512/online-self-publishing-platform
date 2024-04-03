
import 'package:client/src/common/pagination/pagination_controller.dart';
import 'package:client/src/features/books/data/book_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../common/log.dart';
import '../../domain/book.dart';
import '../book_filters/books_filters_state.dart';

part 'books_screen_controller.g.dart';

@riverpod
class BooksScreenController extends _$BooksScreenController
    with PaginationController<Book> {
  BookRepository get bookRepo => ref.watch(bookRepositoryProvider);

  @override
  FutureOr<List<Book>> build() async {
    printSuccess('BooksScreenController rebuilt');
    return await getItems(0);
  }

  @override
  @protected
  List<Book> get listState => state.value!;

  @override
  set listState(List<Book> newBooks) {
    printSuccess(newBooks.length);

    state = AsyncData(newBooks);
  }
  
  @override
  @protected
  PaginationItemsCallback<Book> get getItems => (int from) {
    return bookRepo.getBooks(ref.watch(booksFiltersStateProvider), from);
  };


}