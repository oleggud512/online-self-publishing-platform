// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_book_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EditBookScreenState _$EditBookScreenStateFromJson(Map<String, dynamic> json) {
  return _EditBookScreenState.fromJson(json);
}

/// @nodoc
mixin _$EditBookScreenState {
  Book get book => throw _privateConstructorUsedError;
  List<String> get genres => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EditBookScreenStateCopyWith<EditBookScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditBookScreenStateCopyWith<$Res> {
  factory $EditBookScreenStateCopyWith(
          EditBookScreenState value, $Res Function(EditBookScreenState) then) =
      _$EditBookScreenStateCopyWithImpl<$Res, EditBookScreenState>;
  @useResult
  $Res call({Book book, List<String> genres, List<String> tags});

  $BookCopyWith<$Res> get book;
}

/// @nodoc
class _$EditBookScreenStateCopyWithImpl<$Res, $Val extends EditBookScreenState>
    implements $EditBookScreenStateCopyWith<$Res> {
  _$EditBookScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book = null,
    Object? genres = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BookCopyWith<$Res> get book {
    return $BookCopyWith<$Res>(_value.book, (value) {
      return _then(_value.copyWith(book: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EditBookScreenStateImplCopyWith<$Res>
    implements $EditBookScreenStateCopyWith<$Res> {
  factory _$$EditBookScreenStateImplCopyWith(_$EditBookScreenStateImpl value,
          $Res Function(_$EditBookScreenStateImpl) then) =
      __$$EditBookScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Book book, List<String> genres, List<String> tags});

  @override
  $BookCopyWith<$Res> get book;
}

/// @nodoc
class __$$EditBookScreenStateImplCopyWithImpl<$Res>
    extends _$EditBookScreenStateCopyWithImpl<$Res, _$EditBookScreenStateImpl>
    implements _$$EditBookScreenStateImplCopyWith<$Res> {
  __$$EditBookScreenStateImplCopyWithImpl(_$EditBookScreenStateImpl _value,
      $Res Function(_$EditBookScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book = null,
    Object? genres = null,
    Object? tags = null,
  }) {
    return _then(_$EditBookScreenStateImpl(
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EditBookScreenStateImpl implements _EditBookScreenState {
  _$EditBookScreenStateImpl(
      {required this.book,
      final List<String> genres = const [],
      final List<String> tags = const []})
      : _genres = genres,
        _tags = tags;

  factory _$EditBookScreenStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$EditBookScreenStateImplFromJson(json);

  @override
  final Book book;
  final List<String> _genres;
  @override
  @JsonKey()
  List<String> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'EditBookScreenState(book: $book, genres: $genres, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditBookScreenStateImpl &&
            (identical(other.book, book) || other.book == book) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      book,
      const DeepCollectionEquality().hash(_genres),
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditBookScreenStateImplCopyWith<_$EditBookScreenStateImpl> get copyWith =>
      __$$EditBookScreenStateImplCopyWithImpl<_$EditBookScreenStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EditBookScreenStateImplToJson(
      this,
    );
  }
}

abstract class _EditBookScreenState implements EditBookScreenState {
  factory _EditBookScreenState(
      {required final Book book,
      final List<String> genres,
      final List<String> tags}) = _$EditBookScreenStateImpl;

  factory _EditBookScreenState.fromJson(Map<String, dynamic> json) =
      _$EditBookScreenStateImpl.fromJson;

  @override
  Book get book;
  @override
  List<String> get genres;
  @override
  List<String> get tags;
  @override
  @JsonKey(ignore: true)
  _$$EditBookScreenStateImplCopyWith<_$EditBookScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
