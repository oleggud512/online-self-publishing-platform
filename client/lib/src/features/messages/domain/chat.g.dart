// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatImpl _$$ChatImplFromJson(Map<String, dynamic> json) => _$ChatImpl(
      source: $enumDecodeNullable(_$ChatSourceEnumMap, json['source']) ??
          ChatSource.user,
      other: Profile.fromJson(json['other'] as Map<String, dynamic>),
      lastMessage: json['lastMessage'] as String? ?? "",
    );

const _$ChatSourceEnumMap = {
  ChatSource.admin: 'admin',
  ChatSource.user: 'user',
};
