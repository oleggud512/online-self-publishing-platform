// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_book_screen_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EditBookScreenStateImpl _$$EditBookScreenStateImplFromJson(
        Map<String, dynamic> json) =>
    _$EditBookScreenStateImpl(
      book: Book.fromJson(json['book'] as Map<String, dynamic>),
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$$EditBookScreenStateImplToJson(
        _$EditBookScreenStateImpl instance) =>
    <String, dynamic>{
      'book': instance.book,
      'genres': instance.genres,
      'tags': instance.tags,
    };
