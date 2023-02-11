import 'package:client/src/common/hardcoded.dart';
import 'package:flutter/material.dart';

import '../../features/localization/application/ll.dart';

class SeeAllHeader extends StatelessWidget {
  const SeeAllHeader({super.key, 
    this.label,
    this.labelText,
    required this.onSeeAll
  });

  final Widget? label;
  final String? labelText;
  final void Function() onSeeAll;

  Widget _getLabel(BuildContext context) {
    if (label != null) return label!;
    if (labelText != null) {
      return Text(labelText!, 
        style: Theme.of(context).textTheme.headlineSmall
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    final ll = curLl(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _getLabel(context),
        OutlinedButton(
          onPressed: onSeeAll, 
          child: Text(ll.seeAll)
        )
      ]
    );
  }
}