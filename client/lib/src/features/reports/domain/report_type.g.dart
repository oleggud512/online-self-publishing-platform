// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportType _$$_ReportTypeFromJson(Map<String, dynamic> json) =>
    _$_ReportType(
      id: json['_id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      displayName: json['displayName'] as String? ?? "",
      subjectName: (json['subjectName'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      description: json['description'] as String? ?? "",
    );

Map<String, dynamic> _$$_ReportTypeToJson(_$_ReportType instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'displayName': instance.displayName,
      'subjectName': instance.subjectName,
      'description': instance.description,
    };
