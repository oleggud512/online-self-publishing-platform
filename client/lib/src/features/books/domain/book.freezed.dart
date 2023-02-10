// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Book _$BookFromJson(Map<String, dynamic> json) {
  return _Book.fromJson(json);
}

/// @nodoc
mixin _$Book {
  @JsonKey(name: "_id")
  String get id =>
      throw _privateConstructorUsedError; //     persistent // just always will be here
  Profile get author =>
      throw _privateConstructorUsedError; // add persistent // required for addiction a new book
  String? get coverUrl => throw _privateConstructorUsedError; //     persistent
  String get name => throw _privateConstructorUsedError; //     persistent
  String? get description =>
      throw _privateConstructorUsedError; //     persistent
  int get likes => throw _privateConstructorUsedError; //     persistent
  @JsonKey(toJson: ignore, includeIfNull: false)
  List<String>? get tags => throw _privateConstructorUsedError; // optional
  @JsonKey(toJson: ignore, includeIfNull: false)
  List<String>? get genres => throw _privateConstructorUsedError; // optional
  @JsonKey(toJson: ignore, includeIfNull: false)
  List<Comment>? get comments => throw _privateConstructorUsedError; // optional
  @JsonKey(toJson: ignore, includeIfNull: false)
  List<Chapter>? get chapters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookCopyWith<Book> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookCopyWith<$Res> {
  factory $BookCopyWith(Book value, $Res Function(Book) then) =
      _$BookCopyWithImpl<$Res, Book>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      Profile author,
      String? coverUrl,
      String name,
      String? description,
      int likes,
      @JsonKey(toJson: ignore, includeIfNull: false) List<String>? tags,
      @JsonKey(toJson: ignore, includeIfNull: false) List<String>? genres,
      @JsonKey(toJson: ignore, includeIfNull: false) List<Comment>? comments,
      @JsonKey(toJson: ignore, includeIfNull: false) List<Chapter>? chapters});

  $ProfileCopyWith<$Res> get author;
}

/// @nodoc
class _$BookCopyWithImpl<$Res, $Val extends Book>
    implements $BookCopyWith<$Res> {
  _$BookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? coverUrl = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? likes = null,
    Object? tags = freezed,
    Object? genres = freezed,
    Object? comments = freezed,
    Object? chapters = freezed,
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
      coverUrl: freezed == coverUrl
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      genres: freezed == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
      chapters: freezed == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<Chapter>?,
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
abstract class _$$_BookCopyWith<$Res> implements $BookCopyWith<$Res> {
  factory _$$_BookCopyWith(_$_Book value, $Res Function(_$_Book) then) =
      __$$_BookCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      Profile author,
      String? coverUrl,
      String name,
      String? description,
      int likes,
      @JsonKey(toJson: ignore, includeIfNull: false) List<String>? tags,
      @JsonKey(toJson: ignore, includeIfNull: false) List<String>? genres,
      @JsonKey(toJson: ignore, includeIfNull: false) List<Comment>? comments,
      @JsonKey(toJson: ignore, includeIfNull: false) List<Chapter>? chapters});

  @override
  $ProfileCopyWith<$Res> get author;
}

