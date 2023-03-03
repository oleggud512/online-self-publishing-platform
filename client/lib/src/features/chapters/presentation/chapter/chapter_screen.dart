import 'package:client/src/common/log.dart';
import 'package:client/src/common/pub_sub.dart';
import 'package:client/src/common/widgets/error_handler.dart';
import 'package:client/src/features/auth/application/my_id_provider.dart';
import 'package:client/src/features/books/presentation/book/book_screen_controller.dart';
import 'package:client/src/features/books/presentation/widgets/readings_state_widget.dart';
import 'package:client/src/features/chapters/presentation/chapter/chapter_screen_controller.dart';
import 'package:client/src/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/constants/constants.dart';
import '../../../books/domain/book.dart';
import '../../application/events.dart';
import 'chapter_screen_state.dart';

class ChapterScreen extends ConsumerStatefulWidget {
  const ChapterScreen({super.key, required this.chapterId});

  final String chapterId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChapterScreenState();
}
class _ChapterScreenState extends ConsumerState<ChapterScreen> {
  ChapterScreenController get cont => ref.watch(chapterScreenControllerProvider(widget.chapterId).notifier);
  AsyncValue<ChapterScreenState> get state => ref.watch(chapterScreenControllerProvider(widget.chapterId));

  void onEdit() {
    printWarning('onEditChapter');
    context.pushNamed(MyRoute.editChapter.name, 
      params: {
        'id': widget.chapterId
      },
      extra: state.value!.chapter
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(pubSub, (prev, next) {
      if (next is ChapterUpdatedEvent) {
        cont.refresh();
      }
    });
    final state = this.state;
    return state.when(
      data: (state) => Scaffold(
        floatingActionButton: cont.isMy
          ? FloatingActionButton(
            onPressed: onEdit,
            child: const Icon(Icons.edit),
          ) 
          : null,
        body: SafeArea(
          child: ListView(
            children: [
              AppBar(
                title: Text(state.chapter.name)
              ),
              Padding(
                padding: const EdgeInsets.all(p8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (cont.isMy) ReadingsStateWidget(state: state.chapter.state),
                    Text(state.chapter.name, style: Theme.of(context).textTheme.headlineMedium),
                    h8gap,
                    Text(state.chapter.content, style: Theme.of(context).textTheme.bodyLarge)
                  ]
                ),
              )
            ]
          ),
        )
      ),
      loading: defaultLoading,
      error: defaultErrorHandler
    );
  }
}