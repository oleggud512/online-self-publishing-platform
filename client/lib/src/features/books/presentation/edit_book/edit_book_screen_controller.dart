import 'dart:io';

import 'package:client/src/common/mutable_list.dart';
import 'package:client/src/features/books/data/book_repository.dart';
import 'package:client/src/features/books/domain/book.dart';
import 'package:client/src/features/books/presentation/edit_book/edit_book_screen_state.dart';
import 'package:client/src/shared/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../common/log.dart';

part 'edit_book_screen_controller.g.dart';

@riverpod
class EditBookScreenController extends _$EditBookScreenController {
  BookRepository get bookRepo => ref.watch(bookRepositoryProvider);

  @override
  EditBookScreenState build(Book book) {
    printInfo('EditBookScreenController built');
    bookRepo.getFilteringSource()
      .then((source) => state = state.copyWith(
        genres: source.genres, 
        tags: source.tags
      ));
    return EditBookScreenState(book: book.copyWith());
  }

  set status(BookStatus s) { 
    state = state.copyWith(book: state.book.copyWith(status: s));
  }
  set name(String n) { 
    state = state.copyWith(book: state.book.copyWith(name: n));
  }
  set description(String d) { 
    state = state.copyWith(book: state.book.copyWith(description: d));
  }
  
  Future<void> pickImage() async {
    final path = await Utils.pickImage();
    state = state.copyWith(book: state.book.copyWith(coverUrl: path));
  }

  void toggleGenre(String genre) {
    state = state.copyWith(
      book: state.book.copyWith(
        genres: state.book.genres.copyToggle(genre)
      )
    );
  }

  void toggleTag(String tag) {
    state = state.copyWith(
      book: state.book.copyWith(
        tags: state.book.tags.copyToggle(tag)
      )
    );
  }

  Future<Book?> save() async {
    try {
      String? newDownloadUrl = await _saveCurrentCoverToFirebase();
      late Book bookToUpdate;
      // если картинка есть, сохраним ее и поставим новый url.
      if (newDownloadUrl != null) {
        bookToUpdate = state.book.copyWith(coverUrl: newDownloadUrl);
      // если ее нет, то будем отправлять просто с этим null.
      } else {
        bookToUpdate = state.book.copyWith();
      }
      printError(bookToUpdate);

      if (bookToUpdate.id.isNotEmpty) {
        return await bookRepo.updateBook(bookToUpdate);
      } else {
        return await bookRepo.addBook(bookToUpdate);
      }
    } catch (e) {
      printError(e);
      return null;
    }
  }

  /// ее задача только сохранять картинку в firebase, и вернуть url
  Future<String?> _saveCurrentCoverToFirebase() async {
    if (state.book.coverUrl == null) return null;
    if (state.book.coverUrl!.startsWith('https://')) return null;
    return Utils.saveToFirebase('covers/${state.book.id}', File(state.book.coverUrl!));
  }

  Future<bool> deleteThisBook() async {
    return bookRepo.deleteBook(state.book.id);
  }
}