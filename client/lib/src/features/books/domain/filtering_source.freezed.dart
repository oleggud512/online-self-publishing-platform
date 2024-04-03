// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filtering_source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FilteringSource _$FilteringSourceFromJson(Map<String, dynamic> json) {
  return _FilteringSource.fromJson(json);
}

/// @nodoc
mixin _$FilteringSource {
  List<String> get tags => throw _privateConstructorUsedError;
  List<String> get genres => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FilteringSourceCopyWith<FilteringSource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilteringSourceCopyWith<$Res> {
  factory $FilteringSourceCopyWith(
          FilteringSource value, $Res Function(FilteringSource) then) =
      _$FilteringSourceCopyWithImpl<$Res, FilteringSource>;
  @useResult
  $Res call({List<String> tags, List<String> genres});
}

/// @nodoc
class _$FilteringSourceCopyWithImpl<$Res, $Val extends FilteringSource>
    implements $FilteringSourceCopyWith<$Res> {
  _$FilteringSourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tags = null,
    Object? genres = null,
  }) {
    return _then(_value.copyWith(
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilteringSourceImplCopyWith<$Res>
    implements $FilteringSourceCopyWith<$Res> {
  factory _$$FilteringSourceImplCopyWith(_$FilteringSourceImpl value,
          $Res Function(_$FilteringSourceImpl) then) =
      __$$FilteringSourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> tags, List<String> genres});
}

/// @nodoc
class __$$FilteringSourceImplCopyWithImpl<$Res>
    extends _$FilteringSourceCopyWithImpl<$Res, _$FilteringSourceImpl>
    implements _$$FilteringSourceImplCopyWith<$Res> {
  __$$FilteringSourceImplCopyWithImpl(
      _$FilteringSourceImpl _value, $Res Function(_$FilteringSourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tags = null,
    Object? genres = null,
  }) {
    return _then(_$FilteringSourceImpl(
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FilteringSourceImpl implements _FilteringSource {
  _$FilteringSourceImpl(
      {required final List<String> tags, required final List<String> genres})
      : _tags = tags,
        _genres = genres;

  factory _$FilteringSourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilteringSourceImplFromJson(json);

  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<String> _genres;
  @override
  List<String> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  String toString() {
    return 'FilteringSource(tags: $tags, genres: $genres)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilteringSourceImpl &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other._genres, _genres));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_genres));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilteringSourceImplCopyWith<_$FilteringSourceImpl> get copyWith =>
      __$$FilteringSourceImplCopyWithImpl<_$FilteringSourceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FilteringSourceImplToJson(
      this,
    );
  }
}

abstract class _FilteringSource implements FilteringSource {
  factory _FilteringSource(
      {required final List<String> tags,
      required final List<String> genres}) = _$FilteringSourceImpl;

  factory _FilteringSource.fromJson(Map<String, dynamic> json) =
      _$FilteringSourceImpl.fromJson;

  @override
  List<String> get tags;
  @override
  List<String> get genres;
  @override
  @JsonKey(ignore: true)
  _$$FilteringSourceImplCopyWith<_$FilteringSourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
