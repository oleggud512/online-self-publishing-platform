import 'dart:convert';

import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/common/log.dart';
import 'package:client/src/common/pub_sub.dart';
import 'package:client/src/common/widgets/error_handler.dart';
import 'package:client/src/features/auth/application/my_id_provider.dart';
import 'package:client/src/features/books/presentation/book/book_screen_controller.dart';
import 'package:client/src/features/books/presentation/widgets/readings_state_widget.dart';
import 'package:client/src/features/chapters/domain/chapter.dart';
import 'package:client/src/features/chapters/presentation/chapter/chapter_screen_controller.dart';
import 'package:client/src/features/localization/application/current_localization.dart';
import 'package:client/src/features/localization/domain/localization.i69n.dart';
import 'package:client/src/shared/constants.dart';
import 'package:client/src/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/constants/constants.dart';
import '../../../books/domain/book.dart';
import '../../../comments/domain/comment_subject.dart';
import '../../../comments/presentation/comments/comments_widget.dart';
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
  Localization get ll => ref.watch(currentLocalizationProvider);

  final focusNode = FocusNode();

  void onEdit() {
    printWarning('onEditChapter');
    context.pushNamed(MyRoute.editChapter.name, 
      params: {
        'id': widget.chapterId
      },
      extra: state.value!.chapter
    );
  }

  void onPrevious() {
    printInfo(state.value!.previous);
    if (state.value!.previous != null) {
      context.pushReplacementNamed(MyRoute.chapter.name, 
        params: {
          "id": state.value!.previous!
        }
      );
    } else {
      Utils.showMessagew(ref, ll.chapter.firstChapterWarning);      
    }
  }

  void onNext() {
    if (state.value!.next != null) {
      context.pushReplacementNamed(MyRoute.chapter.name, 
        params: {
          "id": state.value!.next!
        }
      );
    } else {
      Utils.showMessagew(ref, ll.chapter.lastChapterWarning);
    }
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
        // floatingActionButton: cont.isMy
        //   ? FloatingActionButton(
        //     onPressed: onEdit,
        //     child: const Icon(Icons.edit),
        //   ) 
        //   : null,
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: p8),
            children: [
              AppBar(
                title: Text(state.chapter.name),
                actions: [
                  if (cont.isMy) IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: onEdit,
                  )
                ]
              ),
              Padding(
                padding: const EdgeInsets.all(p8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (cont.isMy) 
                      ReadingsStateWidget(state: state.chapter.state),
                    Text(state.chapter.name, 
                      style: Theme.of(context).textTheme.headlineMedium
                    ),
                    h8gap,
                    QuillEditor(
                      padding: const EdgeInsets.all(0),
                      controller: QuillController.basic()
                        ..document = state.chapter.content.isNotEmpty 
                          ? Document.fromJson(
                            jsonDecode(state.chapter.content)
                          ) 
                          : Document.fromDelta(Delta()..insert("<< no data >>\n")),
                      expands: false,
                      focusNode: focusNode,
                      autoFocus: false,
                      scrollable: false,
                      scrollController: ScrollController(),
                      readOnly: true
                    )
                  ]
                ),
              ),
              if (state.chapter.isPublished) Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onPrevious,
                      child: Text(ll.chapter.previous),
                    ),
                  ),
                  w16gap,
                  Expanded(
                    child: FilledButton(
                      onPressed: onNext,
                      child: Text(ll.chapter.next),
                    ),
                  )
                ]
              ),
              h8gap,
              CommentsWidget(
                subjectId: state.chapter.id,
                subjectName: CommentSubjects.chapter
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
