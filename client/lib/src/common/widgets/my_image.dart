
import 'dart:io';

import 'package:flutter/material.dart';

import '../constants/constants.dart';

class MyImage extends StatelessWidget {
  const MyImage({
    super.key,
    required this.imageUrl,
    this.placeholderIconSize = 96,
    this.placeholderIcon,
    this.onTap,
    this.size
  });

  final String? imageUrl;
  final double? placeholderIconSize;
  final Widget? placeholderIcon;
  final void Function()? onTap;
  final Size? size;

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(p8),
      child: (imageUrl != null) 
        ? Container(decoration: BoxDecoration(image: DecorationImage(
            fit: BoxFit.cover,
            image: (RegExp(r'http[s]?:\/\/').hasMatch(imageUrl!)
              ? NetworkImage(imageUrl!)
              : FileImage(File(imageUrl!))) as ImageProvider<Object>
          )))
        : Center(
          child: placeholderIcon ?? Icon(Icons.person_outline, 
            color: Colors.grey, 
            size: placeholderIconSize
          )
        )
    );
  }

  Widget _wrapWithSize(Widget child) {
    return SizedBox.fromSize(size: size, child: child);
  }

  Widget _wrapWithInkWell(Widget child) {
    return Card(
      margin: EdgeInsets.zero,
      child: Stack(
        children: [
          _wrapWithSize(child),
          _wrapWithSize(Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.white,
              onTap: onTap,
              borderRadius: BorderRadius.circular(p8),
            ),
          )),
        ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _wrapWithInkWell(_buildImage());
  }
}