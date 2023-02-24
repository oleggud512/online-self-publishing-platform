import 'package:client/src/common/mutable_list.dart';
import 'package:client/src/features/comments/domain/comment.dart';
import 'package:client/src/features/comments/presentation/comment/comment_widget_state.dart';
import 'package:client/src/shared/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../common/log.dart';
import '../../../../common/pub_sub.dart';
import '../../application/comment_deleted_event.dart';
import '../../data/comment_repository.dart';

part 'comment_widget_controller.g.dart';

@riverpod
class CommentWidgetController extends _$CommentWidgetController {
  CommentRepository get commentRepo => ref.watch(commentRepositoryProvider);
  
  CommentWidgetState build(Comment comment) {
    _listenDeletion();
    return CommentWidgetState(comment: comment);
  }

  void _listenDeletion() {
    ref.listen(pubSub, (prev, next) {
      if (next is CommentDeletedEvent) {
        final comments = state.comment.answers.where((a) => a.id == next.commentId).toList();
        if (comments.isEmpty) return;
        state = state.copyWith(
          comment: state.comment.copyWith(
            answers: state.comment.answers.copyWithout(comments[0])
          )
        );
      }
    });
  }

  set fieldState(String f) => state = state.copyWith(fieldState: f);
  set editState(String e) => state = state.copyWith(editState: e);


  void showAnswerField() {
    state = state.copyWith(isFieldShown: true);
  }

  void hideAnswerField() {
    state = state.copyWith(fieldState: "", isFieldShown: false);
  }

  Future<void> upRate() async {
    int newRates = await commentRepo.rate(state.comment.id, CommentRate.like);
    printInfo(newRates);
    state = state.copyWith(
      comment: state.comment.copyWith(
        myRate: state.comment.myRate == CommentRate.like ? null : CommentRate.like,
        rate: newRates
      )
    );
  }

  Future<void> downRate() async {
    int newRates = await commentRepo.rate(state.comment.id, CommentRate.dislike);
    state = state.copyWith(
      comment: state.comment.copyWith(
        myRate: state.comment.myRate == CommentRate.dislike ? null : CommentRate.dislike,
        rate: newRates
      )
    );
  }

  Future<void> loadAnswers() async {
    final comments = await commentRepo.getComments(
      state.comment.subject,
      questionId: state.comment.id,
    );
    state = state.copyWith(
      comment: state.comment.copyWith(answers: comments)
    );
  }

  Future<void> submitAnswer() async {
    Comment newComment = await commentRepo.addComment(
      content: state.fieldState, 
      subjectId: state.comment.subject, 
      questionId: state.comment.id
    );
    state = state.copyWith(
      comment: state.comment.copyWith(
        answers: state.comment.answers.copyWith(newComment),
      ),
    );
    hideAnswerField();
  } 

  Future<void> submitEdited() async {
    try {
      Comment updatedComment = await commentRepo.updateComment(
        state.comment.id, 
        state.editState
      );
      state = state.copyWith(
        comment: state.comment.copyWith(
          content: updatedComment.content,
          updatedAt: updatedComment.updatedAt,
        ),
        isEdit: false,
      );
    } on CantEditCommentException catch (_) {
      Utils.showMessage(ref, "Can't edit comment!");
    }
  }

  Future<void> toggleEdit() async {
    if (state.isEdit) {
      state = state.copyWith(isEdit: false, editState: "");
    } else {
      state = state.copyWith(isEdit: true);
    }
  }

  Future<void> deleteThisComment() async {
    bool deleted = await commentRepo.deleteComment(state.comment.id);
    if (deleted) {
      ref.watch(pubSub.notifier).push(CommentDeletedEvent(state.comment.id));
    }
  }
}