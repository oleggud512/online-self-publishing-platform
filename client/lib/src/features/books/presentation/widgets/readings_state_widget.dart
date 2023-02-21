import 'package:client/src/shared/constants.dart';
import 'package:flutter/material.dart';

import '../../../localization/application/ll.dart';
import '../../domain/book.dart';
import 'info_label_widget.dart';

class ReadingsStateWidget extends StatelessWidget {
  const ReadingsStateWidget({
    super.key,
    required this.state
  });

  final ReadingsState state;

  @override
  Widget build(BuildContext context) {
    final ll = curLl(context)!;
    switch (state) {
      case ReadingsState.published: return InfoLabelWidget(
        labelText: ll.book.published,
        color: AppColors.published(context)
      );
      case ReadingsState.unpublished: return InfoLabelWidget(
        labelText: ll.book.unpublished, 
        color: AppColors.unpublished
      );
    }
  }
}