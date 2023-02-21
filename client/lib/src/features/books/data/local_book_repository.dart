import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_book_repository.g.dart';

abstract class LocalBookRepository {


  // Future<void> addBookmark(String bookId);
  // Future<void> removeBookmark(String bookId);
  Future<void> toggleBookmark(String bookId);

  // Future<List<String>> getBookmarks();
  // Future<bool> isBookmarked(String bookId);
  Future<void> deleteBookmarks();
  Stream<List<String>> watchBookmarks();
  Future<List<String>> getBookmarks();
}

@Riverpod(keepAlive: true)
LocalBookRepository localBookRepository(LocalBookRepositoryRef ref) {
  // * Override this in the main method
  throw UnimplementedError();
}