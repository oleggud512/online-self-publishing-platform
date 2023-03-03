// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_list_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UsersListScreenState {
  AsyncValue<List<FireUser>> get users => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UsersListScreenStateCopyWith<UsersListScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersListScreenStateCopyWith<$Res> {
  factory $UsersListScreenStateCopyWith(UsersListScreenState value,
          $Res Function(UsersListScreenState) then) =
      _$UsersListScreenStateCopyWithImpl<$Res, UsersListScreenState>;
  @useResult
  $Res call({AsyncValue<List<FireUser>> users});
}

/// @nodoc
class _$UsersListScreenStateCopyWithImpl<$Res,
        $Val extends UsersListScreenState>
    implements $UsersListScreenStateCopyWith<$Res> {
  _$UsersListScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
  }) {
    return _then(_value.copyWith(
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<FireUser>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UsersListScreenStateCopyWith<$Res>
    implements $UsersListScreenStateCopyWith<$Res> {
  factory _$$_UsersListScreenStateCopyWith(_$_UsersListScreenState value,
          $Res Function(_$_UsersListScreenState) then) =
      __$$_UsersListScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<List<FireUser>> users});
}

/// @nodoc
class __$$_UsersListScreenStateCopyWithImpl<$Res>
    extends _$UsersListScreenStateCopyWithImpl<$Res, _$_UsersListScreenState>
    implements _$$_UsersListScreenStateCopyWith<$Res> {
  __$$_UsersListScreenStateCopyWithImpl(_$_UsersListScreenState _value,
      $Res Function(_$_UsersListScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
  }) {
    return _then(_$_UsersListScreenState(
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<FireUser>>,
    ));
  }
}

/// @nodoc

class _$_UsersListScreenState implements _UsersListScreenState {
  _$_UsersListScreenState({this.users = const AsyncData([])});

  @override
  @JsonKey()
  final AsyncValue<List<FireUser>> users;

  @override
  String toString() {
    return 'UsersListScreenState(users: $users)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UsersListScreenState &&
            (identical(other.users, users) || other.users == users));
  }

  @override
  int get hashCode => Object.hash(runtimeType, users);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UsersListScreenStateCopyWith<_$_UsersListScreenState> get copyWith =>
      __$$_UsersListScreenStateCopyWithImpl<_$_UsersListScreenState>(
          this, _$identity);
}

abstract class _UsersListScreenState implements UsersListScreenState {
  factory _UsersListScreenState({final AsyncValue<List<FireUser>> users}) =
      _$_UsersListScreenState;

  @override
  AsyncValue<List<FireUser>> get users;
  @override
  @JsonKey(ignore: true)
  _$$_UsersListScreenStateCopyWith<_$_UsersListScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
