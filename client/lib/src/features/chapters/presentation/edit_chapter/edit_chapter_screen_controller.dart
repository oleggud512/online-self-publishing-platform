import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/common/log.dart';
import 'package:client/src/features/books/domain/book.dart';
import 'package:client/src/features/chapters/data/chapter_repository.dart';
import 'package:client/src/features/chapters/domain/chapter.dart';
import 'package:client/src/shared/scaffold_messanger.dart';
import 'package:client/src/shared/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../common/pub_sub.dart';
import 'edit_chapter_screen_state.dart';

part 'edit_chapter_screen_controller.g.dart';

@riverpod
class EditChapterScreenController extends _$EditChapterScreenController {
  ChapterRepository get chapterRepo => ref.watch(chapterRepositoryProvider);

  EditChapterScreenState build(Chapter chapterToEdit) {
    return EditChapterScreenState(chapter: chapterToEdit);
  }

  Future<ReadingsState?> toggleState() async {
    try {
      final newReadingsState = await chapterRepo.toggleState(state.chapter.id);
      printSuccess(newReadingsState);
      state = state.copyWith(chapter: state.chapter.copyWith(state: newReadingsState));
      return newReadingsState;
    } catch (e) {
      return null;
    }
  }

  set content(String n) {
    state = state.copyWith.chapter.call(content: n);
  }
  set name(String n) {
    state = state.copyWith.chapter.call(name: n);
  }

  Future<Chapter> save() async {
    printInfo('chapter before save: ${state.chapter}');
    Chapter chapter = state.chapter.exists()
      ? await chapterRepo.updateChapter(state.chapter)
      : await chapterRepo.addChapter(state.chapter); 
    return chapter;
  }

  Future<void> deleteThisChapter() async {
    await chapterRepo.deleteChapter(state.chapter.id);
  }
}
