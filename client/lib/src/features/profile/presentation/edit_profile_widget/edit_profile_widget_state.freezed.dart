// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_widget_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditProfileWidgetState {
  Profile get profile => throw _privateConstructorUsedError;
  bool get isUniqueName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditProfileWidgetStateCopyWith<EditProfileWidgetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileWidgetStateCopyWith<$Res> {
  factory $EditProfileWidgetStateCopyWith(EditProfileWidgetState value,
          $Res Function(EditProfileWidgetState) then) =
      _$EditProfileWidgetStateCopyWithImpl<$Res, EditProfileWidgetState>;
  @useResult
  $Res call({Profile profile, bool isUniqueName});

  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class _$EditProfileWidgetStateCopyWithImpl<$Res,
        $Val extends EditProfileWidgetState>
    implements $EditProfileWidgetStateCopyWith<$Res> {
  _$EditProfileWidgetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? isUniqueName = null,
  }) {
    return _then(_value.copyWith(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      isUniqueName: null == isUniqueName
          ? _value.isUniqueName
          : isUniqueName // ignore: cast_nullable_to_non_nullable
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
abstract class _$$EditProfileWidgetStateImplCopyWith<$Res>
    implements $EditProfileWidgetStateCopyWith<$Res> {
  factory _$$EditProfileWidgetStateImplCopyWith(
          _$EditProfileWidgetStateImpl value,
          $Res Function(_$EditProfileWidgetStateImpl) then) =
      __$$EditProfileWidgetStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Profile profile, bool isUniqueName});

  @override
  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$$EditProfileWidgetStateImplCopyWithImpl<$Res>
    extends _$EditProfileWidgetStateCopyWithImpl<$Res,
        _$EditProfileWidgetStateImpl>
    implements _$$EditProfileWidgetStateImplCopyWith<$Res> {
  __$$EditProfileWidgetStateImplCopyWithImpl(
      _$EditProfileWidgetStateImpl _value,
      $Res Function(_$EditProfileWidgetStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? isUniqueName = null,
  }) {
    return _then(_$EditProfileWidgetStateImpl(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      isUniqueName: null == isUniqueName
          ? _value.isUniqueName
          : isUniqueName // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$EditProfileWidgetStateImpl implements _EditProfileWidgetState {
  _$EditProfileWidgetStateImpl(
      {required this.profile, this.isUniqueName = false});

  @override
  final Profile profile;
  @override
  @JsonKey()
  final bool isUniqueName;

  @override
  String toString() {
    return 'EditProfileWidgetState(profile: $profile, isUniqueName: $isUniqueName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditProfileWidgetStateImpl &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.isUniqueName, isUniqueName) ||
                other.isUniqueName == isUniqueName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile, isUniqueName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditProfileWidgetStateImplCopyWith<_$EditProfileWidgetStateImpl>
      get copyWith => __$$EditProfileWidgetStateImplCopyWithImpl<
          _$EditProfileWidgetStateImpl>(this, _$identity);
}

abstract class _EditProfileWidgetState implements EditProfileWidgetState {
  factory _EditProfileWidgetState(
      {required final Profile profile,
      final bool isUniqueName}) = _$EditProfileWidgetStateImpl;

  @override
  Profile get profile;
  @override
  bool get isUniqueName;
  @override
  @JsonKey(ignore: true)
  _$$EditProfileWidgetStateImplCopyWith<_$EditProfileWidgetStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
