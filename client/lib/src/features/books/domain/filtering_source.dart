import 'package:freezed_annotation/freezed_annotation.dart';

part 'filtering_source.freezed.dart';
part 'filtering_source.g.dart';

@freezed
class FilteringSource with _$FilteringSource {
  factory FilteringSource({
    required List<String> tags,
    required List<String> genres,
  }) = _FilteringSource;

  factory FilteringSource.fromJson(Map<String, dynamic> json) => 
      _$FilteringSourceFromJson(json);
}