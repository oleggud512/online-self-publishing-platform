import 'package:client/src/common/pub_sub.dart';

import '../domain/book.dart';


class BooksChangedEvent extends PubSubEvent {}


class BookEditedEvent extends BooksChangedEvent {
  final Book updatedBook;

  BookEditedEvent(this.updatedBook);
}


class BookDeletedEvent extends BooksChangedEvent { }


class BookAddedEvent extends BooksChangedEvent { }