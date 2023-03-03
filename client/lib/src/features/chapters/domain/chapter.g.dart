// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Chapter _$$_ChapterFromJson(Map<String, dynamic> json) => _$_Chapter(
      id: json['_id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      content: json['content'] as String? ?? "",
      state: $enumDecodeNullable(_$ReadingsStateEnumMap, json['state']) ??
          ReadingsState.unpublished,
      bookId: json['book'] as String,
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_ChapterToJson(_$_Chapter instance) {
  final val = <String, dynamic>{
    '_id': instance.id,
    'name': instance.name,
    'content': instance.content,
    'state': _$ReadingsStateEnumMap[instance.state]!,
    'book': instance.bookId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('comments', ignore(instance.comments));
  val['createdAt'] = instance.createdAt?.toIso8601String();
  val['updatedAt'] = instance.updatedAt?.toIso8601String();
  return val;
}

const _$ReadingsStateEnumMap = {
  ReadingsState.published: 'published',
  ReadingsState.unpublished: 'unpublished',
};
