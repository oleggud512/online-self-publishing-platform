import 'package:client/src/features/books/domain/filters.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'books_query_state.dart';

final booksFiltersStateProvider = StateProvider((ref) {
  return Filters(query: ref.watch(booksQueryState));
});