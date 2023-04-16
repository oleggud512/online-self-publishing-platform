import 'package:client/src/common/build_context_ext.dart';
import 'package:client/src/common/widgets/error_handler.dart';
import 'package:flutter/material.dart';

class ConnectionErrorScreen extends StatelessWidget {
  const ConnectionErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ErrorScreen(
      title: context.ll!.errors.connectionError,
      message: context.ll!.errors.connectionErrorMessage
    );
  }
}
