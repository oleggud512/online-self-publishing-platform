import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class MyAvatar extends StatelessWidget {
  MyAvatar({
    super.key,
    required this.url,
    this.radius
  });

  final String url;
  double? radius;

  final logger = Logger();

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius ?? 24,
      backgroundImage: NetworkImage(url),
      onBackgroundImageError: (exception, stackTrace) {
        // logger.e("MyAvatar - no image", exception, stackTrace);
      },
    );
  }
}