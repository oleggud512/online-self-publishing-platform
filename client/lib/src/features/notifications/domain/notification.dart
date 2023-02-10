import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';


enum NotificationType {
  newMessage,
  bookUpdate,
  adminAction
}

enum SubjectType {
  profile,
  book
}

@freezed
class Notification with _$Notification {
  factory Notification({
    @JsonKey(name: "_id") @Default("") String id,
    @Default("") String content,
    required NotificationType type,
    required SubjectType subjectType,
    required String subjectUrl // books/:bid or profiles/:pid
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);
}