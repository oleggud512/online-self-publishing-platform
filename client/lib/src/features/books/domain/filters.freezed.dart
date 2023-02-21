// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Filters _$FiltersFromJson(Map<String, dynamic> json) {
  return _Filters.fromJson(json);
}

/// @nodoc
mixin _$Filters {
  @JsonKey(includeIfNull: false)
  String? get ofProfile => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get forProfile => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get query => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  List<String> get genres => throw _privateConstructorUsedError;
  List<BookStatus> get statuses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FiltersCopyWith<Filters> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FiltersCopyWith<$Res> {
  factory $FiltersCopyWith(Filters value, $Res Function(Filters) then) =
      _$FiltersCopyWithImpl<$Res, Filters>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? ofProfile,
      @JsonKey(includeIfNull: false) String? forProfile,
      @JsonKey(includeIfNull: false) String? query,
      List<String> tags,
      List<String> genres,
      List<BookStatus> statuses});
}

/// @nodoc
class _$FiltersCopyWithImpl<$Res, $Val extends Filters>
    implements $FiltersCopyWith<$Res> {
  _$FiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ofProfile = freezed,
    Object? forProfile = freezed,
    Object? query = freezed,
    Object? tags = null,
    Object? genres = null,
    Object? statuses = null,
  }) {
    return _then(_value.copyWith(
      ofProfile: freezed == ofProfile
          ? _value.ofProfile
          : ofProfile // ignore: cast_nullable_to_non_nullable
              as String?,
      forProfile: freezed == forProfile
          ? _value.forProfile
          : forProfile // ignore: cast_nullable_to_non_nullable
              as String?,
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      statuses: null == statuses
          ? _value.statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<BookStatus>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FiltersCopyWith<$Res> implements $FiltersCopyWith<$Res> {
  factory _$$_FiltersCopyWith(
          _$_Filters value, $Res Function(_$_Filters) then) =
      __$$_FiltersCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? ofProfile,
      @JsonKey(includeIfNull: false) String? forProfile,
      @JsonKey(includeIfNull: false) String? query,
      List<String> tags,
      List<String> genres,
      List<BookStatus> statuses});
}

/// @nodoc
class __$$_FiltersCopyWithImpl<$Res>
    extends _$FiltersCopyWithImpl<$Res, _$_Filters>
    implements _$$_FiltersCopyWith<$Res> {
  __$$_FiltersCopyWithImpl(_$_Filters _value, $Res Function(_$_Filters) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ofProfile = freezed,
    Object? forProfile = freezed,
    Object? query = freezed,
    Object? tags = null,
    Object? genres = null,
    Object? statuses = null,
  }) {
    return _then(_$_Filters(
      ofProfile: freezed == ofProfile
          ? _value.ofProfile
          : ofProfile // ignore: cast_nullable_to_non_nullable
              as String?,
      forProfile: freezed == forProfile
          ? _value.forProfile
          : forProfile // ignore: cast_nullable_to_non_nullable
              as String?,
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      statuses: null == statuses
          ? _value._statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<BookStatus>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Filters implements _Filters {
  _$_Filters(
      {@JsonKey(includeIfNull: false) this.ofProfile,
      @JsonKey(includeIfNull: false) this.forProfile,
      @JsonKey(includeIfNull: false) this.query,
      final List<String> tags = const [],
      final List<String> genres = const [],
      final List<BookStatus> statuses = const []})
      : _tags = tags,
        _genres = genres,
        _statuses = statuses;

  factory _$_Filters.fromJson(Map<String, dynamic> json) =>
      _$$_FiltersFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  final String? ofProfile;
  @override
  @JsonKey(includeIfNull: false)
  final String? forProfile;
  @override
  @JsonKey(includeIfNull: false)
  final String? query;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<String> _genres;
  @override
  @JsonKey()
  List<String> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  final List<BookStatus> _statuses;
  @override
  @JsonKey()
  List<BookStatus> get statuses {
    if (_statuses is EqualUnmodifiableListView) return _statuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statuses);
  }

  @override
  String toString() {
    return 'Filters(ofProfile: $ofProfile, forProfile: $forProfile, query: $query, tags: $tags, genres: $genres, statuses: $statuses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Filters &&
            (identical(other.ofProfile, ofProfile) ||
                other.ofProfile == ofProfile) &&
            (identical(other.forProfile, forProfile) ||
                other.forProfile == forProfile) &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            const DeepCollectionEquality().equals(other._statuses, _statuses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      ofProfile,
      forProfile,
      query,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_genres),
      const DeepCollectionEquality().hash(_statuses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FiltersCopyWith<_$_Filters> get copyWith =>
      __$$_FiltersCopyWithImpl<_$_Filters>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FiltersToJson(
      this,
    );
  }
}

abstract class _Filters implements Filters {
  factory _Filters(
      {@JsonKey(includeIfNull: false) final String? ofProfile,
      @JsonKey(includeIfNull: false) final String? forProfile,
      @JsonKey(includeIfNull: false) final String? query,
      final List<String> tags,
      final List<String> genres,
      final List<BookStatus> statuses}) = _$_Filters;

  factory _Filters.fromJson(Map<String, dynamic> json) = _$_Filters.fromJson;

  @override
  @JsonKey(includeIfNull: false)
  String? get ofProfile;
  @override
  @JsonKey(includeIfNull: false)
  String? get forProfile;
  @override
  @JsonKey(includeIfNull: false)
  String? get query;
  @override
  List<String> get tags;
  @override
  List<String> get genres;
  @override
  List<BookStatus> get statuses;
  @override
  @JsonKey(ignore: true)
  _$$_FiltersCopyWith<_$_Filters> get copyWith =>
      throw _privateConstructorUsedError;
}
