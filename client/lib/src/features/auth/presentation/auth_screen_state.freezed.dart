// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthScreenState {
  AuthMode get mode => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  Gender get gender => throw _privateConstructorUsedError;
  GoogleSignInAccount? get googleSignInAccount =>
      throw _privateConstructorUsedError;
  bool get passwordTooLong => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthScreenStateCopyWith<AuthScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthScreenStateCopyWith<$Res> {
  factory $AuthScreenStateCopyWith(
          AuthScreenState value, $Res Function(AuthScreenState) then) =
      _$AuthScreenStateCopyWithImpl<$Res, AuthScreenState>;
  @useResult
  $Res call(
      {AuthMode mode,
      String email,
      String password,
      String name,
      String displayName,
      int age,
      Gender gender,
      GoogleSignInAccount? googleSignInAccount,
      bool passwordTooLong});
}

/// @nodoc
class _$AuthScreenStateCopyWithImpl<$Res, $Val extends AuthScreenState>
    implements $AuthScreenStateCopyWith<$Res> {
  _$AuthScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? email = null,
    Object? password = null,
    Object? name = null,
    Object? displayName = null,
    Object? age = null,
    Object? gender = null,
    Object? googleSignInAccount = freezed,
    Object? passwordTooLong = null,
  }) {
    return _then(_value.copyWith(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as AuthMode,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      googleSignInAccount: freezed == googleSignInAccount
          ? _value.googleSignInAccount
          : googleSignInAccount // ignore: cast_nullable_to_non_nullable
              as GoogleSignInAccount?,
      passwordTooLong: null == passwordTooLong
          ? _value.passwordTooLong
          : passwordTooLong // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthScreenStateImplCopyWith<$Res>
    implements $AuthScreenStateCopyWith<$Res> {
  factory _$$AuthScreenStateImplCopyWith(_$AuthScreenStateImpl value,
          $Res Function(_$AuthScreenStateImpl) then) =
      __$$AuthScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AuthMode mode,
      String email,
      String password,
      String name,
      String displayName,
      int age,
      Gender gender,
      GoogleSignInAccount? googleSignInAccount,
      bool passwordTooLong});
}

/// @nodoc
class __$$AuthScreenStateImplCopyWithImpl<$Res>
    extends _$AuthScreenStateCopyWithImpl<$Res, _$AuthScreenStateImpl>
    implements _$$AuthScreenStateImplCopyWith<$Res> {
  __$$AuthScreenStateImplCopyWithImpl(
      _$AuthScreenStateImpl _value, $Res Function(_$AuthScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? email = null,
    Object? password = null,
    Object? name = null,
    Object? displayName = null,
    Object? age = null,
    Object? gender = null,
    Object? googleSignInAccount = freezed,
    Object? passwordTooLong = null,
  }) {
    return _then(_$AuthScreenStateImpl(
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as AuthMode,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender,
      googleSignInAccount: freezed == googleSignInAccount
          ? _value.googleSignInAccount
          : googleSignInAccount // ignore: cast_nullable_to_non_nullable
              as GoogleSignInAccount?,
      passwordTooLong: null == passwordTooLong
          ? _value.passwordTooLong
          : passwordTooLong // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AuthScreenStateImpl implements _AuthScreenState {
  _$AuthScreenStateImpl(
      {this.mode = AuthMode.signIn,
      this.email = "",
      this.password = "",
      this.name = "",
      this.displayName = "",
      this.age = 0,
      this.gender = Gender.preferNotToSay,
      this.googleSignInAccount,
      this.passwordTooLong = true});

  @override
  @JsonKey()
  final AuthMode mode;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String displayName;
  @override
  @JsonKey()
  final int age;
  @override
  @JsonKey()
  final Gender gender;
  @override
  final GoogleSignInAccount? googleSignInAccount;
  @override
  @JsonKey()
  final bool passwordTooLong;

  @override
  String toString() {
    return 'AuthScreenState(mode: $mode, email: $email, password: $password, name: $name, displayName: $displayName, age: $age, gender: $gender, googleSignInAccount: $googleSignInAccount, passwordTooLong: $passwordTooLong)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthScreenStateImpl &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.googleSignInAccount, googleSignInAccount) ||
                other.googleSignInAccount == googleSignInAccount) &&
            (identical(other.passwordTooLong, passwordTooLong) ||
                other.passwordTooLong == passwordTooLong));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mode, email, password, name,
      displayName, age, gender, googleSignInAccount, passwordTooLong);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthScreenStateImplCopyWith<_$AuthScreenStateImpl> get copyWith =>
      __$$AuthScreenStateImplCopyWithImpl<_$AuthScreenStateImpl>(
          this, _$identity);
}

abstract class _AuthScreenState implements AuthScreenState {
  factory _AuthScreenState(
      {final AuthMode mode,
      final String email,
      final String password,
      final String name,
      final String displayName,
      final int age,
      final Gender gender,
      final GoogleSignInAccount? googleSignInAccount,
      final bool passwordTooLong}) = _$AuthScreenStateImpl;

  @override
  AuthMode get mode;
  @override
  String get email;
  @override
  String get password;
  @override
  String get name;
  @override
  String get displayName;
  @override
  int get age;
  @override
  Gender get gender;
  @override
  GoogleSignInAccount? get googleSignInAccount;
  @override
  bool get passwordTooLong;
  @override
  @JsonKey(ignore: true)
  _$$AuthScreenStateImplCopyWith<_$AuthScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
