import 'package:client/src/shared/utils.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      printError('from iterceptor');
      printError(e);
      printError(e.stackTrace);
      printInfo(e.response?.statusCode);

      if (e.response?.statusCode == 401) {
        try {
          Utils.showMessage(ref, "Not signed in.");
        } catch (e) {
          printError('nothing much. just can\'t show not signed in message');
        }
      }
      printInfo('something');
      final code = e.response?.data?['error']?['code'];
      printInfo(code);
      if (code == 'blockedUserAuth') {
        try {
          Utils.showMessage(ref, 'User is blocked');
        } catch (e) {
          printError('cant show blocked message');
        }
      }
      
      printError('end from interceptor');
      handler.next(e);
    },
    // onResponse: (response, handler) {
    //   handler.next(response);
    // }
  ));
  return dio;
});
