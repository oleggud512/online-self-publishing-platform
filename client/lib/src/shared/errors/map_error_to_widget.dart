import 'package:client/src/shared/errors/widgets/connection_error_screen.dart';
import 'package:client/src/shared/errors/exceptions.dart';
import 'package:client/src/shared/errors/widgets/error_screen.dart';
import 'package:client/src/shared/errors/widgets/not_found_error_screen.dart';
import 'package:client/src/shared/errors/widgets/unauthenticated_error_screen.dart';
import 'package:client/src/shared/logger.dart';
import 'package:flutter/material.dart';

Widget mapErrorToWidget(
  Object e, 
  StackTrace st,
  {
    ErrorAction? connectionErrorAction
  }
) {
  if (e is NotFoundException) {
    glogger.i("NotFoundException handled");
    return const NotFoundErrorScreen();
  }
  else if (e is ConnectionException) {
    glogger.i("ConnectionException handled");
    return ConnectionErrorScreen(
      retry: connectionErrorAction
    );
  }
  else if (e is UnauthenticatedException) {
    glogger.i("UnatuhenticatedException handled in defaultErrorHandler");
    return const UnauthenticatedErrorScreen();
  }
  return const ErrorScreen();
}