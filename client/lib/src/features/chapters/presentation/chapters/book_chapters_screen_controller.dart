import 'package:client/src/common/mutable_list.dart';
import 'package:client/src/common/pagination/pagination_controller.dart';
import 'package:client/src/features/chapters/application/events.dart';
import 'package:client/src/features/chapters/data/chapter_repository.dart';
import 'package:client/src/features/chapters/domain/chapter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../auth/application/my_id_provider.dart';
import '../../../books/presentation/book/book_screen_controller.dart';

part 'book_chapters_screen_controller.g.dart';

@riverpod
class BookChaptersScreenController extends _$BookChaptersScreenController
    with PaginationController<Chapter> {
  ChapterRepository get chapterRepo => ref.watch(chapterRepositoryProvider);

  @override
  FutureOr<List<Chapter>> build(String bookId) async {
    final chapters = await getItems(0);
    return chapters;
  }

  void handleEdited(ChaptersEditedEvent event) {
    if (event is ChapterAddedEvent && event.chapter != null) {
      state = AsyncData(state.value!.copyWith(event.chapter!, start: true));
    } else if (event is ChapterUpdatedEvent && event.chapter != null) {
      state = AsyncData(state.value!.withReplacement(
          event.chapter!, (ch) => ch.id == event.chapter!.id));
    }
  }


  bool get isMy => ref.watch( // TODO: duplicate (chapter_screen_controller.dart)
    bookScreenControllerProvider(bookId)
        .select((b) => b.value!.book.author.id)) == ref.watch(myIdProvider);
  
  @override
  List<Chapter> get listState => state.value!;

  @override
  set listState(List<Chapter> newChapters) => state = AsyncData(newChapters);
  
  @override
  PaginationItemsCallback<Chapter> get getItems => (int from) {
    return chapterRepo.getChapters(bookId, from);
  };
}