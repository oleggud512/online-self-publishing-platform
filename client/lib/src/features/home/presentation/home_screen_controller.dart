import 'package:client/src/features/books/data/book_repository.dart';
import 'package:client/src/features/profile/data/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'home_screen_state.dart';

part 'home_screen_controller.g.dart';

@Riverpod()
class HomeScreenController extends _$HomeScreenController {
  BookRepository get bookRepo => ref.watch(bookRepositoryProvider);
  ProfileRepository get profileRepo => ref.watch(profileRepositoryProvider);

  @override
  FutureOr<HomeScreenState> build() async {
    final books = await bookRepo.getPopularBooks(0, 10);
    final authors = await profileRepo.getPopularAuthors(0, 10);
    return HomeScreenState(
      books: books,
      authors: authors
    );
  }
}
