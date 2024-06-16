import 'package:client/src/common/log.dart';
import 'package:client/src/features/auth/application/my_id_provider.dart';
import 'package:client/src/features/books/data/local_book_repository.dart';
import 'package:client/src/features/books/domain/book.dart';
import 'package:client/src/features/books/domain/filtering_source.dart';
import 'package:client/src/features/books/domain/filters.dart';
import 'package:client/src/shared/constants.dart';
import 'package:client/src/shared/dio.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/errors/exceptions.dart';
import '../../../shared/errors/handle_error.dart';

part 'book_repository.g.dart';

class StateChangeNotPermitted extends AppException { }

class BookRepository {
  final Dio _dio;
  final String? myId;
  final LocalBookRepository local;

  BookRepository({required Dio dio, required this.myId, required this.local})
      : _dio = dio;

  Future<Book> getBook(String id) async {
    final resp = await _dio.get('books/$id');
    final book = Book.fromJson(resp.data['data']);
    printSuccess(book);
    return book;
  }

  Future<Book> updateBook(Book book) async {
    printWarning(book);
    final resp = await _dio.patch('books/${book.id}',
      data: book.toJson()
    );
    printSuccess(resp.data['data']);
    return Book.fromJson(resp.data['data']);
  }

  Future<Book> addBook(Book book) async {
    final resp = await _dio.post('books', data: book.toJson());
    final addedBook = Book.fromJson(resp.data['data']);
    return addedBook;
  }

  Future<List<Book>> getBooks([
    Filters? filters,
    int from = 0,
    int pageSize = 20
  ]) async {
    return await handleError(() async {
      final resp = await _dio.get(Str.dio.books, 
        queryParameters: filters?.toJson()
          ?..addAll({
            Str.dio.from: from, 
            Str.dio.pageSize: pageSize 
          })
      );
      printInfo(resp.data['data'].map((b) => { 'id': b['_id'], 'name': b['name'], 'bookmarked': b['bookmarked']}).toList());
      return bookListFromJson(resp.data[Str.dio.data]);
    });
  }

  Future<List<Book>> getPopularBooks([int from = 0, int pageSize = 20]) async {
    return await handleError(() async {
      final resp = await _dio.get(Str.dio.popularBooks,
        queryParameters: {
          Str.dio.from: from,
          Str.dio.pageSize: pageSize
        }
      );
      printSuccess(resp.data);
      return bookListFromJson(resp.data[Str.dio.data]);
    });
  }

  Future<bool> deleteBook(String id) async {
    final resp = await _dio.delete('books/$id');
    final result = resp.data['data'] as bool;
    return result;
  }

  Future<FilteringSource> getFilteringSource() async {
    final resp = await _dio.get("books/filtering-source");
    final source = FilteringSource.fromJson(resp.data['data']);
    return source;
  }

  Future<ReadingsState> changeState(String bookId) => handleError(() async {
    try {
      final resp = await _dio.post("books/$bookId/state");
      return readingsStateFromString(resp.data['data']);
    } on DioError catch (e) {
      if (e.type == DioErrorType.badResponse && 
        e.response?.data['error']['code'] == 'cannotChangeState'){ 
          throw StateChangeNotPermitted();
      }
      rethrow;
    }
  });

  Future<bool> toggleLike(String bookId) async {
    final resp = await _dio.post("books/$bookId/like");
    return resp.data['data'] as bool;
  }

  Future<bool> toggleBookmark(String bookId) async {
    if (myId != null) {
      final resp = await _dio.post("books/$bookId/bookmark");
      return resp.data['data'] as bool;
    }
    await local.toggleBookmark(bookId);
    return true;
  }
}

@Riverpod(keepAlive: true)
BookRepository bookRepository(BookRepositoryRef ref) {
  return BookRepository(
    dio: ref.watch(dioProvider),
    myId: ref.watch(myIdProvider),
    local: ref.watch(localBookRepositoryProvider)
  );
}
