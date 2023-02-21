import 'package:client/src/features/books/domain/filters.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/book.dart';

part 'books_screen_state.freezed.dart';

@freezed
class BooksScreenState with _$BooksScreenState {
  factory BooksScreenState({
    @Default(AsyncValue.loading()) AsyncValue<List<Book>> books,
    required Filters filters
  }) = _BooksScreenState;
}