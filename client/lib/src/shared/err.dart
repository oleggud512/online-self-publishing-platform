import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../common/log.dart';
import '../common/widgets/error_handler.dart';
import 'logger.dart';

class AppError {
  String code;

  AppError(this.code);
}

class BlockedAppError extends AppError {
  BlockedAppError(super.code);
}

Future<T> err<T>(Future<T> Function() func) async {
  try {
    glogger.t('err wrapper: inner function execution');
    return await func();
  } on DioException catch (e) {
    printInfo('DIOERROR CAUGHT');
    if (e.type == DioExceptionType.unknown && e.error is SocketException) {
      printInfo("ConnectionException thrown from err<T>");
      throw ConnectionException();
    } 
    if (e.type == DioExceptionType.badResponse) {
      printInfo('FUCK. IT\'S A BAD RESPONSE');
      final errorCode = e.response!.data['error']['code'];
      if (errorCode == 'blockedUserAuth') {
        printInfo('I DID THROW BLOCKED ERROR');
        throw BlockedAppError(errorCode);
      }
      throw AppError(errorCode);
    }
    rethrow;
  } catch (e) {
    glogger.e('err wrapper: unhandled exception');
    rethrow;
  }
}
