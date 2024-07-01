import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/quill_delta.dart';

class QuillReadOnlyView extends StatelessWidget {
  const QuillReadOnlyView({
    super.key,
    required this.rawQuill,
  });

  final String rawQuill;

  @override
  Widget build(BuildContext context) {
    return QuillRawEditor(
      configurations: QuillRawEditorConfigurations(
        controller: QuillController.basic()
          ..document = rawQuill.isNotEmpty 
            ? Document.fromJson(
              jsonDecode(rawQuill)
            )
            : Document.fromDelta(Delta()..insert("<< no data >>\n")), 
        focusNode: FocusNode(), 
        scrollController: ScrollController(), 
        scrollBottomInset: 0, 
        cursorStyle: CursorStyle(
          color: Theme.of(context).colorScheme.primary, 
          backgroundColor: Colors.transparent,
        ), 
        selectionColor: Theme.of(context).colorScheme.primaryContainer, 
        selectionCtrls: MaterialTextSelectionControls(), 
        embedBuilder: (node) {
          throw UnimplementedError();
        }, 
        autoFocus: false,
        readOnly: true,
      ),
    );
  }
}