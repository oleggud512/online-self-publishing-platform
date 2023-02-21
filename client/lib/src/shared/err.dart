import 'dart:async';

import 'package:dio/dio.dart';

import '../common/log.dart';
import '../common/widgets/error_handler.dart';

Future<T> err<T>(Future<T> Function() func) async {
  try {
    return await func();
  } on DioError catch (e) {
    if (e.type == DioErrorType.other && e.message.contains('SocketException')) {
      printInfo("ConnectionException thrown");
      throw ConnectionException();
    }
    rethrow;
  } 
}