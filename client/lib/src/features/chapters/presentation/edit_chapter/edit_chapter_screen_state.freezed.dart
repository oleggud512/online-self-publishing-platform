// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_chapter_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditChapterScreenState {
  Chapter get chapter => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditChapterScreenStateCopyWith<EditChapterScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditChapterScreenStateCopyWith<$Res> {
  factory $EditChapterScreenStateCopyWith(EditChapterScreenState value,
          $Res Function(EditChapterScreenState) then) =
      _$EditChapterScreenStateCopyWithImpl<$Res, EditChapterScreenState>;
  @useResult
  $Res call({Chapter chapter});

  $ChapterCopyWith<$Res> get chapter;
}

/// @nodoc
class _$EditChapterScreenStateCopyWithImpl<$Res,
        $Val extends EditChapterScreenState>
    implements $EditChapterScreenStateCopyWith<$Res> {
  _$EditChapterScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chapter = null,
  }) {
    return _then(_value.copyWith(
      chapter: null == chapter
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as Chapter,
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
abstract class _$$EditChapterScreenStateImplCopyWith<$Res>
    implements $EditChapterScreenStateCopyWith<$Res> {
  factory _$$EditChapterScreenStateImplCopyWith(
          _$EditChapterScreenStateImpl value,
          $Res Function(_$EditChapterScreenStateImpl) then) =
      __$$EditChapterScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Chapter chapter});

  @override
  $ChapterCopyWith<$Res> get chapter;
}

/// @nodoc
class __$$EditChapterScreenStateImplCopyWithImpl<$Res>
    extends _$EditChapterScreenStateCopyWithImpl<$Res,
        _$EditChapterScreenStateImpl>
    implements _$$EditChapterScreenStateImplCopyWith<$Res> {
  __$$EditChapterScreenStateImplCopyWithImpl(
      _$EditChapterScreenStateImpl _value,
      $Res Function(_$EditChapterScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chapter = null,
  }) {
    return _then(_$EditChapterScreenStateImpl(
      chapter: null == chapter
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as Chapter,
    ));
  }
}

/// @nodoc

class _$EditChapterScreenStateImpl implements _EditChapterScreenState {
  _$EditChapterScreenStateImpl({required this.chapter});

  @override
  final Chapter chapter;

  @override
  String toString() {
    return 'EditChapterScreenState(chapter: $chapter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditChapterScreenStateImpl &&
            (identical(other.chapter, chapter) || other.chapter == chapter));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chapter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditChapterScreenStateImplCopyWith<_$EditChapterScreenStateImpl>
      get copyWith => __$$EditChapterScreenStateImplCopyWithImpl<
          _$EditChapterScreenStateImpl>(this, _$identity);
}

abstract class _EditChapterScreenState implements EditChapterScreenState {
  factory _EditChapterScreenState({required final Chapter chapter}) =
      _$EditChapterScreenStateImpl;

  @override
  Chapter get chapter;
  @override
  @JsonKey(ignore: true)
  _$$EditChapterScreenStateImplCopyWith<_$EditChapterScreenStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
