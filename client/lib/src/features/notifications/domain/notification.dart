import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

class NotificationType {
  static const String newChapter = 'newChapter';
  static const String bookUnpublished = 'bookUnpublished';
  static const String none = 'none';
  static const String reportRejected = 'reportRejected';
  static const String subscribed = 'subscribed';
  static const String commentAnswer = 'commentAnswer';
  // newMessage,
  // bookUpdate,
  // adminAction
}

enum SubjectType {
  profile,
  book
}

@Freezed(unionKey: 'notificationType', unionValueCase: FreezedUnionCase.none)
class MyNotification with _$MyNotification {

  @FreezedUnionValue(NotificationType.newChapter)
  factory MyNotification.newChapter({
    required String notificationType,
    @Default("") String localId,
    @Default("") String messageId,
    @intDate required DateTime sentTime,
    String? book,
    String? bookId,
    String? chapter,
    String? chapterId,
  }) = NewChapterNotification;

  @FreezedUnionValue(NotificationType.bookUnpublished)
  factory MyNotification.bookUnpublished({
    required String notificationType,
    @Default("") String localId,
    @Default("") String messageId,
    @intDate required DateTime sentTime,
    String? book,
    String? bookId
  }) = BookUnpublishedNotification; 

  @FreezedUnionValue(NotificationType.reportRejected)
  factory MyNotification.reportRejected({
    required String notificationType,
    @Default("") String localId,
    @Default("") String messageId,
    @intDate required DateTime sentTime,
    required String subject,
    required String subjectName,
    required String subjectId
  }) = ReportRejectedNotification;

  @FreezedUnionValue(NotificationType.subscribed)
  factory MyNotification.subscribed({
    required String notificationType,
    @Default("") String localId,
    @Default("") String messageId,
    @intDate required DateTime sentTime,
    required String profile,
    required String profileId
  }) = SubscribedNotification;

  @FreezedUnionValue(NotificationType.commentAnswer)
  factory MyNotification.commentAnswer({
    required String notificationType,
    @Default("") String localId,
    @Default("") String messageId,
    @intDate required DateTime sentTime,
    @Default("") String subject,
    @Default("") String subjectName,
    @Default(0) int depth,
  }) = CommentAnswerNotification;

  factory MyNotification.fromJson(Map<String, dynamic> json) => _$MyNotificationFromJson(json);
}

const intDate = JsonKey(fromJson: DateTime.fromMillisecondsSinceEpoch, toJson: intDateToJson);

intDateToJson(DateTime date) {
  return date.millisecondsSinceEpoch;
}