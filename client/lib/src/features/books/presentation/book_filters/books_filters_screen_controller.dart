import 'package:client/src/common/mutable_list.dart';
import 'package:client/src/features/books/data/book_repository.dart';
import 'package:client/src/features/books/domain/filtering_source.dart';
import 'package:client/src/features/books/presentation/book_filters/books_filters_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/book.dart';
import 'books_query_state.dart';

part 'books_filters_screen_controller.g.dart';

@riverpod
class BooksFiltersScreenController extends _$BooksFiltersScreenController {

  @override
  FutureOr<FilteringSource> build() async {
    return ref.watch(bookRepositoryProvider).getFilteringSource();
  }

  void updateQuery(String newQuery) => 
    ref.read(booksQueryState.notifier).state = newQuery;
  
  void toggleTag(String tag) {
    final filters = ref.read(booksFiltersStateProvider);
    ref.read(booksFiltersStateProvider.notifier).state = filters.copyWith(
      tags: filters.tags.copyToggle(tag)
    );
  }

  void toggleGenre(String genre) {
    final filters = ref.read(booksFiltersStateProvider);
    ref.read(booksFiltersStateProvider.notifier).state = filters.copyWith(
      genres: filters.genres.copyToggle(genre)
    );
  }

  void updateStatuses(List<BookStatus> statuses) {
    ref.read(booksFiltersStateProvider.notifier).update((filters) {
      return filters.copyWith(statuses: statuses);
    });
  }
  
}