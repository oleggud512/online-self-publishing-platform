import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/book.dart';

part 'edit_book_screen_state.freezed.dart';
part 'edit_book_screen_state.g.dart';

@freezed
class EditBookScreenState with _$EditBookScreenState {
  factory EditBookScreenState({
    required Book book,
    @Default([]) List<String> genres,
    @Default([]) List<String> tags
  }) = _EditBookScreenState;

  factory EditBookScreenState.fromJson(Map<String, dynamic> json) => 
      _$EditBookScreenStateFromJson(json);
}