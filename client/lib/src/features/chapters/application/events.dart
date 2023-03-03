import 'package:client/src/common/pub_sub.dart';

import '../domain/chapter.dart';

class ChaptersEditedEvent extends PubSubEvent { }


class ChapterUpdatedEvent extends ChaptersEditedEvent {
  final Chapter? chapter;

  ChapterUpdatedEvent([this.chapter]);
}


class ChapterAddedEvent extends ChaptersEditedEvent {
  final Chapter? chapter;

  ChapterAddedEvent([this.chapter]);
}


class ChapterDeletedEvent extends ChaptersEditedEvent { 
  final String chapterId;

  ChapterDeletedEvent(this.chapterId);
}