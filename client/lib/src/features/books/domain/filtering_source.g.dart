// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtering_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FilteringSource _$$_FilteringSourceFromJson(Map<String, dynamic> json) =>
    _$_FilteringSource(
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_FilteringSourceToJson(_$_FilteringSource instance) =>
    <String, dynamic>{
      'tags': instance.tags,
      'genres': instance.genres,
    };
