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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
abstract class _$$ChatScreenStateImplCopyWith<$Res>
    implements $ChatScreenStateCopyWith<$Res> {
  factory _$$ChatScreenStateImplCopyWith(_$ChatScreenStateImpl value,
          $Res Function(_$ChatScreenStateImpl) then) =
      __$$ChatScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Chat chat, List<Message> messages});

  @override
  $ChatCopyWith<$Res> get chat;
}

/// @nodoc
class __$$ChatScreenStateImplCopyWithImpl<$Res>
    extends _$ChatScreenStateCopyWithImpl<$Res, _$ChatScreenStateImpl>
    implements _$$ChatScreenStateImplCopyWith<$Res> {
  __$$ChatScreenStateImplCopyWithImpl(
      _$ChatScreenStateImpl _value, $Res Function(_$ChatScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chat = null,
    Object? messages = null,
  }) {
    return _then(_$ChatScreenStateImpl(
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

class _$ChatScreenStateImpl implements _ChatScreenState {
  _$ChatScreenStateImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatScreenStateImpl &&
            (identical(other.chat, chat) || other.chat == chat) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, chat, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatScreenStateImplCopyWith<_$ChatScreenStateImpl> get copyWith =>
      __$$ChatScreenStateImplCopyWithImpl<_$ChatScreenStateImpl>(
          this, _$identity);
}

abstract class _ChatScreenState implements ChatScreenState {
  factory _ChatScreenState(
      {required final Chat chat,
      final List<Message> messages}) = _$ChatScreenStateImpl;

  @override
  Chat get chat;
  @override
  List<Message> get messages;
  @override
  @JsonKey(ignore: true)
  _$$ChatScreenStateImplCopyWith<_$ChatScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
