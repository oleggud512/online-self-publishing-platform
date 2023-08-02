import 'package:client/src/common/build_context_ext.dart';
import 'package:client/src/features/notifications/domain/display_notification_model.dart';
import 'package:client/src/features/notifications/domain/notification.dart';
import 'package:client/src/features/notifications/presentation/policy_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../common/constants/constants.dart';
import '../../../shared/constants.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key, required this.notification});

  final MyNotification notification;

  @override
  Widget build(BuildContext context) {
    final ll = context.ll!;
    final data = DisplayNotificationModel.fromLocalization(ll, notification);
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: p8),
        child: ListTile(
          title: Text(data.title),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Html(
                data: data.body,
                style: {
                  'body': Style(
                    padding: HtmlPaddings.all(0), 
                    margin: Margins.zero,
                  )
                },
                onLinkTap: (link, _, __) {
                  if (link == null) return;
                  PolicyDialog.show(context);
                }
              ),
              Text(Constants.dateFormat.format(notification.sentTime), 
                style: Theme.of(context).textTheme.labelMedium!
                  .copyWith(
                    color: Colors.grey
                  ),
                textAlign: TextAlign.end
              )
            ]
          ),
        ),
      ),
    );
  }
}
