import 'package:client/src/common/build_context_ext.dart';
import 'package:client/src/shared/errors/widgets/error_screen.dart';
import 'package:flutter/material.dart';

class ConnectionErrorScreen extends StatelessWidget {
  const ConnectionErrorScreen({
    super.key,
    this.retry
  });

  final ErrorAction? retry;

  @override
  Widget build(BuildContext context) {
    final ll = context.ll!;
    return ErrorScreen(
      title: ll.errors.connectionError,
      message: ll.errors.connectionErrorMessage,
      actionMessage: ll.errors.connectionErrorRetryMsg,
      onAction: retry,
    );
  }
}
