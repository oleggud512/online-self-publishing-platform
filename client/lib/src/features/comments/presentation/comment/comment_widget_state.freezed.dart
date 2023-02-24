// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_widget_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CommentWidgetState {
  Comment get comment => throw _privateConstructorUsedError;
  dynamic get isFieldShown => throw _privateConstructorUsedError;
  String get fieldState => throw _privateConstructorUsedError;
  bool get isEdit => throw _privateConstructorUsedError;
  String get editState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentWidgetStateCopyWith<CommentWidgetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentWidgetStateCopyWith<$Res> {
  factory $CommentWidgetStateCopyWith(
          CommentWidgetState value, $Res Function(CommentWidgetState) then) =
      _$CommentWidgetStateCopyWithImpl<$Res, CommentWidgetState>;
  @useResult
  $Res call(
      {Comment comment,
      dynamic isFieldShown,
      String fieldState,
      bool isEdit,
      String editState});

  $CommentCopyWith<$Res> get comment;
}

/// @nodoc
class _$CommentWidgetStateCopyWithImpl<$Res, $Val extends CommentWidgetState>
    implements $CommentWidgetStateCopyWith<$Res> {
  _$CommentWidgetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? isFieldShown = freezed,
    Object? fieldState = null,
    Object? isEdit = null,
    Object? editState = null,
  }) {
    return _then(_value.copyWith(
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as Comment,
      isFieldShown: freezed == isFieldShown
          ? _value.isFieldShown
          : isFieldShown // ignore: cast_nullable_to_non_nullable
              as dynamic,
      fieldState: null == fieldState
          ? _value.fieldState
          : fieldState // ignore: cast_nullable_to_non_nullable
              as String,
      isEdit: null == isEdit
          ? _value.isEdit
          : isEdit // ignore: cast_nullable_to_non_nullable
              as bool,
      editState: null == editState
          ? _value.editState
          : editState // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CommentCopyWith<$Res> get comment {
    return $CommentCopyWith<$Res>(_value.comment, (value) {
      return _then(_value.copyWith(comment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CommentWidgetStateCopyWith<$Res>
    implements $CommentWidgetStateCopyWith<$Res> {
  factory _$$_CommentWidgetStateCopyWith(_$_CommentWidgetState value,
          $Res Function(_$_CommentWidgetState) then) =
      __$$_CommentWidgetStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Comment comment,
      dynamic isFieldShown,
      String fieldState,
      bool isEdit,
      String editState});

  @override
  $CommentCopyWith<$Res> get comment;
}

/// @nodoc
class __$$_CommentWidgetStateCopyWithImpl<$Res>
    extends _$CommentWidgetStateCopyWithImpl<$Res, _$_CommentWidgetState>
    implements _$$_CommentWidgetStateCopyWith<$Res> {
  __$$_CommentWidgetStateCopyWithImpl(
      _$_CommentWidgetState _value, $Res Function(_$_CommentWidgetState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comment = null,
    Object? isFieldShown = freezed,
    Object? fieldState = null,
    Object? isEdit = null,
    Object? editState = null,
  }) {
    return _then(_$_CommentWidgetState(
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as Comment,
      isFieldShown:
          freezed == isFieldShown ? _value.isFieldShown! : isFieldShown,
      fieldState: null == fieldState
          ? _value.fieldState
          : fieldState // ignore: cast_nullable_to_non_nullable
              as String,
      isEdit: null == isEdit
          ? _value.isEdit
          : isEdit // ignore: cast_nullable_to_non_nullable
              as bool,
      editState: null == editState
          ? _value.editState
          : editState // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CommentWidgetState implements _CommentWidgetState {
  _$_CommentWidgetState(
      {required this.comment,
      this.isFieldShown = false,
      this.fieldState = "",
      this.isEdit = false,
      this.editState = ""});

  @override
  final Comment comment;
  @override
  @JsonKey()
  final dynamic isFieldShown;
  @override
  @JsonKey()
  final String fieldState;
  @override
  @JsonKey()
  final bool isEdit;
  @override
  @JsonKey()
  final String editState;

  @override
  String toString() {
    return 'CommentWidgetState(comment: $comment, isFieldShown: $isFieldShown, fieldState: $fieldState, isEdit: $isEdit, editState: $editState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentWidgetState &&
            (identical(other.comment, comment) || other.comment == comment) &&
            const DeepCollectionEquality()
                .equals(other.isFieldShown, isFieldShown) &&
            (identical(other.fieldState, fieldState) ||
                other.fieldState == fieldState) &&
            (identical(other.isEdit, isEdit) || other.isEdit == isEdit) &&
            (identical(other.editState, editState) ||
                other.editState == editState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      comment,
      const DeepCollectionEquality().hash(isFieldShown),
      fieldState,
      isEdit,
      editState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentWidgetStateCopyWith<_$_CommentWidgetState> get copyWith =>
      __$$_CommentWidgetStateCopyWithImpl<_$_CommentWidgetState>(
          this, _$identity);
}

abstract class _CommentWidgetState implements CommentWidgetState {
  factory _CommentWidgetState(
      {required final Comment comment,
      final dynamic isFieldShown,
      final String fieldState,
      final bool isEdit,
      final String editState}) = _$_CommentWidgetState;

  @override
  Comment get comment;
  @override
  dynamic get isFieldShown;
  @override
  String get fieldState;
  @override
  bool get isEdit;
  @override
  String get editState;
  @override
  @JsonKey(ignore: true)
  _$$_CommentWidgetStateCopyWith<_$_CommentWidgetState> get copyWith =>
      throw _privateConstructorUsedError;
}
