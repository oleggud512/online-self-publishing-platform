// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewChapterNotificationImpl _$$NewChapterNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$NewChapterNotificationImpl(
      notificationType: json['notificationType'] as String,
      localId: json['localId'] as String? ?? "",
      messageId: json['messageId'] as String? ?? "",
      sentTime: DateTime.fromMillisecondsSinceEpoch(
          (json['sentTime'] as num).toInt()),
      book: json['book'] as String?,
      bookId: json['bookId'] as String?,
      chapter: json['chapter'] as String?,
      chapterId: json['chapterId'] as String?,
    );

Map<String, dynamic> _$$NewChapterNotificationImplToJson(
        _$NewChapterNotificationImpl instance) =>
    <String, dynamic>{
      'notificationType': instance.notificationType,
      'localId': instance.localId,
      'messageId': instance.messageId,
      'sentTime': _intDateToJson(instance.sentTime),
      'book': instance.book,
      'bookId': instance.bookId,
      'chapter': instance.chapter,
      'chapterId': instance.chapterId,
    };

_$BookUnpublishedNotificationImpl _$$BookUnpublishedNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$BookUnpublishedNotificationImpl(
      notificationType: json['notificationType'] as String,
      localId: json['localId'] as String? ?? "",
      messageId: json['messageId'] as String? ?? "",
      sentTime: DateTime.fromMillisecondsSinceEpoch(
          (json['sentTime'] as num).toInt()),
      book: json['book'] as String?,
      bookId: json['bookId'] as String?,
    );

Map<String, dynamic> _$$BookUnpublishedNotificationImplToJson(
        _$BookUnpublishedNotificationImpl instance) =>
    <String, dynamic>{
      'notificationType': instance.notificationType,
      'localId': instance.localId,
      'messageId': instance.messageId,
      'sentTime': _intDateToJson(instance.sentTime),
      'book': instance.book,
      'bookId': instance.bookId,
    };

_$ReportRejectedNotificationImpl _$$ReportRejectedNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$ReportRejectedNotificationImpl(
      notificationType: json['notificationType'] as String,
      localId: json['localId'] as String? ?? "",
      messageId: json['messageId'] as String? ?? "",
      sentTime: DateTime.fromMillisecondsSinceEpoch(
          (json['sentTime'] as num).toInt()),
      subject: json['subject'] as String,
      subjectName: json['subjectName'] as String,
      subjectId: json['subjectId'] as String,
    );

Map<String, dynamic> _$$ReportRejectedNotificationImplToJson(
        _$ReportRejectedNotificationImpl instance) =>
    <String, dynamic>{
      'notificationType': instance.notificationType,
      'localId': instance.localId,
      'messageId': instance.messageId,
      'sentTime': _intDateToJson(instance.sentTime),
      'subject': instance.subject,
      'subjectName': instance.subjectName,
      'subjectId': instance.subjectId,
    };

_$SubscribedNotificationImpl _$$SubscribedNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$SubscribedNotificationImpl(
      notificationType: json['notificationType'] as String,
      localId: json['localId'] as String? ?? "",
      messageId: json['messageId'] as String? ?? "",
      sentTime: DateTime.fromMillisecondsSinceEpoch(
          (json['sentTime'] as num).toInt()),
      profile: json['profile'] as String,
      profileId: json['profileId'] as String,
    );

Map<String, dynamic> _$$SubscribedNotificationImplToJson(
        _$SubscribedNotificationImpl instance) =>
    <String, dynamic>{
      'notificationType': instance.notificationType,
      'localId': instance.localId,
      'messageId': instance.messageId,
      'sentTime': _intDateToJson(instance.sentTime),
      'profile': instance.profile,
      'profileId': instance.profileId,
    };

_$CommentAnswerNotificationImpl _$$CommentAnswerNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$CommentAnswerNotificationImpl(
      notificationType: json['notificationType'] as String,
      localId: json['localId'] as String? ?? "",
      messageId: json['messageId'] as String? ?? "",
      sentTime: DateTime.fromMillisecondsSinceEpoch(
          (json['sentTime'] as num).toInt()),
      subject: json['subject'] as String? ?? "",
      subjectName: json['subjectName'] as String? ?? "",
      depth:
          json['depth'] == null ? 0 : _depthFromJson(json['depth'] as String),
    );

Map<String, dynamic> _$$CommentAnswerNotificationImplToJson(
        _$CommentAnswerNotificationImpl instance) =>
    <String, dynamic>{
      'notificationType': instance.notificationType,
      'localId': instance.localId,
      'messageId': instance.messageId,
      'sentTime': _intDateToJson(instance.sentTime),
      'subject': instance.subject,
      'subjectName': instance.subjectName,
      'depth': instance.depth,
    };
