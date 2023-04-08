import 'package:client/src/features/chapters/data/chapter_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/application/my_id_provider.dart';
import '../../../books/presentation/book/book_screen_controller.dart';
import '../../domain/chapter.dart';
import 'chapter_screen_state.dart';

part 'chapter_screen_controller.g.dart';

@riverpod
class ChapterScreenController extends _$ChapterScreenController {
  ChapterRepository get chapterRepo => ref.watch(chapterRepositoryProvider);
  
  @override
  FutureOr<ChapterScreenState> build(String chapterId) async {
    final chapter = await chapterRepo.getChapter(chapterId);
    final state = ChapterScreenState(chapter: chapter);
    if (chapter.isUnpublished) return state;
    final nav = await chapterRepo.getNavigation(chapterId);
    return state.copyWith(
      next: nav.next,
      previous: nav.previous
    );
  }

  void refresh() async {
    state = AsyncData(state.value!.copyWith(
      chapter: await chapterRepo.getChapter(chapterId)
    ));
  }
  
  bool get isMy => ref.watch( // TODO: duplicate (book_chapters_screen_controller.dart)
    bookScreenControllerProvider(state.value!.chapter.book.id)
        .select((b) => b.value!.book.author.id)) == ref.watch(myIdProvider);

  void setChapter(Chapter chapter) {
    state = AsyncData(state.value!.copyWith(chapter: chapter));
  }
}