import 'package:client/src/common/mutable_list.dart';
import 'package:client/src/common/pagination/pagination_controller.dart';
import 'package:client/src/features/comments/data/comment_repository.dart';
import 'package:client/src/features/comments/domain/comment.dart';
import 'package:client/src/features/comments/presentation/comments/comments_content_field_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../common/pub_sub.dart';
import '../../application/comment_deleted_event.dart';
import 'comments_widget_state.dart';

part 'comments_widget_controller.g.dart';

@riverpod
class CommentsWidgetController extends _$CommentsWidgetController
    with PaginationController<Comment> {
  CommentRepository get commentRepo => ref.watch(commentRepositoryProvider);
  @override
  FutureOr<CommentsWidgetState> build(String subjectId, String subjectName) async {
    _listenDeletion();
    return CommentsWidgetState(comments: await getItems(0));
  }

  void _listenDeletion() {
    ref.listen(pubSub, (prev, next) {
      if (next is CommentDeletedEvent) {
        final comments = state.value!.comments.where((a) => a.id == next.commentId).toList();
        if (comments.isEmpty) return;
        state = AsyncData(state.value!.copyWith(
          comments: state.value!.comments.copyWithout(comments[0])
          )
        );
      }
    });
  }

  set sorting(String newSorting) {
    state = AsyncData(state.value!.copyWith(
      sorting: newSorting
    ));
    refresh();
  }

  Future<void> addComment() async {
    final Comment newComment = await commentRepo.addComment(
      content: ref.watch(commentsContentFieldState), 
      subjectId: subjectId,
      subjectName: subjectName,
    );
    ref.watch(commentsContentFieldState.notifier).state = "";
    state = AsyncData(
      state.value!.copyWith(
        comments: state.value!.comments.copyWith(newComment, start: true),
      ),
    );
  }
  
  @override
  set listState(List<Comment> newComments) => 
      state = AsyncData(state.value!.copyWith(comments: newComments));

  @override
  List<Comment> get listState => state.value!.comments;
  
  @override
  PaginationItemsCallback<Comment> get getItems => (int from) {
    return commentRepo.getComments(subjectId, 
      sorting: state.value?.sorting ?? CommentsSorting.nnew,
      from: from
    );
  };
}