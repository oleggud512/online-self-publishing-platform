// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  Profile get author => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get subject => throw _privateConstructorUsedError;
  String get subjectName => throw _privateConstructorUsedError;
  int get depth => throw _privateConstructorUsedError;
  int get rate => throw _privateConstructorUsedError;
  List<Comment> get answers => throw _privateConstructorUsedError;
  bool get hasAnswers => throw _privateConstructorUsedError;
  CommentRate? get myRate => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res, Comment>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      Profile author,
      String content,
      String subject,
      String subjectName,
      int depth,
      int rate,
      List<Comment> answers,
      bool hasAnswers,
      CommentRate? myRate,
      DateTime createdAt,
      DateTime updatedAt});

  $ProfileCopyWith<$Res> get author;
}

/// @nodoc
class _$CommentCopyWithImpl<$Res, $Val extends Comment>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? content = null,
    Object? subject = null,
    Object? subjectName = null,
    Object? depth = null,
    Object? rate = null,
    Object? answers = null,
    Object? hasAnswers = null,
    Object? myRate = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as Profile,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      depth: null == depth
          ? _value.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
      hasAnswers: null == hasAnswers
          ? _value.hasAnswers
          : hasAnswers // ignore: cast_nullable_to_non_nullable
              as bool,
      myRate: freezed == myRate
          ? _value.myRate
          : myRate // ignore: cast_nullable_to_non_nullable
              as CommentRate?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get author {
    return $ProfileCopyWith<$Res>(_value.author, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommentImplCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$CommentImplCopyWith(
          _$CommentImpl value, $Res Function(_$CommentImpl) then) =
      __$$CommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      Profile author,
      String content,
      String subject,
      String subjectName,
      int depth,
      int rate,
      List<Comment> answers,
      bool hasAnswers,
      CommentRate? myRate,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $ProfileCopyWith<$Res> get author;
}

/// @nodoc
class __$$CommentImplCopyWithImpl<$Res>
    extends _$CommentCopyWithImpl<$Res, _$CommentImpl>
    implements _$$CommentImplCopyWith<$Res> {
  __$$CommentImplCopyWithImpl(
      _$CommentImpl _value, $Res Function(_$CommentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? content = null,
    Object? subject = null,
    Object? subjectName = null,
    Object? depth = null,
    Object? rate = null,
    Object? answers = null,
    Object? hasAnswers = null,
    Object? myRate = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$CommentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as Profile,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      depth: null == depth
          ? _value.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
      hasAnswers: null == hasAnswers
          ? _value.hasAnswers
          : hasAnswers // ignore: cast_nullable_to_non_nullable
              as bool,
      myRate: freezed == myRate
          ? _value.myRate
          : myRate // ignore: cast_nullable_to_non_nullable
              as CommentRate?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentImpl implements _Comment {
  _$CommentImpl(
      {@JsonKey(name: "_id") this.id = "",
      required this.author,
      this.content = "",
      this.subject = "",
      this.subjectName = "",
      this.depth = 0,
      this.rate = 0,
      final List<Comment> answers = const [],
      this.hasAnswers = false,
      this.myRate,
      required this.createdAt,
      required this.updatedAt})
      : _answers = answers;

  factory _$CommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  final Profile author;
  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final String subject;
  @override
  @JsonKey()
  final String subjectName;
  @override
  @JsonKey()
  final int depth;
  @override
  @JsonKey()
  final int rate;
  final List<Comment> _answers;
  @override
  @JsonKey()
  List<Comment> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  @JsonKey()
  final bool hasAnswers;
  @override
  final CommentRate? myRate;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Comment(id: $id, author: $author, content: $content, subject: $subject, subjectName: $subjectName, depth: $depth, rate: $rate, answers: $answers, hasAnswers: $hasAnswers, myRate: $myRate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName) &&
            (identical(other.depth, depth) || other.depth == depth) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.hasAnswers, hasAnswers) ||
                other.hasAnswers == hasAnswers) &&
            (identical(other.myRate, myRate) || other.myRate == myRate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      author,
      content,
      subject,
      subjectName,
      depth,
      rate,
      const DeepCollectionEquality().hash(_answers),
      hasAnswers,
      myRate,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      __$$CommentImplCopyWithImpl<_$CommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentImplToJson(
      this,
    );
  }
}

abstract class _Comment implements Comment {
  factory _Comment(
      {@JsonKey(name: "_id") final String id,
      required final Profile author,
      final String content,
      final String subject,
      final String subjectName,
      final int depth,
      final int rate,
      final List<Comment> answers,
      final bool hasAnswers,
      final CommentRate? myRate,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$CommentImpl;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$CommentImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  Profile get author;
  @override
  String get content;
  @override
  String get subject;
  @override
  String get subjectName;
  @override
  int get depth;
  @override
  int get rate;
  @override
  List<Comment> get answers;
  @override
  bool get hasAnswers;
  @override
  CommentRate? get myRate;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
