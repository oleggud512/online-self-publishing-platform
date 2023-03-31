import 'package:client/src/features/notifications/data/notification_repository.dart';
import 'package:client/src/features/notifications/presentation/notifications_screen_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifications_screen_controller.g.dart';

@riverpod
class NotificationsScreenController extends _$NotificationsScreenController {
  NotificationRepository get notiRepo => ref.watch(NotificationRepository.provider);

  @override
  FutureOr<NotificationsScreenState> build() async {
    final notifications = await notiRepo.getNotifications();
    Future(listenNotificationsChanges);
    return NotificationsScreenState(notifications: notifications);
  }

  void listenNotificationsChanges() {
    ref.listen(NotificationRepository.notificationsStreamProvider, (prev, next) {
      next.when(
        data: (notifications) { 
          state = AsyncData(state.value!.copyWith(notifications: notifications));
        },
        loading: () {},
        error: (e, st) {}
      );
    });
  }

  Future<void> clearNotifications() async {
    notiRepo.clearNotifications();
  }

  Future<void> deleteNotification(String id) async {
    notiRepo.deleteNotification(id);
  }

}