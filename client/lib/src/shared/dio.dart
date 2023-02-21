import 'package:client/src/features/localization/application/current_localization.dart';
import 'package:client/src/router/router.dart';
import 'package:client/src/shared/scaffold_messanger.dart';
import 'package:client/src/shared/utils.dart';
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
      printError(e.stackTrace);
      printInfo(e.response?.statusCode);

      if (e.response?.statusCode == 401) {
        Utils.showMessage(ref, "Not signed in.");
      }
      // final code = e.response?.data['error']['code'];
      // if (code) {
      //   ref.watch(scaffoldMessangerStateProvider).showMessage(
      //     ref.watch(currentLocalizationProvider)['errors.$code'].toString());
      // }
      // if (e.type == DioErrorType.other && e.message.contains('SocketException')) {
      //   ref.watch(scaffoldMessangerStateProvider).showMessage(
      //     "No Internet from interceptor");
      // }
      // switch (e.response?.statusCode) {
      //   case 404:
      //     throw NotFoundException();
      //   case 500: 
      //     throw AppException();
      //   default:
      // }
      handler.next(e);
    },
    // onResponse: (response, handler) {
    //   handler.next(response);
    // }
  ));
  return dio;
});