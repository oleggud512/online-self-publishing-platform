// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comments_widget_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CommentsWidgetState {
  List<Comment> get comments => throw _privateConstructorUsedError;
  String get sorting => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommentsWidgetStateCopyWith<CommentsWidgetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsWidgetStateCopyWith<$Res> {
  factory $CommentsWidgetStateCopyWith(
          CommentsWidgetState value, $Res Function(CommentsWidgetState) then) =
      _$CommentsWidgetStateCopyWithImpl<$Res, CommentsWidgetState>;
  @useResult
  $Res call({List<Comment> comments, String sorting});
}

/// @nodoc
class _$CommentsWidgetStateCopyWithImpl<$Res, $Val extends CommentsWidgetState>
    implements $CommentsWidgetStateCopyWith<$Res> {
  _$CommentsWidgetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comments = null,
    Object? sorting = null,
  }) {
    return _then(_value.copyWith(
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
      sorting: null == sorting
          ? _value.sorting
          : sorting // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentsWidgetStateImplCopyWith<$Res>
    implements $CommentsWidgetStateCopyWith<$Res> {
  factory _$$CommentsWidgetStateImplCopyWith(_$CommentsWidgetStateImpl value,
          $Res Function(_$CommentsWidgetStateImpl) then) =
      __$$CommentsWidgetStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Comment> comments, String sorting});
}

/// @nodoc
class __$$CommentsWidgetStateImplCopyWithImpl<$Res>
    extends _$CommentsWidgetStateCopyWithImpl<$Res, _$CommentsWidgetStateImpl>
    implements _$$CommentsWidgetStateImplCopyWith<$Res> {
  __$$CommentsWidgetStateImplCopyWithImpl(_$CommentsWidgetStateImpl _value,
      $Res Function(_$CommentsWidgetStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? comments = null,
    Object? sorting = null,
  }) {
    return _then(_$CommentsWidgetStateImpl(
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
      sorting: null == sorting
          ? _value.sorting
          : sorting // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CommentsWidgetStateImpl implements _CommentsWidgetState {
  _$CommentsWidgetStateImpl(
      {final List<Comment> comments = const [],
      this.sorting = CommentsSorting.nnew})
      : _comments = comments;

  final List<Comment> _comments;
  @override
  @JsonKey()
  List<Comment> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  @JsonKey()
  final String sorting;

  @override
  String toString() {
    return 'CommentsWidgetState(comments: $comments, sorting: $sorting)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentsWidgetStateImpl &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            (identical(other.sorting, sorting) || other.sorting == sorting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_comments), sorting);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentsWidgetStateImplCopyWith<_$CommentsWidgetStateImpl> get copyWith =>
      __$$CommentsWidgetStateImplCopyWithImpl<_$CommentsWidgetStateImpl>(
          this, _$identity);
}

abstract class _CommentsWidgetState implements CommentsWidgetState {
  factory _CommentsWidgetState(
      {final List<Comment> comments,
      final String sorting}) = _$CommentsWidgetStateImpl;

  @override
  List<Comment> get comments;
  @override
  String get sorting;
  @override
  @JsonKey(ignore: true)
  _$$CommentsWidgetStateImplCopyWith<_$CommentsWidgetStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
