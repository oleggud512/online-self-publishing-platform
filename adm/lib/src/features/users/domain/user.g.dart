// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FireUser _$$_FireUserFromJson(Map<String, dynamic> json) => _$_FireUser(
      displayName: json['displayName'] as String?,
      email: json['email'] as String?,
      uid: json['uid'] as String,
      role: $enumDecode(_$RoleEnumMap, json['role']),
    );

Map<String, dynamic> _$$_FireUserToJson(_$_FireUser instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'email': instance.email,
      'uid': instance.uid,
      'role': _$RoleEnumMap[instance.role]!,
    };

const _$RoleEnumMap = {
  Role.admin: 'admin',
  Role.superAdmin: 'super-admin',
  Role.user: 'user',
};
