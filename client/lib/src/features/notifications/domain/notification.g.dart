// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Notification _$$_NotificationFromJson(Map<String, dynamic> json) =>
    _$_Notification(
      id: json['_id'] as String? ?? "",
      content: json['content'] as String? ?? "",
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      subjectType: $enumDecode(_$SubjectTypeEnumMap, json['subjectType']),
      subjectUrl: json['subjectUrl'] as String,
    );

Map<String, dynamic> _$$_NotificationToJson(_$_Notification instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'content': instance.content,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'subjectType': _$SubjectTypeEnumMap[instance.subjectType]!,
      'subjectUrl': instance.subjectUrl,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.newMessage: 'newMessage',
  NotificationType.bookUpdate: 'bookUpdate',
  NotificationType.adminAction: 'adminAction',
};

const _$SubjectTypeEnumMap = {
  SubjectType.profile: 'profile',
  SubjectType.book: 'book',
};
