import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/notification.dart';

part 'notifications_screen_state.freezed.dart';

@freezed
class NotificationsScreenState with _$NotificationsScreenState {
  factory NotificationsScreenState({
    @Default([]) List<MyNotification> notifications
  }) = _NotificationsScreenState;
}