import 'package:flutter/material.dart';

import 'package:client/src/common/build_context_ext.dart';

class SeeAllHeader extends StatelessWidget {
  const SeeAllHeader({super.key, 
    this.label,
    this.labelText,
    this.onSeeAll,
    this.showSeeAll = true
  });

  final Widget? label;
  final String? labelText;
  final void Function()? onSeeAll;
  final bool showSeeAll;

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
    final ll = context.ll!;
    return Row(
      mainAxisAlignment: showSeeAll 
        ? MainAxisAlignment.spaceBetween
        : MainAxisAlignment.start,
      children: [
        _getLabel(context),
        if (showSeeAll) OutlinedButton(
          onPressed: onSeeAll, 
          child: Text(ll.seeAll)
        )
      ]
    );
  }
}
