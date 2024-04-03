// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReportType _$ReportTypeFromJson(Map<String, dynamic> json) {
  return _ReportType.fromJson(json);
}

/// @nodoc
mixin _$ReportType {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  List<String> get subjectName => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportTypeCopyWith<ReportType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportTypeCopyWith<$Res> {
  factory $ReportTypeCopyWith(
          ReportType value, $Res Function(ReportType) then) =
      _$ReportTypeCopyWithImpl<$Res, ReportType>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String name,
      String displayName,
      List<String> subjectName,
      String description});
}

/// @nodoc
class _$ReportTypeCopyWithImpl<$Res, $Val extends ReportType>
    implements $ReportTypeCopyWith<$Res> {
  _$ReportTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
    Object? subjectName = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportTypeImplCopyWith<$Res>
    implements $ReportTypeCopyWith<$Res> {
  factory _$$ReportTypeImplCopyWith(
          _$ReportTypeImpl value, $Res Function(_$ReportTypeImpl) then) =
      __$$ReportTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String name,
      String displayName,
      List<String> subjectName,
      String description});
}

/// @nodoc
class __$$ReportTypeImplCopyWithImpl<$Res>
    extends _$ReportTypeCopyWithImpl<$Res, _$ReportTypeImpl>
    implements _$$ReportTypeImplCopyWith<$Res> {
  __$$ReportTypeImplCopyWithImpl(
      _$ReportTypeImpl _value, $Res Function(_$ReportTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
    Object? subjectName = null,
    Object? description = null,
  }) {
    return _then(_$ReportTypeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      subjectName: null == subjectName
          ? _value._subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportTypeImpl implements _ReportType {
  _$ReportTypeImpl(
      {@JsonKey(name: "_id") this.id = "",
      this.name = "",
      this.displayName = "",
      final List<String> subjectName = const [],
      this.description = ""})
      : _subjectName = subjectName;

  factory _$ReportTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportTypeImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String displayName;
  final List<String> _subjectName;
  @override
  @JsonKey()
  List<String> get subjectName {
    if (_subjectName is EqualUnmodifiableListView) return _subjectName;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subjectName);
  }

  @override
  @JsonKey()
  final String description;

  @override
  String toString() {
    return 'ReportType(id: $id, name: $name, displayName: $displayName, subjectName: $subjectName, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            const DeepCollectionEquality()
                .equals(other._subjectName, _subjectName) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, displayName,
      const DeepCollectionEquality().hash(_subjectName), description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportTypeImplCopyWith<_$ReportTypeImpl> get copyWith =>
      __$$ReportTypeImplCopyWithImpl<_$ReportTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportTypeImplToJson(
      this,
    );
  }
}

abstract class _ReportType implements ReportType {
  factory _ReportType(
      {@JsonKey(name: "_id") final String id,
      final String name,
      final String displayName,
      final List<String> subjectName,
      final String description}) = _$ReportTypeImpl;

  factory _ReportType.fromJson(Map<String, dynamic> json) =
      _$ReportTypeImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String get name;
  @override
  String get displayName;
  @override
  List<String> get subjectName;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$ReportTypeImplCopyWith<_$ReportTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
