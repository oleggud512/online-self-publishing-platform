import 'package:client/src/features/localization/application/ll.dart';
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
    final ll = curLl(context)!;
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