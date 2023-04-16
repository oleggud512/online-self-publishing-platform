import 'dart:convert' as conv;

import 'package:client/src/features/localization/application/current_localization.dart';
import 'package:client/src/features/localization/data/localization_controller.dart';
import 'package:client/src/features/notifications/data/notification_repository.dart';
import 'package:client/src/features/notifications/domain/display_notification_model.dart';
import 'package:client/src/features/notifications/domain/notification.dart';
import 'package:client/src/shared/err.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i69n/i69n.dart';

import '../../../common/log.dart';
import '../../../shared/constants.dart';
import '../../../shared/utils.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  if (!NotificationService.isInitialized) { 
    printInfo('reinit');
    await NotificationService.init();
  }

  printInfo(const conv.JsonEncoder.withIndent('  ').convert(message.toMap()));
  final db = await Utils.makeSembastDatabase();
  final repo = NotificationRepository(db);

  final String? notificationType = message.data[Str.notificationType];

  printInfo('notification arrived...... . . . . . . .  .   .');

  if (notificationType == null) {
    NotificationService.showNotification(
      body: 'Unexpected Notification Type',
      title: 'Unknown notification'
    );
    return;
  }
  final not = MyNotification.fromJson(message.toMap()..addAll(message.data));
  final notId = await repo.addNotification(not);
  
  final container = ProviderContainer();
  await container.read(localizationControllerProvider.notifier).loadLocale();
  final localization = container.read(currentLocalizationProvider);
  
  final data = DisplayNotificationModel.fromLocalization(localization, not);

  NotificationService.showNotification(body: data.body, title: data.title);
  printSuccess("Handling a background message: ${const conv.JsonEncoder.withIndent('  ').convert(message.toMap())}\nlocal notification id = $notId\n\n");
}


class NotificationService {
  static final flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static final _mess = FirebaseMessaging.instance;

  static bool _isInitialized = false;
  static bool get isInitialized => _isInitialized;

  static init() async {
    printError('NotificationService.init()');
    await _initFirebaseMessaging();
    const androidInit = AndroidInitializationSettings('mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings();
    const initNtf = InitializationSettings(android: androidInit, iOS: iosInit);
    await flutterLocalNotificationsPlugin.initialize(initNtf);
    _isInitialized = true;
  }

  static _initFirebaseMessaging() async {
    _mess.setAutoInitEnabled(true);
    // FirebaseMessaging.instance.requestPermission();
    FirebaseMessaging.onMessage.listen(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static Future<void> syncToken(Dio dio) => err(() async {
    try {
      final token = await FirebaseMessaging.instance.getToken() ;
      final resp = await dio.post('notifications/fcm', data: { 
        'token': token
      });
    } catch (e) {
      printError('syncToken - rethrown $e');
      rethrow;
    }
  });

  static requestPermissions() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
  }

  static showNotification({required String title, required String body}) async {
    AndroidNotificationDetails det = const AndroidNotificationDetails(
      'chchch',
      'channel1',
      importance: Importance.max,
      priority: Priority.max,
    );

    var not = NotificationDetails(
      android: det,
      iOS: const DarwinNotificationDetails(),
    );
    await flutterLocalNotificationsPlugin.show(0, title, body, not);
  }
}
