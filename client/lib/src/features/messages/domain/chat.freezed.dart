// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Chat {
  Profile get other => throw _privateConstructorUsedError;
  String get firstMessage => throw _privateConstructorUsedError;
  Profile? get me => throw _privateConstructorUsedError;
  List<Message>? get messages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatCopyWith<Chat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCopyWith<$Res> {
  factory $ChatCopyWith(Chat value, $Res Function(Chat) then) =
      _$ChatCopyWithImpl<$Res, Chat>;
  @useResult
  $Res call(
      {Profile other,
      String firstMessage,
      Profile? me,
      List<Message>? messages});

  $ProfileCopyWith<$Res> get other;
  $ProfileCopyWith<$Res>? get me;
}

/// @nodoc
class _$ChatCopyWithImpl<$Res, $Val extends Chat>
    implements $ChatCopyWith<$Res> {
  _$ChatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? other = null,
    Object? firstMessage = null,
    Object? me = freezed,
    Object? messages = freezed,
  }) {
    return _then(_value.copyWith(
      other: null == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as Profile,
      firstMessage: null == firstMessage
          ? _value.firstMessage
          : firstMessage // ignore: cast_nullable_to_non_nullable
              as String,
      me: freezed == me
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as Profile?,
      messages: freezed == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get other {
    return $ProfileCopyWith<$Res>(_value.other, (value) {
      return _then(_value.copyWith(other: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res>? get me {
    if (_value.me == null) {
      return null;
    }

    return $ProfileCopyWith<$Res>(_value.me!, (value) {
      return _then(_value.copyWith(me: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChatCopyWith<$Res> implements $ChatCopyWith<$Res> {
  factory _$$_ChatCopyWith(_$_Chat value, $Res Function(_$_Chat) then) =
      __$$_ChatCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Profile other,
      String firstMessage,
      Profile? me,
      List<Message>? messages});

  @override
  $ProfileCopyWith<$Res> get other;
  @override
  $ProfileCopyWith<$Res>? get me;
}

/// @nodoc
class __$$_ChatCopyWithImpl<$Res> extends _$ChatCopyWithImpl<$Res, _$_Chat>
    implements _$$_ChatCopyWith<$Res> {
  __$$_ChatCopyWithImpl(_$_Chat _value, $Res Function(_$_Chat) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? other = null,
    Object? firstMessage = null,
    Object? me = freezed,
    Object? messages = freezed,
  }) {
    return _then(_$_Chat(
      other: null == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as Profile,
      firstMessage: null == firstMessage
          ? _value.firstMessage
          : firstMessage // ignore: cast_nullable_to_non_nullable
              as String,
      me: freezed == me
          ? _value.me
          : me // ignore: cast_nullable_to_non_nullable
              as Profile?,
      messages: freezed == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>?,
    ));
  }
}

/// @nodoc

class _$_Chat implements _Chat {
  _$_Chat(
      {required this.other,
      this.firstMessage = "",
      this.me,
      final List<Message>? messages})
      : _messages = messages;

  @override
  final Profile other;
  @override
  @JsonKey()
  final String firstMessage;
  @override
  final Profile? me;
  final List<Message>? _messages;
  @override
  List<Message>? get messages {
    final value = _messages;
    if (value == null) return null;
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Chat(other: $other, firstMessage: $firstMessage, me: $me, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Chat &&
            (identical(other.other, this.other) || other.other == this.other) &&
            (identical(other.firstMessage, firstMessage) ||
                other.firstMessage == firstMessage) &&
            (identical(other.me, me) || other.me == me) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(runtimeType, other, firstMessage, me,
      const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatCopyWith<_$_Chat> get copyWith =>
      __$$_ChatCopyWithImpl<_$_Chat>(this, _$identity);
}

abstract class _Chat implements Chat {
  factory _Chat(
      {required final Profile other,
      final String firstMessage,
      final Profile? me,
      final List<Message>? messages}) = _$_Chat;

  @override
  Profile get other;
  @override
  String get firstMessage;
  @override
  Profile? get me;
  @override
  List<Message>? get messages;
  @override
  @JsonKey(ignore: true)
  _$$_ChatCopyWith<_$_Chat> get copyWith => throw _privateConstructorUsedError;
}
