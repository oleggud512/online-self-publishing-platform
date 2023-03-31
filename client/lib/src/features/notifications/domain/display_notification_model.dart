import 'package:client/src/features/localization/domain/localization.i69n.dart';
import 'package:client/src/features/notifications/domain/notification.dart';
import 'package:i69n/i69n.dart';

class DisplayNotificationModel {
  String title;
  String body;

  DisplayNotificationModel(this.title, this.body);
  
  factory DisplayNotificationModel.fromLocalization(Localization ll, MyNotification not) { 
    final notLoc = ll.notifications;
    final notData = notLoc[not.notificationType] as I69nMessageBundle;
    final title = notData["title"];
    final body = notData["body"];
    final data = not.toJson();

    return DisplayNotificationModel(
      title is Function ? title(data) : title, 
      body is Function ? body(data) : body
    );
  }
}