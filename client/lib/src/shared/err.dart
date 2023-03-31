import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../common/log.dart';
import '../common/widgets/error_handler.dart';

class AppError {
  String code;

  AppError(this.code);
}

Future<T> err<T>(Future<T> Function() func) async {
  try {
    return await func();
  } on DioError catch (e) {
    if (e.type == DioErrorType.unknown && e.error is SocketException) {
      printInfo("ConnectionException thrown from err<T>");
      throw ConnectionException();
    } else if (e.type == DioErrorType.badResponse) {
      throw AppError(e.response!.data['error']['code']);
    }
    rethrow;
  } 
}