import 'dart:convert';

import 'package:client/firebase_options.dart';
import 'package:client/src/app.dart';
import 'package:client/src/common/log.dart';
import 'package:client/src/features/auth/data/auth_repository.dart';
import 'package:client/src/features/books/application/local_bookmarks_provider.dart';
import 'package:client/src/features/localization/data/localization_controller.dart';
import 'package:client/src/features/notifications/data/notification_service.dart';
import 'package:client/src/router/router.dart';
import 'package:client/src/shared/constants.dart';
import 'package:client/src/shared/dio.dart';
import 'package:client/src/shared/sembast.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;
import 'package:firebase_core/firebase_core.dart';


void main() async {
  await dotenv.load();
  
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };

  final container = ProviderContainer(
    overrides: [ ]
  );
  
  // initialize localization - load current locale
  await container.read(localizationControllerProvider.notifier).loadLocale();
  // create sembast database instance
  await container.read(sembastDatabaseFutureProvider.future);
  // initialize bookmarks - start observing local bookmarks
  container.read(localBookmarksControllerProvider);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final token = await container.read(authRepositoryProvider).currentUser?.getIdToken(true);

  await NotificationService.requestPermissions();
  await NotificationService.init();

  try {
    if (token != null) await NotificationService.syncToken(container.read(dioProvider));
  } on DioError catch (e) {
    if (e.response?.data['error']['code'] == 'blockedUserAuth') {
      container.read(routerProvider).goNamed(MyRoute.blocked.name);
    }  
  } on FirebaseAuthException catch (e) {
    printInfo(e.code);
    if (e.code == 'firebase_auth/user-token-expired') {
      container.read(routerProvider).goNamed(MyRoute.blocked.name);
    }
  }
  
  runApp(UncontrolledProviderScope(
    container: container,
    child: const MyApp()
  ));
}