// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtering_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FilteringSourceImpl _$$FilteringSourceImplFromJson(
        Map<String, dynamic> json) =>
    _$FilteringSourceImpl(
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$FilteringSourceImplToJson(
        _$FilteringSourceImpl instance) =>
    <String, dynamic>{
      'tags': instance.tags,
      'genres': instance.genres,
    };
