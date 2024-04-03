// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportTypeImpl _$$ReportTypeImplFromJson(Map<String, dynamic> json) =>
    _$ReportTypeImpl(
      id: json['_id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      displayName: json['displayName'] as String? ?? "",
      subjectName: (json['subjectName'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      description: json['description'] as String? ?? "",
    );

Map<String, dynamic> _$$ReportTypeImplToJson(_$ReportTypeImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'displayName': instance.displayName,
      'subjectName': instance.subjectName,
      'description': instance.description,
    };
