import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/common/log.dart';
import 'package:client/src/common/widgets/error_handler.dart';
import 'package:client/src/common/widgets/my_image.dart';
import 'package:client/src/common/widgets/see_all_header.dart';
import 'package:client/src/common/widgets/show_simple_yes_no_dialog.dart';
import 'package:client/src/common/widgets/size_controller_widget.dart';
import 'package:client/src/features/books/application/books_changed_event.dart';
import 'package:client/src/features/books/domain/book.dart';
import 'package:client/src/features/books/presentation/book/book_screen_controller.dart';
import 'package:client/src/features/books/presentation/widgets/book_status_widget.dart';
import 'package:client/src/features/comments/presentation/comment/comment_widget.dart';
import 'package:client/src/features/comments/presentation/comments/comments_widget.dart';
import 'package:client/src/features/localization/application/current_localization.dart';
import 'package:client/src/features/profile/presentation/authors/author_widget.dart';
import 'package:client/src/router/router.dart';
import 'package:client/src/shared/constants.dart';
import 'package:client/src/shared/scaffold_messanger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../common/constants/constants.dart';
import '../../../../common/pub_sub.dart';
import '../widgets/readings_state_widget.dart';

class BookScreen extends ConsumerStatefulWidget {
  const BookScreen({
    super.key,
    required this.bookId,
  });

  final String bookId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BookScreenState();
}
class _BookScreenState extends ConsumerState<BookScreen> {
  BookScreenController get cont => 
      ref.watch(bookScreenControllerProvider(widget.bookId).notifier);

  void onLike() async {
    final isToggled = await cont.toggleLike();
    if (!isToggled) {
      ref.watch(scaffoldMessangerStateProvider).showMessage('Can\'t like'.hardcoded);
    }
  }

  void onBookmark() async {
    final isToggled = await cont.toggleBookmark();
    if (!isToggled) {
      ref.watch(scaffoldMessangerStateProvider).showMessage('Can\'t bookmark'.hardcoded);
    }
  }

  void onEdit() {
    context.pushNamed(MyRoute.editBook.name,
      params: { 'id': widget.bookId },
      extra: ref.watch(bookScreenControllerProvider(widget.bookId)).value!.book
    );
  }

  // publish / unpublish
  void onChangeState() async {
    final ll = ref.watch(currentLocalizationProvider);
    final currentState = ref.watch(bookScreenControllerProvider(widget.bookId)
      .select((state) => state.value!.book.state));

    bool? wantToChangeState = await showSimpleYesNoDialog(
      context, 
      currentState == ReadingsState.published 
        ? ll.wantToHide
        : ll.wantToPublish
    );
    
    if (wantToChangeState != true) return;
    cont.changeBookState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bookScreenControllerProvider(widget.bookId));
    final ll = ref.watch(currentLocalizationProvider);
    ref.listen(pubSub, (prev, next) {
      if (next is BookEditedEvent) cont.bookUpdated(next.updatedBook);
    });
    return state.when(
      data: (state) {
        final book = state.book;

        return Scaffold(
          appBar: AppBar(
            title: Text(book.name),
            actions: [
              if (state.isMy) IconButton(
                icon: const Icon(Icons.edit),
                onPressed: onEdit
              )
              else IconButton(
                icon: Icon(book.bookmarked ?? false 
                  ? Icons.bookmark 
                  : Icons.bookmark_outline),
                onPressed: onBookmark
              )
            ],
          ),
          body: ListView(
            children: [
              if (book.coverUrl != null) 
                  Center(
                    child: MyImage(
                      imageUrl: book.coverUrl,
                      size: const Size(p232, p304),
                    ),
                  ),
              h16gap,
              Text(book.name, 
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        BookStatusWidget(status: book.status),
                        if (state.isMy) ...[
                          w8gap,
                          Container(
                            color: Theme.of(context).colorScheme.outline,
                            width: 1,
                            height: 20,
                          ),
                          w8gap,
                          InkWell(
                            onTap: onChangeState,
                            child: ReadingsStateWidget(state: book.state)
                          )
                        ],
                        const Spacer(),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(book.likes.toString(), 
                              style: Theme.of(context).textTheme.labelLarge
                            ),
                            IconButton(
                              icon: Icon(book.liked 
                                ? Icons.favorite 
                                : Icons.favorite_outline),
                              onPressed: onLike,
                            )
                          ]
                        ),
                      ]
                    ),
                    Text(book.description ?? ll.profile.noDescriptionPlaceholder,
                      style: Theme.of(context).textTheme.bodyLarge
                    ),
                    h8gap,
                    Align(
                      alignment: Alignment.topLeft,
                      child: Wrap(
                        spacing: p8,
                        children: [
                          ...book.genres.map((g) => FilterChip(
                            elevation: 8,
                            selected: false,
                            onSelected: (s) {},
                            label: Text(g),
                          )).toList(),
                          ...book.tags.map((g) => FilterChip(
                            selected: false,
                            onSelected: (s) {},
                            label: Text(g)
                          )).toList(),
                        ]
                      ),
                    ),
                    h8gap,
                    AuthorWidget(profile: book.author),
                  ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(p16),
                child: SeeAllHeader(
                  showSeeAll: false,
                  labelText: 'Chapters'.hardcoded
                ),
              ),
              ...book.chapters?.map((ch) => ListTile(
                onTap: () { 
                  printInfo(book.chapters);
                },
                title: Row(
                  children: [
                    Expanded(
                      child: Text(ch.name,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      )
                    ),
                    w4gap,
                    if (state.isMy) ReadingsStateWidget(state: ch.state)
                  ]
                ),
                subtitle: Text(Constants.dateFormat.format(ch.createdAt)),
              )).toList() ?? [
                ListTile(
                  title: Text("no chapters")
                )
              ],
              Padding(
                padding: const EdgeInsets.all(p16),
                child: CommentsWidget(subjectId: book.id),
              )
            ],
          )
        );
      },
      loading: defaultLoading,
      error: defaultErrorHandler
    );
  }
}