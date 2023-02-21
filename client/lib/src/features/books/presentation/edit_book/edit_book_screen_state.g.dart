// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_book_screen_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EditBookScreenState _$$_EditBookScreenStateFromJson(
        Map<String, dynamic> json) =>
    _$_EditBookScreenState(
      book: Book.fromJson(json['book'] as Map<String, dynamic>),
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$$_EditBookScreenStateToJson(
        _$_EditBookScreenState instance) =>
    <String, dynamic>{
      'book': instance.book,
      'genres': instance.genres,
      'tags': instance.tags,
    };
