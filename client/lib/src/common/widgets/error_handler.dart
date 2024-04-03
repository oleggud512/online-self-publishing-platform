import 'dart:io';

import 'package:client/src/common/constants/constants.dart';
import 'package:client/src/common/log.dart';
import 'package:client/src/common/widgets/connection_error_screen.dart';
import 'package:client/src/common/widgets/not_found_error_screen.dart';
import 'package:client/src/features/auth/presentation/unauthenticated_error_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppException implements Exception { }

class NotFoundException extends AppException { }

class UnauthenticatedException extends AppException { }

class ConnectionException extends AppException { 
  ConnectionException() {
    printInfo("I am the ConnectionException!");
  }
}

extension GuardX<T> on AsyncValue<T> {
  Future<AsyncValue<T>> guardX(Future<T> Function() callback) async {
    return await AsyncValue.guard(() async {
      try {
        return await callback();
      } on DioError catch (e) {
        printError(e.toString());
        if (e.type == DioErrorType.unknown && e.error is SocketException) {
          printInfo("ConnectionException thrown from guardX");
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
  printError("defaultErrorHandler: ${e.toString()}");
  printError("defaultErrorHandler: ${st.toString()}");
  printError('defaultErrorHandler prints an error type: ${e.runtimeType}');
  if (e is NotFoundException) {
    printInfo("NotFoundException handled");
    return const NotFoundErrorScreen();
  }
  else if (e is ConnectionException) {
    printInfo("ConnectionException handled");
    return const ConnectionErrorScreen();
  }
  else if (e is UnauthenticatedException) {
    printInfo("UnatuhenticatedException handled in defaultErrorHandler");
    return const UnauthenticatedErrorScreen();
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
  final void Function(BuildContext context)? onAction;

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
                onPressed: () => onAction!(context),
                child: Text(actionMessage!),
              )
            ]
          ),
        )
      )
    );
  }
}
