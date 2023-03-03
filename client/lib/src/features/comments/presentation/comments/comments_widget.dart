import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/common/widgets/error_handler.dart';
import 'package:client/src/features/comments/data/comment_repository.dart';
import 'package:client/src/features/comments/presentation/comments/comments_widget_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/src/framework.dart';

import '../../../../common/constants/constants.dart';
import '../../../../common/log.dart';
import '../../../../common/utils/debounce.dart';
import '../comment/comment_widget.dart';
import 'comments_content_field_state.dart';


class CommentsWidget extends ConsumerWidget {
  CommentsWidget({super.key, required this.subjectId});

  final String subjectId;
  final debouncer = Debouncer();
  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cont = ref.watch(commentsWidgetControllerProvider(subjectId).notifier);
    final state = ref.watch(commentsWidgetControllerProvider(subjectId));

    return state.when(
      data: (state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SegmentedButton<String>(
                selected: <String>{ state.sorting },
                onSelectionChanged: (selected) {
                  cont.sorting = selected.first;
                },
                showSelectedIcon: false,
                segments: [
                  ButtonSegment(
                    value: CommentsSorting.nnew,
                    label: Text("new".hardcoded)
                  ),
                  ButtonSegment(
                    value: CommentsSorting.old,
                    label: Text("old".hardcoded)
                  ),
                  ButtonSegment(
                    value: CommentsSorting.popular,
                    label: Text("popular".hardcoded)
                  ),
                ],
              ),
            ),
            h8gap,
            Consumer(
              builder: (context, ref, child) { 
                printInfo("return TextFormField(${ref.watch(commentsContentFieldState)})");
                final content = ref.watch(commentsContentFieldState);
                if (content.isEmpty) contentController.text = "";
                return ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 200
                  ),
                  child: TextFormField(
                    controller: contentController,
                    onChanged: (v) {
                      debouncer.debounce(() => ref.watch(commentsContentFieldState.notifier).state = v);
                    },
                    maxLength: 1000,
                    maxLines: null,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          cont.addComment();
                        }
                      )
                    )
                  ),
                ); 
              },
            ),
            h8gap,
            ...state.comments.map((c) => CommentWidget(comment: c)).toList(),
            h8gap,
            TextButton(
              child: Text("Load More".hardcoded),
              onPressed: () {
                cont.addPage();
              }
            )
          ]
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: defaultErrorHandler
    );
  }
}