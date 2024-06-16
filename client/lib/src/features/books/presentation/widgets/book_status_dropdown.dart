import 'package:client/src/features/books/domain/book.dart';
import 'package:client/src/features/localization/application/ext.dart';
import 'package:client/src/common/build_context_ext.dart';
import 'package:flutter/material.dart';

class BookStatusDropdown extends StatelessWidget {
  const BookStatusDropdown({super.key, this.value, this.onChanged});

  final BookStatus? value;
  final void Function(BookStatus? newStatus)? onChanged;

  @override
  Widget build(BuildContext context) {
    final ll = context.ll!;
    return DropdownButtonFormField<BookStatus>(
      value: value,
      items: BookStatus.values.map((s) => DropdownMenuItem(
        value: s,
        child: Text(ll.bookStatus(s)),
      )).toList(), 
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: ll.status
      ),
    );
  }
}