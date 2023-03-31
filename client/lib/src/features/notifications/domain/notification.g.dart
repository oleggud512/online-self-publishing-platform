// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewChapterNotification _$$NewChapterNotificationFromJson(
        Map<String, dynamic> json) =>
    _$NewChapterNotification(
      notificationType: json['notificationType'] as String,
      localId: json['localId'] as String? ?? "",
      messageId: json['messageId'] as String? ?? "",
      sentTime: DateTime.fromMillisecondsSinceEpoch(json['sentTime'] as int),
      book: json['book'] as String?,
      bookId: json['bookId'] as String?,
      chapter: json['chapter'] as String?,
      chapterId: json['chapterId'] as String?,
    );

Map<String, dynamic> _$$NewChapterNotificationToJson(
        _$NewChapterNotification instance) =>
    <String, dynamic>{
      'notificationType': instance.notificationType,
      'localId': instance.localId,
      'messageId': instance.messageId,
      'sentTime': intDateToJson(instance.sentTime),
      'book': instance.book,
      'bookId': instance.bookId,
      'chapter': instance.chapter,
      'chapterId': instance.chapterId,
    };

_$BookUnpublishedNotification _$$BookUnpublishedNotificationFromJson(
        Map<String, dynamic> json) =>
    _$BookUnpublishedNotification(
      notificationType: json['notificationType'] as String,
      localId: json['localId'] as String? ?? "",
      messageId: json['messageId'] as String? ?? "",
      sentTime: DateTime.fromMillisecondsSinceEpoch(json['sentTime'] as int),
      book: json['book'] as String?,
      bookId: json['bookId'] as String?,
    );

Map<String, dynamic> _$$BookUnpublishedNotificationToJson(
        _$BookUnpublishedNotification instance) =>
    <String, dynamic>{
      'notificationType': instance.notificationType,
      'localId': instance.localId,
      'messageId': instance.messageId,
      'sentTime': intDateToJson(instance.sentTime),
      'book': instance.book,
      'bookId': instance.bookId,
    };

_$ReportRejectedNotification _$$ReportRejectedNotificationFromJson(
        Map<String, dynamic> json) =>
    _$ReportRejectedNotification(
      notificationType: json['notificationType'] as String,
      localId: json['localId'] as String? ?? "",
      messageId: json['messageId'] as String? ?? "",
      sentTime: DateTime.fromMillisecondsSinceEpoch(json['sentTime'] as int),
      subject: json['subject'] as String,
      subjectName: json['subjectName'] as String,
      subjectId: json['subjectId'] as String,
    );

Map<String, dynamic> _$$ReportRejectedNotificationToJson(
        _$ReportRejectedNotification instance) =>
    <String, dynamic>{
      'notificationType': instance.notificationType,
      'localId': instance.localId,
      'messageId': instance.messageId,
      'sentTime': intDateToJson(instance.sentTime),
      'subject': instance.subject,
      'subjectName': instance.subjectName,
      'subjectId': instance.subjectId,
    };

_$SubscribedNotification _$$SubscribedNotificationFromJson(
        Map<String, dynamic> json) =>
    _$SubscribedNotification(
      notificationType: json['notificationType'] as String,
      localId: json['localId'] as String? ?? "",
      messageId: json['messageId'] as String? ?? "",
      sentTime: DateTime.fromMillisecondsSinceEpoch(json['sentTime'] as int),
      profile: json['profile'] as String,
      profileId: json['profileId'] as String,
    );

Map<String, dynamic> _$$SubscribedNotificationToJson(
        _$SubscribedNotification instance) =>
    <String, dynamic>{
      'notificationType': instance.notificationType,
      'localId': instance.localId,
      'messageId': instance.messageId,
      'sentTime': intDateToJson(instance.sentTime),
      'profile': instance.profile,
      'profileId': instance.profileId,
    };

_$CommentAnswerNotification _$$CommentAnswerNotificationFromJson(
        Map<String, dynamic> json) =>
    _$CommentAnswerNotification(
      notificationType: json['notificationType'] as String,
      localId: json['localId'] as String? ?? "",
      messageId: json['messageId'] as String? ?? "",
      sentTime: DateTime.fromMillisecondsSinceEpoch(json['sentTime'] as int),
      subject: json['subject'] as String? ?? "",
      subjectName: json['subjectName'] as String? ?? "",
      depth: json['depth'] as int? ?? 0,
    );

Map<String, dynamic> _$$CommentAnswerNotificationToJson(
        _$CommentAnswerNotification instance) =>
    <String, dynamic>{
      'notificationType': instance.notificationType,
      'localId': instance.localId,
      'messageId': instance.messageId,
      'sentTime': intDateToJson(instance.sentTime),
      'subject': instance.subject,
      'subjectName': instance.subjectName,
      'depth': instance.depth,
    };
