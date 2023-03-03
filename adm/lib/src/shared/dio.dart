
import 'dart:convert';

import 'package:adm/src/features/authentication/data/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider((ref) {
  final dio = Dio(BaseOptions(
    // baseUrl: 'http://127.0.0.1:5001/fir-auth-node-example/us-central1/api/',
    baseUrl: 'http://localhost:3000/api/v1/'
  ));
  dio.interceptors.add(QueuedInterceptorsWrapper(
    onRequest: (options, handler) {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        print("iterceptor - user is not signed in");
        handler.next(options);
        return;
      }

      FirebaseAuth.instance.currentUser?.getIdToken().then((token) {
        options.headers['authorization'] = 'Bearer $token';
        handler.next(options);
      });
    },
    // onResponse: (response, handler) {
    //   print("onResponse");
    //   response.data = jsonDecode(response.data);
    //   print(response.data.runtimeType);
    //   print(response.data);
    //   handler.next(response);
    // }
  ));
  return dio;
});