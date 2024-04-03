// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationsScreenState {
  List<MyNotification> get notifications => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationsScreenStateCopyWith<NotificationsScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsScreenStateCopyWith<$Res> {
  factory $NotificationsScreenStateCopyWith(NotificationsScreenState value,
          $Res Function(NotificationsScreenState) then) =
      _$NotificationsScreenStateCopyWithImpl<$Res, NotificationsScreenState>;
  @useResult
  $Res call({List<MyNotification> notifications});
}

/// @nodoc
class _$NotificationsScreenStateCopyWithImpl<$Res,
        $Val extends NotificationsScreenState>
    implements $NotificationsScreenStateCopyWith<$Res> {
  _$NotificationsScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
  }) {
    return _then(_value.copyWith(
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<MyNotification>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationsScreenStateImplCopyWith<$Res>
    implements $NotificationsScreenStateCopyWith<$Res> {
  factory _$$NotificationsScreenStateImplCopyWith(
          _$NotificationsScreenStateImpl value,
          $Res Function(_$NotificationsScreenStateImpl) then) =
      __$$NotificationsScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MyNotification> notifications});
}

/// @nodoc
class __$$NotificationsScreenStateImplCopyWithImpl<$Res>
    extends _$NotificationsScreenStateCopyWithImpl<$Res,
        _$NotificationsScreenStateImpl>
    implements _$$NotificationsScreenStateImplCopyWith<$Res> {
  __$$NotificationsScreenStateImplCopyWithImpl(
      _$NotificationsScreenStateImpl _value,
      $Res Function(_$NotificationsScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
  }) {
    return _then(_$NotificationsScreenStateImpl(
      notifications: null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<MyNotification>,
    ));
  }
}

/// @nodoc

class _$NotificationsScreenStateImpl implements _NotificationsScreenState {
  _$NotificationsScreenStateImpl(
      {final List<MyNotification> notifications = const []})
      : _notifications = notifications;

  final List<MyNotification> _notifications;
  @override
  @JsonKey()
  List<MyNotification> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  String toString() {
    return 'NotificationsScreenState(notifications: $notifications)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsScreenStateImpl &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_notifications));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationsScreenStateImplCopyWith<_$NotificationsScreenStateImpl>
      get copyWith => __$$NotificationsScreenStateImplCopyWithImpl<
          _$NotificationsScreenStateImpl>(this, _$identity);
}

abstract class _NotificationsScreenState implements NotificationsScreenState {
  factory _NotificationsScreenState(
          {final List<MyNotification> notifications}) =
      _$NotificationsScreenStateImpl;

  @override
  List<MyNotification> get notifications;
  @override
  @JsonKey(ignore: true)
  _$$NotificationsScreenStateImplCopyWith<_$NotificationsScreenStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
