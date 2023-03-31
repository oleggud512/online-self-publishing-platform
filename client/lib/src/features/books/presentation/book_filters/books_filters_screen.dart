import 'package:client/src/common/constants/constants.dart';
import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/common/widgets/error_handler.dart';
import 'package:client/src/features/books/domain/book.dart';
import 'package:client/src/features/books/presentation/widgets/book_status_dropdown.dart';
import 'package:client/src/features/books/presentation/widgets/tags_genres_widget.dart';
import 'package:client/src/features/localization/application/current_localization.dart';
import 'package:client/src/features/localization/application/ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/utils/debounce.dart';
import 'books_filters_screen_controller.dart';
import 'books_filters_state.dart';

class BooksFiltersScreen extends ConsumerStatefulWidget {
  const BooksFiltersScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BooksFiltersScreenState();
}
class _BooksFiltersScreenState extends ConsumerState<BooksFiltersScreen> {

  final debouncer = Debouncer();

  @override
  Widget build(BuildContext context) {
    final ll = ref.watch(currentLocalizationProvider);
    final state = ref.watch(booksFiltersScreenControllerProvider);
    final cont = ref.watch(booksFiltersScreenControllerProvider.notifier);
    final filters = ref.watch(booksFiltersStateProvider);
    return state.when(
      data: (source) {
        return Scaffold(
          appBar: AppBar(
            title: Text(ll.screenTitle.filters)
          ),
          body: ListView(
            padding: const EdgeInsets.only(top: p8, left: p16, right: p16),
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'query'.hardcoded
                ),
                onChanged: (v) {
                  debouncer.debounce(() {
                    cont.updateQuery(v);
                  });
                }
              ),
              h16gap,
              SegmentedButton<BookStatus>(
                selected: filters.statuses.toSet(),
                segments: [
                  ButtonSegment(
                    value: BookStatus.inProgress,
                    label: Text(ll.bookStatus(BookStatus.inProgress)),
                  ),
                  ButtonSegment(
                    value: BookStatus.completed,
                    label: Text(ll.bookStatus(BookStatus.completed)),
                  ),
                  ButtonSegment(
                    value: BookStatus.abandoned,
                    label: Text(ll.bookStatus(BookStatus.abandoned)),
                  ),
                ],
                multiSelectionEnabled: true,
                emptySelectionAllowed: true,
                onSelectionChanged: (statuses) {
                  cont.updateStatuses(statuses.toList());
                },
              ),
              TagsGenresWidget(
                originTags: source.tags,
                tags: filters.tags,
                originGenres: source.genres,
                genres: filters.genres,
                onTagTap: cont.toggleTag,
                onGenreTap: cont.toggleGenre
              )
            ]
          )
        );
      },
      loading: defaultLoading,
      error: defaultErrorHandler
    );
  }
}