import 'dart:async';
import 'dart:io';

import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/shared/errors/errors.dart';
import 'package:dio/dio.dart';

import 'exceptions.dart';
import '../logger.dart';


Future<T> handleError<T>(Future<T> Function() func) async {
  try {
    glogger.i('err wrapper: inner function execution');
    return await func();
  } on DioException catch (e) {
    glogger.i('err wrapper: DIOERROR CAUGHT');
    if (e.type == DioExceptionType.connectionError && e.error is SocketException) {
      glogger.i("err wrapper: e.type == DioExceptionType.unknown && e.error is SocketException");
      throw ConnectionException();
    } 
    if (e.type == DioExceptionType.badResponse) {
      glogger.i("err wrapper: e.type == DioExceptionType.badResponse");
      final errorCode = e.response!.data['error'.hardcoded]['code'.hardcoded];
      if (errorCode == 'blockedUserAuth'.hardcoded) {
        glogger.i("err wrapper: blocked user error");
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