import 'package:freezed_annotation/freezed_annotation.dart';

import '../../books/domain/book.dart';
import '../../profile/domain/profile.dart';

part 'home_screen_state.freezed.dart';

@freezed
class HomeScreenState with _$HomeScreenState {
  factory HomeScreenState({
    @Default([]) List<Book> books,
    @Default([]) List<Profile> authors
  }) = _HomeScreenState;
}
