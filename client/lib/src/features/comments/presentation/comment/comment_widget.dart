import 'package:client/src/common/constants/constants.dart';
import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/common/pub_sub.dart';
import 'package:client/src/features/auth/application/my_id_provider.dart';
import 'package:client/src/features/comments/domain/comment.dart';
import 'package:client/src/features/comments/presentation/comment/comment_widget_controller.dart';
import 'package:client/src/features/comments/presentation/comment/comment_widget_state.dart';
import 'package:client/src/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../common/utils/debounce.dart';

class CommentWidget extends ConsumerStatefulWidget {
  const CommentWidget({super.key, required this.comment});

  final Comment comment;

  @override
  _CommentWidgetState createState() => _CommentWidgetState();
}

class _CommentWidgetState extends ConsumerState<CommentWidget> {
  CommentWidgetController get cont =>
      ref.watch(commentWidgetControllerProvider(widget.comment).notifier);
  CommentWidgetState get state => 
      ref.watch(commentWidgetControllerProvider(widget.comment));

  final rateDebouncer = Debouncer(500);

  void onAnswerSubmit() async {
    await cont.submitAnswer();
  }

  void onAnswerFieldChange(String newContent) {
    cont.fieldState = newContent;
  }

  void onLoadMoreAnswers() async {
    await cont.loadAnswers();
  }

  void onHideAnswer() {
    cont.hideAnswerField();
  }

  void onShowAnswer() {
    cont.showAnswerField();
  }

  void onUpRate() async {
    rateDebouncer.debounce(() => cont.upRate());
  }

  void onDownRate() async {
    rateDebouncer.debounce(() => cont.downRate());
  }

  void onEdit() async {
    cont.toggleEdit();
  }

  void onEditFieldChanged(String v) {
    cont.editState = v;
  }

  void onHideEdit() async {
    cont.toggleEdit();
  }

  void onEditSubmit() async {
    cont.submitEdited();
  }

  void onReport() async {}

  void onDelete() async {
    cont.deleteThisComment();
  }

  final editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = this.state;
    final comment = state.comment;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        withDepth(
          comment.depth,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage:
                        NetworkImage(comment.author.avatarUrl ?? ""),
                  ),
                  w8gap,
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(comment.author.displayName ?? comment.author.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(Constants.dateFormat.format(comment.createdAt)),
                      ])
                ]),
                h8gap,
                if (state.isEdit)
                  TextFormField(
                    initialValue: comment.content,
                    onChanged: onEditFieldChanged,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(state.editState.isEmpty 
                          ? Icons.close 
                          : Icons.check
                        ),
                        onPressed: () {
                          state.editState.isEmpty
                              ? onHideEdit()
                              : onEditSubmit();
                        },
                      ),
                    ),
                  )
                else
                  Text(comment.content),
                if (!state.isFieldShown)
                  Row(children: [
                    w8gap,
                    if (!state.isEdit)
                      TextButton(
                        onPressed: onShowAnswer,
                        child: Text('answer'.hardcoded),
                      )
                    else 
                      TextButton(
                        onPressed: onHideEdit,
                        child: Text("hide".hardcoded)
                      ),
                    const Spacer(),
                    PopupMenuButton(
                      itemBuilder: (BuildContext context) => [
                        if (ref.watch(myIdProvider) == comment.author.id) ...[
                          PopupMenuItem(
                            onTap: onEdit,
                            child: Text('edit'.hardcoded),
                          ),
                          PopupMenuItem(
                            onTap: onDelete,
                            child: Text('delete'.hardcoded),
                          ),
                        ],
                        PopupMenuItem(
                          onTap: onReport,
                          child: Text('report'.hardcoded),
                        ),
                      ],
                    ),
                    InkWell(
                        onTap: onUpRate,
                        child: Icon(Icons.keyboard_arrow_up_rounded,
                            color: comment.myRate == CommentRate.like
                                ? Colors.green
                                : Theme.of(context).colorScheme.outline)),
                    w4gap,
                    ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: p24),
                        child: Text(
                          comment.rate.toString(),
                          textAlign: TextAlign.center,
                        )),
                    w4gap,
                    InkWell(
                        onTap: onDownRate,
                        child: Icon(Icons.keyboard_arrow_down_rounded,
                          color: comment.myRate == CommentRate.dislike
                            ? Theme.of(context).colorScheme.error
                            : Theme.of(context).colorScheme.outline,
                        ),
                    ),
                  ]),
                if (state.comment.hasAnswers && state.comment.answers.isEmpty)
                  TextButton(
                    onPressed: onLoadMoreAnswers,
                    child: Text("Load More".hardcoded),
                  )
              ]),
        ),
        if (state.isFieldShown)
          Padding(
            padding: const EdgeInsets.only(bottom: p8, left: p8),
            child: TextFormField(
                initialValue: state.fieldState,
                onChanged: onAnswerFieldChange,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                  icon: state.fieldState.isEmpty
                      ? const Icon(Icons.close)
                      : const Icon(Icons.send),
                  onPressed: () {
                    state.fieldState.isEmpty
                        ? onHideAnswer()
                        : onAnswerSubmit();
                  },
                ),
              ),
            ),
          ),
        ...comment.answers.map((a) => CommentWidget(comment: a)).toList()
      ],
    );
  }

  Widget withDepth(int depth, {required Widget child}) {
    return IntrinsicHeight(
      child: Row(
        children: [
          for (int i = 0; i < depth; i++) ...[
            Padding(
              padding: const EdgeInsets.only(right: p16),
              child: Container(
                color: Theme.of(context).colorScheme.outline, 
                width: 2,
              ),
            ),
          ],
          Expanded(child: child),
        ]
      ),
    );
  }
}
