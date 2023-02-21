
import 'package:client/src/common/log.dart';
import 'package:client/src/features/books/data/local_book_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class SembastBookRepsoitory implements LocalBookRepository {
  SembastBookRepsoitory(this.db);
  final Database db;
  final store = StoreRef.main();

  static Future<Database> createDatabase(String filename) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    return databaseFactoryIo.openDatabase('${appDocDir.path}/$filename');
  }

  static Future<SembastBookRepsoitory> makeDefault() async {
    return SembastBookRepsoitory(await createDatabase('default.db'));
  }

  static const bookmarksKey = 'bookmarks';
  
  // @override
  // Future<void> addBookmark(String bookId) async {
  //   final bookmarks = await store.record(bookmarksKey).get(db) as List<String>?;
  //   if (bookmarks == null) {
  //     await store.record(bookmarksKey).put(db, [bookId]);
  //     return;
  //   }
  //   await store.record(bookmarksKey).put(db, [...bookmarks, bookId]);
  // }
  
  // @override
  // Future<void> removeBookmark(String bookId) async {
  //   final bookmarks = await store.record(bookmarksKey).get(db) as List<String>?;
  //   if (bookmarks == null) return;
  //   await store.record(bookmarksKey).put(db, bookmarks..remove(bookId));
  // }

  @override
  Future<void> toggleBookmark(String bookId) async {
    var bookmarks = List<String>.from((await store.record(bookmarksKey).get(db) as List<Object?>?) ?? []);
    printWarning('SembastRepo ${bookmarks.length} $bookmarks');
    if (bookmarks.isEmpty) {
      bookmarks = [bookId];
    } else if (bookmarks.contains(bookId)) {
      bookmarks.remove(bookId);
    } else {
      bookmarks.add(bookId);
    }
    printWarning('after: ${bookmarks.length} $bookmarks');
    await store.record(bookmarksKey).put(db, bookmarks);
  }

  @override
  Future<List<String>> getBookmarks() async {
    final bookmarks = await store.record(bookmarksKey).get(db);
    if (bookmarks == null) {
      store.record(bookmarksKey).put(db, []);
      return [];
    }
    printSuccess('localRepo.getBookmarks() => $bookmarks');
    return List<String>.from(bookmarks as List<dynamic>);
  }
  
  @override
  Stream<List<String>> watchBookmarks() {
    return store.record(bookmarksKey)
      .onSnapshot(db)
      .map((b) => List<String>.from((b?.value ?? []) as List<dynamic>));
  }

  @override
  Future<void> deleteBookmarks() async {
    await store.record(bookmarksKey).delete(db);
  }

}
