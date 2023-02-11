// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Profile _$$_ProfileFromJson(Map<String, dynamic> json) => _$_Profile(
      id: json['_id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      avatarUrl: json['avatarUrl'] as String?,
      displayName: json['displayName'] as String?,
      description: json['description'] as String?,
      age: json['age'] as int?,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      email: json['email'] as String? ?? "",
      subscribers: json['subscribers'] as int?,
      subscriptions: json['subscriptions'] as int?,
      booksCount: json['booksCount'] as int?,
      books: (json['books'] as List<dynamic>?)
          ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSubscribed: json['isSubscribed'] as bool?,
    );

Map<String, dynamic> _$$_ProfileToJson(_$_Profile instance) {
  final val = <String, dynamic>{
    '_id': instance.id,
    'name': instance.name,
    'avatarUrl': instance.avatarUrl,
    'displayName': instance.displayName,
    'description': instance.description,
    'age': instance.age,
    'gender': _$GenderEnumMap[instance.gender],
    'email': instance.email,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('subscribers', ignore(instance.subscribers));
  writeNotNull('subscriptions', ignore(instance.subscriptions));
  writeNotNull('booksCount', ignore(instance.booksCount));
  writeNotNull('books', ignore(instance.books));
  writeNotNull('isSubscribed', ignore(instance.isSubscribed));
  return val;
}

const _$GenderEnumMap = {
  Gender.m: 'm',
  Gender.f: 'f',
  Gender.other: 'other',
  Gender.preferNotToSay: 'preferNotToSay',
};
