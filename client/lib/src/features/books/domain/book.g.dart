// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Book _$$_BookFromJson(Map<String, dynamic> json) => _$_Book(
      id: json['_id'] as String? ?? "",
      author: Profile.fromJson(json['author'] as Map<String, dynamic>),
      coverUrl: json['coverUrl'] as String?,
      name: json['name'] as String? ?? "",
      description: json['description'] as String?,
      likes: json['likes'] as int? ?? 0,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      chapters: (json['chapters'] as List<dynamic>?)
          ?.map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_BookToJson(_$_Book instance) {
  final val = <String, dynamic>{
    '_id': instance.id,
    'author': instance.author,
    'coverUrl': instance.coverUrl,
    'name': instance.name,
    'description': instance.description,
    'likes': instance.likes,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('tags', ignore(instance.tags));
  writeNotNull('genres', ignore(instance.genres));
  writeNotNull('comments', ignore(instance.comments));
  writeNotNull('chapters', ignore(instance.chapters));
  return val;
}
