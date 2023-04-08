// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChapterScreenState {
  Chapter get chapter => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChapterScreenStateCopyWith<ChapterScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterScreenStateCopyWith<$Res> {
  factory $ChapterScreenStateCopyWith(
          ChapterScreenState value, $Res Function(ChapterScreenState) then) =
      _$ChapterScreenStateCopyWithImpl<$Res, ChapterScreenState>;
  @useResult
  $Res call({Chapter chapter, String? next, String? previous});

  $ChapterCopyWith<$Res> get chapter;
}

/// @nodoc
class _$ChapterScreenStateCopyWithImpl<$Res, $Val extends ChapterScreenState>
    implements $ChapterScreenStateCopyWith<$Res> {
  _$ChapterScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chapter = null,
    Object? next = freezed,
    Object? previous = freezed,
  }) {
    return _then(_value.copyWith(
      chapter: null == chapter
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as Chapter,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChapterCopyWith<$Res> get chapter {
    return $ChapterCopyWith<$Res>(_value.chapter, (value) {
      return _then(_value.copyWith(chapter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChapterScreenStateCopyWith<$Res>
    implements $ChapterScreenStateCopyWith<$Res> {
  factory _$$_ChapterScreenStateCopyWith(_$_ChapterScreenState value,
          $Res Function(_$_ChapterScreenState) then) =
      __$$_ChapterScreenStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Chapter chapter, String? next, String? previous});

  @override
  $ChapterCopyWith<$Res> get chapter;
}

/// @nodoc
class __$$_ChapterScreenStateCopyWithImpl<$Res>
    extends _$ChapterScreenStateCopyWithImpl<$Res, _$_ChapterScreenState>
    implements _$$_ChapterScreenStateCopyWith<$Res> {
  __$$_ChapterScreenStateCopyWithImpl(
      _$_ChapterScreenState _value, $Res Function(_$_ChapterScreenState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chapter = null,
    Object? next = freezed,
    Object? previous = freezed,
  }) {
    return _then(_$_ChapterScreenState(
      chapter: null == chapter
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as Chapter,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_ChapterScreenState implements _ChapterScreenState {
  _$_ChapterScreenState({required this.chapter, this.next, this.previous});

  @override
  final Chapter chapter;
  @override
  final String? next;
  @override
  final String? previous;

  @override
  String toString() {
    return 'ChapterScreenState(chapter: $chapter, next: $next, previous: $previous)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChapterScreenState &&
            (identical(other.chapter, chapter) || other.chapter == chapter) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chapter, next, previous);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChapterScreenStateCopyWith<_$_ChapterScreenState> get copyWith =>
      __$$_ChapterScreenStateCopyWithImpl<_$_ChapterScreenState>(
          this, _$identity);
}

abstract class _ChapterScreenState implements ChapterScreenState {
  factory _ChapterScreenState(
      {required final Chapter chapter,
      final String? next,
      final String? previous}) = _$_ChapterScreenState;

  @override
  Chapter get chapter;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  @JsonKey(ignore: true)
  _$$_ChapterScreenStateCopyWith<_$_ChapterScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
