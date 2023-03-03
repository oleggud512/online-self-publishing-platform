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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatsScreenState {
  List<Chat> get chats => throw _privateConstructorUsedError;

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
  $Res call({List<Chat> chats});
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
  }) {
    return _then(_value.copyWith(
      chats: null == chats
          ? _value.chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<Chat>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatsScreenStateCopyWith<$Res>
    implements $ChatsScreenStateCopyWith<$Res> {
  factory _$$_ChatsScreenStateCopyWith(
          _$_ChatsScreenState value, $Res Function(_$_ChatsScreenState) then) =
      __$$_ChatsScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Chat> chats});
}

/// @nodoc
class __$$_ChatsScreenStateCopyWithImpl<$Res>
    extends _$ChatsScreenStateCopyWithImpl<$Res, _$_ChatsScreenState>
    implements _$$_ChatsScreenStateCopyWith<$Res> {
  __$$_ChatsScreenStateCopyWithImpl(
      _$_ChatsScreenState _value, $Res Function(_$_ChatsScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chats = null,
  }) {
    return _then(_$_ChatsScreenState(
      chats: null == chats
          ? _value._chats
          : chats // ignore: cast_nullable_to_non_nullable
              as List<Chat>,
    ));
  }
}

/// @nodoc

class _$_ChatsScreenState implements _ChatsScreenState {
  _$_ChatsScreenState({required final List<Chat> chats}) : _chats = chats;

  final List<Chat> _chats;
  @override
  List<Chat> get chats {
    if (_chats is EqualUnmodifiableListView) return _chats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chats);
  }

  @override
  String toString() {
    return 'ChatsScreenState(chats: $chats)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatsScreenState &&
            const DeepCollectionEquality().equals(other._chats, _chats));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_chats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatsScreenStateCopyWith<_$_ChatsScreenState> get copyWith =>
      __$$_ChatsScreenStateCopyWithImpl<_$_ChatsScreenState>(this, _$identity);
}

abstract class _ChatsScreenState implements ChatsScreenState {
  factory _ChatsScreenState({required final List<Chat> chats}) =
      _$_ChatsScreenState;

  @override
  List<Chat> get chats;
  @override
  @JsonKey(ignore: true)
  _$$_ChatsScreenStateCopyWith<_$_ChatsScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
