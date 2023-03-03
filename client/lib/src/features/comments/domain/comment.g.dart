// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      id: json['_id'] as String? ?? "",
      author: Profile.fromJson(json['author'] as Map<String, dynamic>),
      content: json['content'] as String? ?? "",
      subject: json['subject'] as String? ?? "",
      depth: json['depth'] as int? ?? 0,
      rate: json['rate'] as int? ?? 0,
      answers: (json['answers'] as List<dynamic>?)
              ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      hasAnswers: json['hasAnswers'] as bool? ?? false,
      myRate: $enumDecodeNullable(_$CommentRateEnumMap, json['myRate']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'author': instance.author,
      'content': instance.content,
      'subject': instance.subject,
      'depth': instance.depth,
      'rate': instance.rate,
      'answers': instance.answers,
      'hasAnswers': instance.hasAnswers,
      'myRate': _$CommentRateEnumMap[instance.myRate],
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$CommentRateEnumMap = {
  CommentRate.like: 1,
  CommentRate.dislike: -1,
};
