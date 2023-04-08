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
  @JsonKey(toJson: _authorToJson, fromJson: _authorFromJson)
  Profile get author =>
      throw _privateConstructorUsedError; // add persistent // required for addiction a new book
  String? get coverUrl => throw _privateConstructorUsedError; //     persistent
  String get name => throw _privateConstructorUsedError; //     persistent
  String? get description =>
      throw _privateConstructorUsedError; //     persistent
  int get likes => throw _privateConstructorUsedError; //     persistent
  int get views => throw _privateConstructorUsedError;
  BookStatus get status => throw _privateConstructorUsedError;
  ReadingsState get state => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError; // optional
  List<String> get genres => throw _privateConstructorUsedError; // optional
  @JsonKey(toJson: ignore, includeIfNull: false)
  List<Comment>? get comments => throw _privateConstructorUsedError; // optional
  @JsonKey(toJson: ignore, includeIfNull: false)
  List<Chapter>? get chapters => throw _privateConstructorUsedError; // optional
  bool get liked => throw _privateConstructorUsedError; // optional
  bool? get bookmarked => throw _privateConstructorUsedError;

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
      @JsonKey(toJson: _authorToJson, fromJson: _authorFromJson) Profile author,
      String? coverUrl,
      String name,
      String? description,
      int likes,
      int views,
      BookStatus status,
      ReadingsState state,
      List<String> tags,
      List<String> genres,
      @JsonKey(toJson: ignore, includeIfNull: false) List<Comment>? comments,
      @JsonKey(toJson: ignore, includeIfNull: false) List<Chapter>? chapters,
      bool liked,
      bool? bookmarked});

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
    Object? views = null,
    Object? status = null,
    Object? state = null,
    Object? tags = null,
    Object? genres = null,
    Object? comments = freezed,
    Object? chapters = freezed,
    Object? liked = null,
    Object? bookmarked = freezed,
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
      views: null == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BookStatus,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ReadingsState,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
      chapters: freezed == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<Chapter>?,
      liked: null == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
      bookmarked: freezed == bookmarked
          ? _value.bookmarked
          : bookmarked // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      @JsonKey(toJson: _authorToJson, fromJson: _authorFromJson) Profile author,
      String? coverUrl,
      String name,
      String? description,
      int likes,
      int views,
      BookStatus status,
      ReadingsState state,
      List<String> tags,
      List<String> genres,
      @JsonKey(toJson: ignore, includeIfNull: false) List<Comment>? comments,
      @JsonKey(toJson: ignore, includeIfNull: false) List<Chapter>? chapters,
      bool liked,
      bool? bookmarked});

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
    Object? views = null,
    Object? status = null,
    Object? state = null,
    Object? tags = null,
    Object? genres = null,
    Object? comments = freezed,
    Object? chapters = freezed,
    Object? liked = null,
    Object? bookmarked = freezed,
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
      views: null == views
          ? _value.views
          : views // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BookStatus,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ReadingsState,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      comments: freezed == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
      chapters: freezed == chapters
          ? _value._chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<Chapter>?,
      liked: null == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
      bookmarked: freezed == bookmarked
          ? _value.bookmarked
          : bookmarked // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Book implements _Book {
  _$_Book(
      {@JsonKey(name: "_id")
          this.id = "",
      @JsonKey(toJson: _authorToJson, fromJson: _authorFromJson)
          required this.author,
      this.coverUrl,
      this.name = "",
      this.description,
      this.likes = 0,
      this.views = 0,
      this.status = BookStatus.inProgress,
      this.state = ReadingsState.unpublished,
      final List<String> tags = const [],
      final List<String> genres = const [],
      @JsonKey(toJson: ignore, includeIfNull: false)
          final List<Comment>? comments,
      @JsonKey(toJson: ignore, includeIfNull: false)
          final List<Chapter>? chapters,
      this.liked = false,
      this.bookmarked})
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
  @JsonKey(toJson: _authorToJson, fromJson: _authorFromJson)
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
  @override
  @JsonKey()
  final int views;
  @override
  @JsonKey()
  final BookStatus status;
  @override
  @JsonKey()
  final ReadingsState state;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

// optional
  final List<String> _genres;
// optional
  @override
  @JsonKey()
  List<String> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
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

// optional
  @override
  @JsonKey()
  final bool liked;
// optional
  @override
  final bool? bookmarked;

  @override
  String toString() {
    return 'Book(id: $id, author: $author, coverUrl: $coverUrl, name: $name, description: $description, likes: $likes, views: $views, status: $status, state: $state, tags: $tags, genres: $genres, comments: $comments, chapters: $chapters, liked: $liked, bookmarked: $bookmarked)';
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
            (identical(other.views, views) || other.views == views) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.state, state) || other.state == state) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            const DeepCollectionEquality().equals(other._chapters, _chapters) &&
            (identical(other.liked, liked) || other.liked == liked) &&
            (identical(other.bookmarked, bookmarked) ||
                other.bookmarked == bookmarked));
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
      views,
      status,
      state,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_genres),
      const DeepCollectionEquality().hash(_comments),
      const DeepCollectionEquality().hash(_chapters),
      liked,
      bookmarked);

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
      @JsonKey(toJson: _authorToJson, fromJson: _authorFromJson)
          required final Profile author,
      final String? coverUrl,
      final String name,
      final String? description,
      final int likes,
      final int views,
      final BookStatus status,
      final ReadingsState state,
      final List<String> tags,
      final List<String> genres,
      @JsonKey(toJson: ignore, includeIfNull: false)
          final List<Comment>? comments,
      @JsonKey(toJson: ignore, includeIfNull: false)
          final List<Chapter>? chapters,
      final bool liked,
      final bool? bookmarked}) = _$_Book;

  factory _Book.fromJson(Map<String, dynamic> json) = _$_Book.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override //     persistent // just always will be here
  @JsonKey(toJson: _authorToJson, fromJson: _authorFromJson)
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
  int get views;
  @override
  BookStatus get status;
  @override
  ReadingsState get state;
  @override
  List<String> get tags;
  @override // optional
  List<String> get genres;
  @override // optional
  @JsonKey(toJson: ignore, includeIfNull: false)
  List<Comment>? get comments;
  @override // optional
  @JsonKey(toJson: ignore, includeIfNull: false)
  List<Chapter>? get chapters;
  @override // optional
  bool get liked;
  @override // optional
  bool? get bookmarked;
  @override
  @JsonKey(ignore: true)
  _$$_BookCopyWith<_$_Book> get copyWith => throw _privateConstructorUsedError;
}
