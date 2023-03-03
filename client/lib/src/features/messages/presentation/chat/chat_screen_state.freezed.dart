// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatScreenState {
  Chat get chat => throw _privateConstructorUsedError;
  List<Message> get messages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatScreenStateCopyWith<ChatScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatScreenStateCopyWith<$Res> {
  factory $ChatScreenStateCopyWith(
          ChatScreenState value, $Res Function(ChatScreenState) then) =
      _$ChatScreenStateCopyWithImpl<$Res, ChatScreenState>;
  @useResult
  $Res call({Chat chat, List<Message> messages});

  $ChatCopyWith<$Res> get chat;
}

/// @nodoc
class _$ChatScreenStateCopyWithImpl<$Res, $Val extends ChatScreenState>
    implements $ChatScreenStateCopyWith<$Res> {
  _$ChatScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chat = null,
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      chat: null == chat
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as Chat,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatCopyWith<$Res> get chat {
    return $ChatCopyWith<$Res>(_value.chat, (value) {
      return _then(_value.copyWith(chat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChatScreenStateCopyWith<$Res>
    implements $ChatScreenStateCopyWith<$Res> {
  factory _$$_ChatScreenStateCopyWith(
          _$_ChatScreenState value, $Res Function(_$_ChatScreenState) then) =
      __$$_ChatScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Chat chat, List<Message> messages});

  @override
  $ChatCopyWith<$Res> get chat;
}

/// @nodoc
class __$$_ChatScreenStateCopyWithImpl<$Res>
    extends _$ChatScreenStateCopyWithImpl<$Res, _$_ChatScreenState>
    implements _$$_ChatScreenStateCopyWith<$Res> {
  __$$_ChatScreenStateCopyWithImpl(
      _$_ChatScreenState _value, $Res Function(_$_ChatScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chat = null,
    Object? messages = null,
  }) {
    return _then(_$_ChatScreenState(
      chat: null == chat
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as Chat,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc

class _$_ChatScreenState implements _ChatScreenState {
  _$_ChatScreenState(
      {required this.chat, final List<Message> messages = const []})
      : _messages = messages;

  @override
  final Chat chat;
  final List<Message> _messages;
  @override
  @JsonKey()
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'ChatScreenState(chat: $chat, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatScreenState &&
            (identical(other.chat, chat) || other.chat == chat) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, chat, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatScreenStateCopyWith<_$_ChatScreenState> get copyWith =>
      __$$_ChatScreenStateCopyWithImpl<_$_ChatScreenState>(this, _$identity);
}

abstract class _ChatScreenState implements ChatScreenState {
  factory _ChatScreenState(
      {required final Chat chat,
      final List<Message> messages}) = _$_ChatScreenState;

  @override
  Chat get chat;
  @override
  List<Message> get messages;
  @override
  @JsonKey(ignore: true)
  _$$_ChatScreenStateCopyWith<_$_ChatScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
