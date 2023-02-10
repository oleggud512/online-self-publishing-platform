// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileScreenState {
  Profile get profile => throw _privateConstructorUsedError;
  bool get isSubscribed =>
      throw _privateConstructorUsedError; // do I subscribed on this profile?
  bool get isMy => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileScreenStateCopyWith<ProfileScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileScreenStateCopyWith<$Res> {
  factory $ProfileScreenStateCopyWith(
          ProfileScreenState value, $Res Function(ProfileScreenState) then) =
      _$ProfileScreenStateCopyWithImpl<$Res, ProfileScreenState>;
  @useResult
  $Res call({Profile profile, bool isSubscribed, bool isMy});

  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class _$ProfileScreenStateCopyWithImpl<$Res, $Val extends ProfileScreenState>
    implements $ProfileScreenStateCopyWith<$Res> {
  _$ProfileScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? isSubscribed = null,
    Object? isMy = null,
  }) {
    return _then(_value.copyWith(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      isSubscribed: null == isSubscribed
          ? _value.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
      isMy: null == isMy
          ? _value.isMy
          : isMy // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProfileScreenStateCopyWith<$Res>
    implements $ProfileScreenStateCopyWith<$Res> {
  factory _$$_ProfileScreenStateCopyWith(_$_ProfileScreenState value,
          $Res Function(_$_ProfileScreenState) then) =
      __$$_ProfileScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Profile profile, bool isSubscribed, bool isMy});

  @override
  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$$_ProfileScreenStateCopyWithImpl<$Res>
    extends _$ProfileScreenStateCopyWithImpl<$Res, _$_ProfileScreenState>
    implements _$$_ProfileScreenStateCopyWith<$Res> {
  __$$_ProfileScreenStateCopyWithImpl(
      _$_ProfileScreenState _value, $Res Function(_$_ProfileScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? isSubscribed = null,
    Object? isMy = null,
  }) {
    return _then(_$_ProfileScreenState(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      isSubscribed: null == isSubscribed
          ? _value.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
      isMy: null == isMy
          ? _value.isMy
          : isMy // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ProfileScreenState implements _ProfileScreenState {
  _$_ProfileScreenState(
      {required this.profile, this.isSubscribed = false, this.isMy = false});

  @override
  final Profile profile;
  @override
  @JsonKey()
  final bool isSubscribed;
// do I subscribed on this profile?
  @override
  @JsonKey()
  final bool isMy;

  @override
  String toString() {
    return 'ProfileScreenState(profile: $profile, isSubscribed: $isSubscribed, isMy: $isMy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileScreenState &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.isSubscribed, isSubscribed) ||
                other.isSubscribed == isSubscribed) &&
            (identical(other.isMy, isMy) || other.isMy == isMy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile, isSubscribed, isMy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileScreenStateCopyWith<_$_ProfileScreenState> get copyWith =>
      __$$_ProfileScreenStateCopyWithImpl<_$_ProfileScreenState>(
          this, _$identity);
}

abstract class _ProfileScreenState implements ProfileScreenState {
  factory _ProfileScreenState(
      {required final Profile profile,
      final bool isSubscribed,
      final bool isMy}) = _$_ProfileScreenState;

  @override
  Profile get profile;
  @override
  bool get isSubscribed;
  @override // do I subscribed on this profile?
  bool get isMy;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileScreenStateCopyWith<_$_ProfileScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
