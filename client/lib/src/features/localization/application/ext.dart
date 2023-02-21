import 'package:client/src/features/books/domain/book.dart';
import 'package:client/src/features/localization/domain/localization.i69n.dart';

extension LocalizeBookStatus on Localization {
  String bookStatus(BookStatus status) {
    switch (status) {
      case BookStatus.abandoned: return book.abandoned;
      case BookStatus.inProgress: return book.inProgress;
      case BookStatus.completed: return book.completed;
    }
  }
}

extension LocalizeReadingsState on Localization {
  String readingsState(ReadingsState status) {
    switch (status) {
      case ReadingsState.published: return book.published;
      case ReadingsState.unpublished: return book.unpublished;
    }
  }
}