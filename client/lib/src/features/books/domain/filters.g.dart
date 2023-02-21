// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Filters _$$_FiltersFromJson(Map<String, dynamic> json) => _$_Filters(
      ofProfile: json['ofProfile'] as String?,
      forProfile: json['forProfile'] as String?,
      query: json['query'] as String?,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      statuses: (json['statuses'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$BookStatusEnumMap, e))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_FiltersToJson(_$_Filters instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ofProfile', instance.ofProfile);
  writeNotNull('forProfile', instance.forProfile);
  writeNotNull('query', instance.query);
  val['tags'] = instance.tags;
  val['genres'] = instance.genres;
  val['statuses'] =
      instance.statuses.map((e) => _$BookStatusEnumMap[e]!).toList();
  return val;
}

const _$BookStatusEnumMap = {
  BookStatus.completed: 'completed',
  BookStatus.inProgress: 'inProgress',
  BookStatus.abandoned: 'abandoned',
};
