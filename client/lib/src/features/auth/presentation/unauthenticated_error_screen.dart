import 'package:client/src/common/build_context_ext.dart';
import 'package:client/src/common/widgets/error_handler.dart';
import 'package:client/src/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UnauthenticatedErrorScreen extends StatelessWidget {
  const UnauthenticatedErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ll = context.ll!;
    return ErrorScreen(
      message: ll.errors.unauthenticated,
      title: ll.auth.authenticate,
      actionMessage: ll.auth.authenticate,
      onAction: (context) {
        context.goNamed(MyRoute.auth.name);
      }
    );
  }
}
