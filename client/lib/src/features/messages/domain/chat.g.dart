// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Chat _$$_ChatFromJson(Map<String, dynamic> json) => _$_Chat(
      source: $enumDecodeNullable(_$ChatSourceEnumMap, json['source']) ??
          ChatSource.user,
      other: Profile.fromJson(json['other'] as Map<String, dynamic>),
      lastMessage: json['lastMessage'] as String? ?? "",
    );

const _$ChatSourceEnumMap = {
  ChatSource.admin: 'admin',
  ChatSource.user: 'user',
};
