// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Book _$$_BookFromJson(Map<String, dynamic> json) => _$_Book(
      id: json['_id'] as String? ?? "",
      author: _authorFromJson(json['author'] as Map<String, dynamic>),
      coverUrl: json['coverUrl'] as String?,
      name: json['name'] as String? ?? "",
      description: json['description'] as String?,
      likes: json['likes'] as int? ?? 0,
      status: $enumDecodeNullable(_$BookStatusEnumMap, json['status']) ??
          BookStatus.inProgress,
      state: $enumDecodeNullable(_$ReadingsStateEnumMap, json['state']) ??
          ReadingsState.unpublished,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      chapters: (json['chapters'] as List<dynamic>?)
          ?.map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList(),
      liked: json['liked'] as bool? ?? false,
      bookmarked: json['bookmarked'] as bool?,
    );

Map<String, dynamic> _$$_BookToJson(_$_Book instance) {
  final val = <String, dynamic>{
    '_id': instance.id,
    'author': _authorToJson(instance.author),
    'coverUrl': instance.coverUrl,
    'name': instance.name,
    'description': instance.description,
    'likes': instance.likes,
    'status': _$BookStatusEnumMap[instance.status]!,
    'state': _$ReadingsStateEnumMap[instance.state]!,
    'tags': instance.tags,
    'genres': instance.genres,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('comments', ignore(instance.comments));
  writeNotNull('chapters', ignore(instance.chapters));
  val['liked'] = instance.liked;
  val['bookmarked'] = instance.bookmarked;
  return val;
}

const _$BookStatusEnumMap = {
  BookStatus.completed: 'completed',
  BookStatus.inProgress: 'inProgress',
  BookStatus.abandoned: 'abandoned',
};

const _$ReadingsStateEnumMap = {
  ReadingsState.published: 'published',
  ReadingsState.unpublished: 'unpublished',
};
