import 'package:client/src/common/constants/constants.dart';
import 'package:client/src/common/error.dart';
import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/common/log.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension GuardX<T> on AsyncValue<T> {
  Future<AsyncValue<T>> guardX(Future<T> Function() callback) async {
    return await AsyncValue.guard(() async {
      try {
        return await callback();
      } on DioError catch (e) {
        printError(e.toString());
        if (e.type == DioErrorType.other && e.message.contains('SocketException')) {
          printInfo("ConnectionException thrown");
          throw ConnectionException();
        }
        switch (e.response?.statusCode) {
          case 404:
            printInfo("NotFoundException thrown");
            throw NotFoundException();
          case 500: 
            printInfo("AppException thrown");
            throw AppException();
        }
        rethrow;
      }
    });
  }
}

Widget defaultErrorHandler(Object e, StackTrace st) {
  printError(e.toString());
  printError(st.toString());
  printError('there is an error: ${e.runtimeType}');
  if (e is NotFoundException) {
    printInfo("NotFoundException handled");
    return ErrorScreen(
      message: "Not Found".hardcoded,
      title: "Not Found".hardcoded,
    );
  }
  else if (e is ConnectionException) {
    printInfo("ConnectionException handled");
    return ErrorScreen(
      message: "Connection Error".hardcoded,
      title: "Check your Internet connection".hardcoded,
    );
  }
  return const ErrorScreen();
}

Widget defaultLoading() {
  return const Scaffold(
    body: Center(
      child: CircularProgressIndicator()
    )
  );
}

class ErrorScreen extends ConsumerWidget {
  const ErrorScreen({
    super.key, 
    this.message = "Error.",
    this.title,
    this.actionMessage,
    this.onAction
  }) : assert(
    actionMessage != null && onAction != null || 
    actionMessage == null && onAction == null
  );

  final String message;
  final String? title;
  final String? actionMessage;
  final void Function()? onAction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: (title != null) ? AppBar(
        title: Text(title!),
        centerTitle: true,
      ) : null,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(p8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline_sharp,
                color: Colors.red,
                size: 96,
              ),
              h8gap,
              Text(message,
                style: Theme.of(context).textTheme.headlineSmall
              ),
              h8gap,
              if (onAction != null) FilledButton(
                onPressed: onAction,
                child: Text(actionMessage!),
              )
            ]
          ),
        )
      )
    );
  }
}