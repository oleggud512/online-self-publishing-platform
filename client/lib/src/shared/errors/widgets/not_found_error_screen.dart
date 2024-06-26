import 'package:client/src/common/build_context_ext.dart';
import 'package:client/src/shared/errors/widgets/error_screen.dart';
import 'package:flutter/material.dart';

class NotFoundErrorScreen extends StatelessWidget {
  const NotFoundErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ErrorScreen(
      message: context.ll!.errors.notFound,
      title: context.ll!.errors.notFound
    );
  }
}
