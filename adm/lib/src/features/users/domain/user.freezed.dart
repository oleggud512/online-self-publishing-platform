// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FireUser _$FireUserFromJson(Map<String, dynamic> json) {
  return _FireUser.fromJson(json);
}

/// @nodoc
mixin _$FireUser {
  String? get displayName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  Role get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FireUserCopyWith<FireUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FireUserCopyWith<$Res> {
  factory $FireUserCopyWith(FireUser value, $Res Function(FireUser) then) =
      _$FireUserCopyWithImpl<$Res, FireUser>;
  @useResult
  $Res call({String? displayName, String? email, String uid, Role role});
}

/// @nodoc
class _$FireUserCopyWithImpl<$Res, $Val extends FireUser>
    implements $FireUserCopyWith<$Res> {
  _$FireUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = freezed,
    Object? email = freezed,
    Object? uid = null,
    Object? role = null,
  }) {
    return _then(_value.copyWith(
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FireUserCopyWith<$Res> implements $FireUserCopyWith<$Res> {
  factory _$$_FireUserCopyWith(
          _$_FireUser value, $Res Function(_$_FireUser) then) =
      __$$_FireUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? displayName, String? email, String uid, Role role});
}

/// @nodoc
class __$$_FireUserCopyWithImpl<$Res>
    extends _$FireUserCopyWithImpl<$Res, _$_FireUser>
    implements _$$_FireUserCopyWith<$Res> {
  __$$_FireUserCopyWithImpl(
      _$_FireUser _value, $Res Function(_$_FireUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = freezed,
    Object? email = freezed,
    Object? uid = null,
    Object? role = null,
  }) {
    return _then(_$_FireUser(
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as Role,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FireUser implements _FireUser {
  _$_FireUser(
      {this.displayName, this.email, required this.uid, required this.role});

  factory _$_FireUser.fromJson(Map<String, dynamic> json) =>
      _$$_FireUserFromJson(json);

  @override
  final String? displayName;
  @override
  final String? email;
  @override
  final String uid;
  @override
  final Role role;

  @override
  String toString() {
    return 'FireUser(displayName: $displayName, email: $email, uid: $uid, role: $role)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FireUser &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, displayName, email, uid, role);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FireUserCopyWith<_$_FireUser> get copyWith =>
      __$$_FireUserCopyWithImpl<_$_FireUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FireUserToJson(
      this,
    );
  }
}

abstract class _FireUser implements FireUser {
  factory _FireUser(
      {final String? displayName,
      final String? email,
      required final String uid,
      required final Role role}) = _$_FireUser;

  factory _FireUser.fromJson(Map<String, dynamic> json) = _$_FireUser.fromJson;

  @override
  String? get displayName;
  @override
  String? get email;
  @override
  String get uid;
  @override
  Role get role;
  @override
  @JsonKey(ignore: true)
  _$$_FireUserCopyWith<_$_FireUser> get copyWith =>
      throw _privateConstructorUsedError;
}
