import 'package:client/src/features/chapters/domain/chapter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_chapter_screen_state.freezed.dart';

@freezed
class EditChapterScreenState with _$EditChapterScreenState {
  factory EditChapterScreenState({
    required Chapter chapter
  }) = _EditChapterScreenState;
}