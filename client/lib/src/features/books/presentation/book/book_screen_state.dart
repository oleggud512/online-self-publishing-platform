import 'package:client/src/features/books/domain/book.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_screen_state.freezed.dart';

@freezed
class BookScreenState with _$BookScreenState {
  factory BookScreenState({
    required Book book,
    @Default(false) bool isMy
  }) = _BookScreenState;
}