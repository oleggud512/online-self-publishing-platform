import 'package:client/src/common/error.dart';
import 'package:client/src/router/router.dart';
import 'package:client/src/shared/scaffold_messanger.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/log.dart';
import 'constants.dart';

final dioProvider = Provider((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseApiUrl
    )
  );
  dio.interceptors.add(QueuedInterceptorsWrapper(
    onRequest: (options, handler) {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        printInfo("iterceptor - user is not signed in");
        handler.next(options);
        return;
      }
      FirebaseAuth.instance.currentUser?.getIdToken().then((token) {
        options.headers['authorization'] = 'Bearer $token';
        handler.next(options);
      });
    },
    onError: (e, handler) {
      printError(e);
      if (e.type == DioErrorType.other && e.message.contains('SocketException')) {
        throw ConnectionException();
      }
      switch (e.response?.statusCode) {
        case 404:
          throw NotFoundException();
        case 500: 
          throw AppException();
        default:
      }
      handler.next(e);
    },
    // onResponse: (response, handler) {
    //   handler.next(response);
    // }
  ));
  return dio;
});