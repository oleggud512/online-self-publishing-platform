import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_type.freezed.dart';
part 'report_type.g.dart';

@freezed
class ReportType with _$ReportType {
  factory ReportType({
    @JsonKey(name: "_id") @Default("") String id,
    @Default("") String name,
    @Default("") String displayName,
    @Default([]) List<String> subjectName,
    @Default("") String description
  }) = _ReportType;

  factory ReportType.fromJson(Map<String, dynamic> json) => _$ReportTypeFromJson(json);
}

reportTypeListFromJson(List<dynamic> list) {
  return list.map((r) => ReportType.fromJson(r as Map<String, dynamic>))
    .toList();
}