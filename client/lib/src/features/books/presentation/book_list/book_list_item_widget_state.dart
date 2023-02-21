import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/book.dart';

part 'book_list_item_widget_state.freezed.dart';

@freezed
class BookListItemWidgetState with _$BookListItemWidgetState {
  factory BookListItemWidgetState({
    required Book book,
    @Default(false) bool isMy
  }) = _BookListItemWidgetState;
}