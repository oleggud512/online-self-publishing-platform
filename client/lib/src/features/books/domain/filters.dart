import 'package:freezed_annotation/freezed_annotation.dart';

import 'book.dart';

part 'filters.freezed.dart';
part 'filters.g.dart';

@freezed
class Filters with _$Filters {
  factory Filters({
    @JsonKey(includeIfNull: false) String? ofProfile,
    @JsonKey(includeIfNull: false) String? forProfile,
    @JsonKey(includeIfNull: false) String? query,
    @Default([]) List<String> tags,
    @Default([]) List<String> genres,
    @Default([]) List<BookStatus> statuses
  }) = _Filters;

  factory Filters.fromJson(Map<String, dynamic> json) => _$FiltersFromJson(json);
}