import 'package:client/src/common/build_context_ext.dart';
import 'package:flutter/material.dart';

class DescriptionFormField extends StatelessWidget {
  const DescriptionFormField({
    super.key,
    this.initialValue,
    this.onChanged
  });

  final String? initialValue;
  final void Function(String newV)? onChanged;

  @override
  Widget build(BuildContext context) {
    final ll = context.ll!;
    return SizedBox(
      height: 200,
      child: TextFormField(
        initialValue: initialValue,
        textAlignVertical: TextAlignVertical.top,
        maxLength: 255,
        expands: true,
        maxLines: null,
        minLines: null,
        decoration: InputDecoration(
          labelText: ll.description,
          alignLabelWithHint: true,
        ),
        onChanged: onChanged,
      ),
    );
  }
}