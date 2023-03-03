import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/chapter.dart';

part 'chapter_screen_state.freezed.dart';

@freezed
class ChapterScreenState with _$ChapterScreenState {
  factory ChapterScreenState({
    required Chapter chapter
  }) = _ChapterScreenState;
}