/// @nodoc
class __$$_BookCopyWithImpl<$Res> extends _$BookCopyWithImpl<$Res, _$_Book>
    implements _$$_BookCopyWith<$Res> {
  __$$_BookCopyWithImpl(_$_Book _value, $Res Function(_$_Book) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? author = null,
    Object? coverUrl = freezed,
    Object? name = null,
    Object? description = freezed,
    Object? likes = null,
    Object? tags = freezed,
    Object? genres = freezed,
    Object? comments = freezed,
    Object? chapters = freezed,
  }) {
    return _then(_$_Book(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as Profile,
      coverUrl: freezed == coverUrl
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      genres: freezed == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      comments: freezed == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
      chapters: freezed == chapters
          ? _value._chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<Chapter>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Book implements _Book {
  _$_Book(
      {@JsonKey(name: "_id")
          this.id = "",
      required this.author,
      this.coverUrl,
      this.name = "",
      this.description,
      this.likes = 0,
      @JsonKey(toJson: ignore, includeIfNull: false)
          final List<String>? tags,
      @JsonKey(toJson: ignore, includeIfNull: false)
          final List<String>? genres,
      @JsonKey(toJson: ignore, includeIfNull: false)
          final List<Comment>? comments,
      @JsonKey(toJson: ignore, includeIfNull: false)
          final List<Chapter>? chapters})
      : _tags = tags,
        _genres = genres,
        _comments = comments,
        _chapters = chapters;

  factory _$_Book.fromJson(Map<String, dynamic> json) => _$$_BookFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
//     persistent // just always will be here
  @override
  final Profile author;
// add persistent // required for addiction a new book
  @override
  final String? coverUrl;
//     persistent
  @override
  @JsonKey()
  final String name;
//     persistent
  @override
  final String? description;
//     persistent
  @override
  @JsonKey()
  final int likes;
//     persistent
  final List<String>? _tags;
//     persistent
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// optional
  final List<String>? _genres;
// optional
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  List<String>? get genres {
    final value = _genres;
    if (value == null) return null;
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// optional
  final List<Comment>? _comments;
// optional
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  List<Comment>? get comments {
    final value = _comments;
    if (value == null) return null;
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// optional
  final List<Chapter>? _chapters;
// optional
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  List<Chapter>? get chapters {
    final value = _chapters;
    if (value == null) return null;
    if (_chapters is EqualUnmodifiableListView) return _chapters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Book(id: $id, author: $author, coverUrl: $coverUrl, name: $name, description: $description, likes: $likes, tags: $tags, genres: $genres, comments: $comments, chapters: $chapters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Book &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.coverUrl, coverUrl) ||
                other.coverUrl == coverUrl) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            const DeepCollectionEquality().equals(other._chapters, _chapters));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      author,
      coverUrl,
      name,
      description,
      likes,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_genres),
      const DeepCollectionEquality().hash(_comments),
      const DeepCollectionEquality().hash(_chapters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookCopyWith<_$_Book> get copyWith =>
      __$$_BookCopyWithImpl<_$_Book>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookToJson(
      this,
    );
  }
}

abstract class _Book implements Book {
  factory _Book(
      {@JsonKey(name: "_id")
          final String id,
      required final Profile author,
      final String? coverUrl,
      final String name,
      final String? description,
      final int likes,
      @JsonKey(toJson: ignore, includeIfNull: false)
          final List<String>? tags,
      @JsonKey(toJson: ignore, includeIfNull: false)
          final List<String>? genres,
      @JsonKey(toJson: ignore, includeIfNull: false)
          final List<Comment>? comments,
      @JsonKey(toJson: ignore, includeIfNull: false)
          final List<Chapter>? chapters}) = _$_Book;

  factory _Book.fromJson(Map<String, dynamic> json) = _$_Book.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override //     persistent // just always will be here
  Profile get author;
  @override // add persistent // required for addiction a new book
  String? get coverUrl;
  @override //     persistent
  String get name;
  @override //     persistent
  String? get description;
  @override //     persistent
  int get likes;
  @override //     persistent
  @JsonKey(toJson: ignore, includeIfNull: false)
  List<String>? get tags;
  @override // optional
  @JsonKey(toJson: ignore, includeIfNull: false)
  List<String>? get genres;
  @override // optional
  @JsonKey(toJson: ignore, includeIfNull: false)
  List<Comment>? get comments;
  @override // optional
  @JsonKey(toJson: ignore, includeIfNull: false)
  List<Chapter>? get chapters;
  @override
  @JsonKey(ignore: true)
  _$$_BookCopyWith<_$_Book> get copyWith => throw _privateConstructorUsedError;
}
