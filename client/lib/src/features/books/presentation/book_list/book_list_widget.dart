import 'package:client/src/common/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../domain/book.dart';
import 'book_list_item_widget.dart';

class BookListWidget extends StatelessWidget {
  const BookListWidget({
    super.key,
    required this.books,
    this.listDirection = Axis.horizontal
  });

  final List<Book> books;
  final Axis listDirection;

  @override
  Widget build(BuildContext context) {
    
    return listDirection == Axis.horizontal 
      ? SingleChildScrollView(
        scrollDirection: listDirection, 
        child: IntrinsicHeight(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...books.map((b) => Padding(
                  padding: const EdgeInsets.only(left: p16),
                  child: BookListItemWidget(
                    book: b, 
                    listDirection: listDirection
                  ),
                )).toList(),
                w16gap
              ] 
            )
        ),
      )
      : ListView.separated(
        itemCount: books.length,
        scrollDirection: listDirection,
        itemBuilder: (context, i) {
          return BookListItemWidget(
            book: books[i], 
            listDirection: listDirection
          );
        },
        separatorBuilder: (context, index) => listDirection == Axis.horizontal 
          ? w8gap 
          : h8gap, 
      );
  }
}