import 'package:client/src/features/books/presentation/book_list/book_list_item_widget_controller.dart';
import 'package:client/src/features/books/presentation/widgets/book_status_widget.dart';
import 'package:client/src/features/books/presentation/widgets/readings_state_widget.dart';
import 'package:client/src/router/router.dart';
import 'package:client/src/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/constants/constants.dart';
import '../../../../common/widgets/my_image.dart';
import '../../domain/book.dart';


/// [listDirection] - axis of the list containing this item. 
class BookListItemWidget extends ConsumerStatefulWidget {
  const BookListItemWidget({
    super.key,
    required this.book,
    this.listDirection = Axis.vertical,
  });

  final Book book;
  final Axis listDirection;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BookListItemWidgetState();
}
class _BookListItemWidgetState extends ConsumerState<BookListItemWidget> {
  
  void showBook() {
    GoRouter.of(context).pushNamed(MyRoute.book.name, params: {
      'id': widget.book.id
    });
  }

  void bookmark() async {
    await ref.watch(bookListItemWidgetControllerProvider(widget.book).notifier)
      .toggleBookmark();
  } 

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(bookListItemWidgetControllerProvider(widget.book));
    final book = state.book;
    return InkWell(
      onTap: showBook,
      child: (widget.listDirection == Axis.horizontal) ? SizedBox(
        width: 160,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 176,
              width: 160,
              child: MyImage(
                placeholderIcon: const Icon(Icons.book_outlined, 
                  size: Constants.placeholderIconSize,
                  color: Colors.grey, 
                ),
                imageUrl: book.coverUrl,
              )
            ),
            h8gap,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: p8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(book.name, 
                            style: Theme.of(context).textTheme.titleMedium,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                          ),
                        ),
                        bookmarkIcon(book)
                      ]
                    ),
                    if (book.description != null) 
                      Text(book.description!,
                        style: TextStyle(color: Theme.of(context).colorScheme.outline),
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    h4gap,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (state.isMy) ReadingsStateWidget(state: book.state),
                          BookStatusWidget(status: book.status),
                        ],
                      )
                    )
                  ],
                ),
              ),
            ),
          ]
        ),
      ) 
      : Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 120,
            width: 96,
            child: MyImage(
              placeholderIcon: const Icon(Icons.book_outlined, 
                size: 72,
                color: Colors.grey, 
              ),
              imageUrl: book.coverUrl,
            )
          ),
          w8gap,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(book.name, 
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    ),
                    bookmarkIcon(book)
                  ]
                ),
                if (book.description != null && book.description!.isNotEmpty) 
                  Text(book.description!,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                h4gap,
                Row(
                  children: [
                    if (state.isMy) ReadingsStateWidget(state: book.state),
                    const Spacer(),
                    BookStatusWidget(status: book.status),
                  ]
                ),
                h4gap,
                Row(
                  children: [
                    Text(book.author.displayName ?? book.author.name,
                      style: const TextStyle(color: Colors.grey)
                    ),
                    const Spacer(),
                    const Icon(Icons.favorite, size: 16, color: Colors.grey),
                    w4gap,
                    Text(book.likes.toString(), 
                      style: const TextStyle(color: Colors.grey)
                    ),
                    w8gap,
                  ]
                )
              ]
            ),
          )
        ]
      ),
    );
  }

  Widget bookmarkIcon(Book book) {
    return InkWell(
      onTap: bookmark,
      child: Icon(book.bookmarked ?? false 
        ? Icons.bookmark 
        : Icons.bookmark_outline),
    );
  }
}