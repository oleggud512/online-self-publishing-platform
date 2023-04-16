import 'package:client/src/common/widgets/error_handler.dart';
import 'package:client/src/features/localization/application/current_localization.dart';
import 'package:client/src/features/notifications/domain/display_notification_model.dart';
import 'package:client/src/features/notifications/presentation/notification_widget.dart';
import 'package:client/src/features/notifications/presentation/notifications_screen_controller.dart';
import 'package:client/src/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../common/constants/constants.dart';
import '../../../common/log.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NotificationsScreenState();
}
class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    final ll = ref.watch(currentLocalizationProvider);
    final cont = ref.watch(notificationsScreenControllerProvider.notifier);
    final state = ref.watch(notificationsScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(ll.screenTitle.notifications),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever_outlined),
            onPressed: () {
              cont.clearNotifications();
            }, 
          )
        ]
      ),
      body: state.when(
        data: (state) => ListView.separated(
          padding: const EdgeInsets.all(p16),
          separatorBuilder: (context, i) => h16gap,
          itemCount: state.notifications.length,

          itemBuilder: (context, index) {
            final n = state.notifications[index];
            return Dismissible(
              key: Key(n.localId),
              onDismissed: (direction) {
                cont.deleteNotification(n.localId);
              },
              child: NotificationWidget(notification: n)
            );
          }

        ),
        loading: defaultLoading,
        error: defaultErrorHandler
      )
    );
  }
}
