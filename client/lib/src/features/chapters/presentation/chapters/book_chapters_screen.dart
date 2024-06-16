import 'package:client/src/common/build_context_ext.dart';
import 'package:client/src/shared/errors/exceptions.dart';
import 'package:client/src/features/books/domain/book.dart';
import 'package:client/src/features/chapters/application/events.dart';
import 'package:client/src/features/chapters/domain/chapter.dart';
import 'package:client/src/shared/errors/map_error_to_widget.dart';
import 'package:client/src/shared/errors/widgets/default_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../common/pagination/page_list_widget.dart';
import '../../../../common/pub_sub.dart';
import '../../../../shared/constants.dart';
import '../chapter/chapter_widget.dart';
import 'book_chapters_screen_controller.dart';

class BookChaptersScreen extends ConsumerStatefulWidget {
  const BookChaptersScreen({super.key, required this.bookId, required this.book});

  final Book book;
  final String bookId;

  @override
  _BookChaptersScreenState createState() => _BookChaptersScreenState();
}

class _BookChaptersScreenState extends ConsumerState<BookChaptersScreen> {
  BookChaptersScreenController get cont => 
      ref.watch(bookChaptersScreenControllerProvider(widget.bookId).notifier);
  AsyncValue<List<Chapter>> get state => 
      ref.watch(bookChaptersScreenControllerProvider(widget.bookId));

  final refreshController = RefreshController();

  void onAddChapter() {
    context.pushNamed(MyRoute.addChapter.name, 
      pathParameters: {
        'id': widget.bookId
      },
      extra: widget.book
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = this.state;
    final cont = this.cont;
    ref.listen(pubSub, (prev, next) { 
      if (next is ChaptersEditedEvent) cont.handleEdited(next);
    });
    return state.when(
      data: (chapters) => Scaffold(
        appBar: AppBar(
          title: Text(context.ll!.screenTitle.chapters),
        ),
        body: PageListWidget(
          refreshController: refreshController,
          paginationController: cont,
          child: ListView.builder(
            itemCount: chapters.length,
            itemBuilder: (context, i) {
              return ChapterWidget(chapter: chapters[i]);
            },
          )
        ),
        floatingActionButton: cont.isMy ? FloatingActionButton.extended(
          label: Text(context.ll!.chapter.addChapter),
          icon: const Icon(Icons.add),
          onPressed: onAddChapter,
        ) : null,
      ),
      loading: defaultLoading,
      error: mapErrorToWidget
    );
  }
}
