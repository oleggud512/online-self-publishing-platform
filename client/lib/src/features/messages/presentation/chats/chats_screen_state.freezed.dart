// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chats_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatsScreenState {
  List<Chat> get chats => throw _privateConstructorUsedError;
  List<Chat>? get adminChats => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatsScreenStateCopyWith<ChatsScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatsScreenStateCopyWith<$Res> {
  factory $ChatsScreenStateCopyWith(
          ChatsScreenState value, $Res Function(ChatsScreenState) then) =
      _$ChatsScreenStateCopyWithImpl<$Res, ChatsScreenState>;
  @useResult
  $Res call({List<Chat> chats, List<Chat>? adminChats});
}

/// @nodoc
class _$ChatsScreenStateCopyWithImpl<$Res, $Val extends ChatsScreenState>
    implements $ChatsScreenStateCopyWith<$Res> {
  _$ChatsScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chats = null,
    Object? adminChats = freezed,
  }) {
    return _then(_value.copyWith(
      chats: null == chats
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<Chat>,
      adminChats: freezed == adminChats
          ? _value.adminChats
          : adminChats // ignore: cast_nullable_to_non_nullable
              as List<Chat>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatsScreenStateImplCopyWith<$Res>
    implements $ChatsScreenStateCopyWith<$Res> {
  factory _$$ChatsScreenStateImplCopyWith(_$ChatsScreenStateImpl value,
          $Res Function(_$ChatsScreenStateImpl) then) =
      __$$ChatsScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Chat> chats, List<Chat>? adminChats});
}

/// @nodoc
class __$$ChatsScreenStateImplCopyWithImpl<$Res>
    extends _$ChatsScreenStateCopyWithImpl<$Res, _$ChatsScreenStateImpl>
    implements _$$ChatsScreenStateImplCopyWith<$Res> {
  __$$ChatsScreenStateImplCopyWithImpl(_$ChatsScreenStateImpl _value,
      $Res Function(_$ChatsScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chats = null,
    Object? adminChats = freezed,
  }) {
    return _then(_$ChatsScreenStateImpl(
      chats: null == chats
          ? _value._chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<Chat>,
      adminChats: freezed == adminChats
          ? _value._adminChats
          : adminChats // ignore: cast_nullable_to_non_nullable
              as List<Chat>?,
    ));
  }
}

/// @nodoc

class _$ChatsScreenStateImpl implements _ChatsScreenState {
  _$ChatsScreenStateImpl(
      {required final List<Chat> chats, final List<Chat>? adminChats})
      : _chats = chats,
        _adminChats = adminChats;

  final List<Chat> _chats;
  @override
  List<Chat> get chats {
    if (_chats is EqualUnmodifiableListView) return _chats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chats);
  }

  final List<Chat>? _adminChats;
  @override
  List<Chat>? get adminChats {
    final value = _adminChats;
    if (value == null) return null;
    if (_adminChats is EqualUnmodifiableListView) return _adminChats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ChatsScreenState(chats: $chats, adminChats: $adminChats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatsScreenStateImpl &&
            const DeepCollectionEquality().equals(other._chats, _chats) &&
            const DeepCollectionEquality()
                .equals(other._adminChats, _adminChats));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_chats),
      const DeepCollectionEquality().hash(_adminChats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatsScreenStateImplCopyWith<_$ChatsScreenStateImpl> get copyWith =>
      __$$ChatsScreenStateImplCopyWithImpl<_$ChatsScreenStateImpl>(
          this, _$identity);
}

abstract class _ChatsScreenState implements ChatsScreenState {
  factory _ChatsScreenState(
      {required final List<Chat> chats,
      final List<Chat>? adminChats}) = _$ChatsScreenStateImpl;

  @override
  List<Chat> get chats;
  @override
  List<Chat>? get adminChats;
  @override
  @JsonKey(ignore: true)
  _$$ChatsScreenStateImplCopyWith<_$ChatsScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
