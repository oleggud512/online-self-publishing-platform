
import 'package:client/src/common/pagination/pagination_controller.dart';
import 'package:client/src/features/books/domain/book.dart';
import 'package:client/src/features/profile/data/profile_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bookmarks_screen_controller.g.dart';

@riverpod
class BookmarksScreenController extends _$BookmarksScreenController 
    with PaginationController<Book> {

  @override
  FutureOr<List<Book>> build() {
    return getItems(0);
  }

  @override
  @protected
  PaginationItemsCallback<Book> get getItems => (int from) {
    return ref.watch(profileRepositoryProvider).getBookmarks(from);
  };

  @override
  @protected
  set listState(List<Book> newBooks) => state = AsyncData(newBooks);

  @override
  @protected
  List<Book> get listState => state.value!;

}