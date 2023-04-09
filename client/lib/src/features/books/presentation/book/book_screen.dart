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
import 'package:client/src/features/books/presentation/book/book_screen_state.dart';
import 'package:client/src/features/books/presentation/widgets/book_status_widget.dart';
import 'package:client/src/features/chapters/application/events.dart';
import 'package:client/src/features/chapters/presentation/chapter/chapter_widget.dart';
import 'package:client/src/features/comments/presentation/comment/comment_widget.dart';
import 'package:client/src/features/comments/presentation/comments/comments_widget.dart';
import 'package:client/src/features/localization/application/current_localization.dart';
import 'package:client/src/features/localization/application/ll.dart';
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
import '../../../comments/domain/comment_subject.dart';
import '../../../reports/presentation/report/report_dialog.dart';
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
  AsyncValue<BookScreenState> get state => 
      ref.watch(bookScreenControllerProvider(widget.bookId));

  final refreshController = RefreshController();

  void onLike() async {
    final isToggled = await cont.toggleLike();
    if (!isToggled && mounted) {
      ref.watch(scaffoldMessangerStateProvider)
        .showMessage(curLl(context)!.book.cantLike);
    }
  }

  void onBookmark() async {
    final isToggled = await cont.toggleBookmark();
    if (!isToggled && mounted) {
      ref.watch(scaffoldMessangerStateProvider)
        .showMessage(curLl(context)!.book.cantBookmark);
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

  void onShowChapters() {
    printInfo(widget.bookId);
    context.pushNamed(MyRoute.chapters.name, 
      params: {
        'id': widget.bookId
      },
      extra: state.value!.book
    );
  }

  void onReport() {
    showReportDialog(context, state.value!.book);
  }

  void onRefresh() async {
    await cont.refresh();
    refreshController.refreshCompleted();
    refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bookScreenControllerProvider(widget.bookId));
    final ll = ref.watch(currentLocalizationProvider);
    ref.listen(pubSub, (prev, next) {
      if (next is BookEditedEvent) {
        cont.bookUpdated(next.updatedBook);
      } else if (next is ChaptersEditedEvent) {
        cont.refresh();
      }
    });
    printError('BUILD THE BOOK');
    return state.when(
      data: (state) {
        final book = state.book;

        printError('BUILD THE BOOK STATE');
        return Scaffold(
          appBar: AppBar(
            title: Text(book.name),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      onTap: onReport,
                      child: Text(ll.report.toReport)
                    )
                  ];
                }
              ),
            ],
          ),
          body: SmartRefresher(
            controller: refreshController,
            onRefresh: onRefresh,
            child: ListView(
              children: [
                Stack(
                  children: [
                    Center(
                      child: MyImage(
                        placeholderIcon: const Icon(Icons.book_outlined, color: Colors.grey, size: p96),
                        imageUrl: book.coverUrl,
                        size: const Size(p232, p304),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: state.isMy 
                        ? IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: onEdit
                        )
                        : IconButton(
                          icon: Icon(book.bookmarked ?? false 
                            ? Icons.bookmark 
                            : Icons.bookmark_outline),
                          onPressed: onBookmark
                        )
                    )
                  ]
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
                              ),
                              Text(book.views.toString(),
                                style: Theme.of(context).textTheme.labelLarge
                                  ?.copyWith(color: Colors.grey),
                              ),
                              const Icon(Icons.remove_red_eye_outlined, 
                                color: Colors.grey
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
                    labelText: 'Chapters'.hardcoded,
                    onSeeAll: onShowChapters,
                  ),
                ),
                ...book.chapters?.map((ch) => ChapterWidget(chapter: ch)).toList() ?? [
                  ListTile(
                    title: Text("no chapters")
                  )
                ],
                Padding(
                  padding: const EdgeInsets.all(p16),
                  child: CommentsWidget(
                    subjectId: book.id, 
                    subjectName: CommentSubjects.book
                  ),
                )
              ],
            ),
          )
        );
      },
      loading: defaultLoading,
      error: defaultErrorHandler
    );
  }
}
