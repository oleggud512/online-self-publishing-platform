import 'package:client/src/features/books/data/local_book_repository.dart';
import 'package:client/src/features/profile/data/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/log.dart';

part 'local_bookmarks_provider.g.dart';

final bookmarksStreamProvider = StreamProvider<List<String>>(
  (ref) => ref.watch(localBookRepositoryProvider).watchBookmarks(),
  dependencies: [
    localBookRepositoryProvider // because it will be overwriten
  ]
);

@Riverpod(keepAlive: true)
class LocalBookmarksController extends _$LocalBookmarksController {
  @override
  List<String> build() {
    final value = ref.watch(bookmarksStreamProvider).value;
    printSuccess("LocalBookmarksController built $value");
    return ref.watch(bookmarksStreamProvider).value ?? [];
  }

  bool isBookmarked(String bookId) {
    return state.contains(bookId);
  }

  Future<void> syncBookmarks() async {
    try {
      await ref.watch(profileRepositoryProvider).saveBookmarks(state);
      await ref.watch(localBookRepositoryProvider).deleteBookmarks();
    } catch (e) {
      rethrow;
    }
  }
}