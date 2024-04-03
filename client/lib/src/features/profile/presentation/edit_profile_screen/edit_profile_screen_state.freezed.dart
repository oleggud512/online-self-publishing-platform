// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditProfileScreenState {
  Profile get originalProfile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditProfileScreenStateCopyWith<EditProfileScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileScreenStateCopyWith<$Res> {
  factory $EditProfileScreenStateCopyWith(EditProfileScreenState value,
          $Res Function(EditProfileScreenState) then) =
      _$EditProfileScreenStateCopyWithImpl<$Res, EditProfileScreenState>;
  @useResult
  $Res call({Profile originalProfile});

  $ProfileCopyWith<$Res> get originalProfile;
}

/// @nodoc
class _$EditProfileScreenStateCopyWithImpl<$Res,
        $Val extends EditProfileScreenState>
    implements $EditProfileScreenStateCopyWith<$Res> {
  _$EditProfileScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalProfile = null,
  }) {
    return _then(_value.copyWith(
      originalProfile: null == originalProfile
          ? _value.originalProfile
          : originalProfile // ignore: cast_nullable_to_non_nullable
              as Profile,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get originalProfile {
    return $ProfileCopyWith<$Res>(_value.originalProfile, (value) {
      return _then(_value.copyWith(originalProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EditProfileScreenStateImplCopyWith<$Res>
    implements $EditProfileScreenStateCopyWith<$Res> {
  factory _$$EditProfileScreenStateImplCopyWith(
          _$EditProfileScreenStateImpl value,
          $Res Function(_$EditProfileScreenStateImpl) then) =
      __$$EditProfileScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Profile originalProfile});

  @override
  $ProfileCopyWith<$Res> get originalProfile;
}

/// @nodoc
class __$$EditProfileScreenStateImplCopyWithImpl<$Res>
    extends _$EditProfileScreenStateCopyWithImpl<$Res,
        _$EditProfileScreenStateImpl>
    implements _$$EditProfileScreenStateImplCopyWith<$Res> {
  __$$EditProfileScreenStateImplCopyWithImpl(
      _$EditProfileScreenStateImpl _value,
      $Res Function(_$EditProfileScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalProfile = null,
  }) {
    return _then(_$EditProfileScreenStateImpl(
      originalProfile: null == originalProfile
          ? _value.originalProfile
          : originalProfile // ignore: cast_nullable_to_non_nullable
              as Profile,
    ));
  }
}

/// @nodoc

class _$EditProfileScreenStateImpl implements _EditProfileScreenState {
  _$EditProfileScreenStateImpl({required this.originalProfile});

  @override
  final Profile originalProfile;

  @override
  String toString() {
    return 'EditProfileScreenState(originalProfile: $originalProfile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditProfileScreenStateImpl &&
            (identical(other.originalProfile, originalProfile) ||
                other.originalProfile == originalProfile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, originalProfile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditProfileScreenStateImplCopyWith<_$EditProfileScreenStateImpl>
      get copyWith => __$$EditProfileScreenStateImplCopyWithImpl<
          _$EditProfileScreenStateImpl>(this, _$identity);
}

abstract class _EditProfileScreenState implements EditProfileScreenState {
  factory _EditProfileScreenState({required final Profile originalProfile}) =
      _$EditProfileScreenStateImpl;

  @override
  Profile get originalProfile;
  @override
  @JsonKey(ignore: true)
  _$$EditProfileScreenStateImplCopyWith<_$EditProfileScreenStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
