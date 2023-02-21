import 'package:client/src/common/constants/constants.dart';
import 'package:flutter/material.dart';

class InfoLabelWidget extends StatelessWidget {
  const InfoLabelWidget({
    super.key,
    required this.labelText,
    this.iconData,
    this.color
  });

  final IconData? iconData;
  final Color? color;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(iconData ?? Icons.circle, color: color, size: 12),
        w4gap,
        Text(labelText, 
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: color
          ),
        )
      ]
    );
  }
}