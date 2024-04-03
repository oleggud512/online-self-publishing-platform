// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookScreenState {
  Book get book => throw _privateConstructorUsedError;
  bool get isMy => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookScreenStateCopyWith<BookScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookScreenStateCopyWith<$Res> {
  factory $BookScreenStateCopyWith(
          BookScreenState value, $Res Function(BookScreenState) then) =
      _$BookScreenStateCopyWithImpl<$Res, BookScreenState>;
  @useResult
  $Res call({Book book, bool isMy});

  $BookCopyWith<$Res> get book;
}

/// @nodoc
class _$BookScreenStateCopyWithImpl<$Res, $Val extends BookScreenState>
    implements $BookScreenStateCopyWith<$Res> {
  _$BookScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book = null,
    Object? isMy = null,
  }) {
    return _then(_value.copyWith(
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
      isMy: null == isMy
          ? _value.isMy
          : isMy // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BookCopyWith<$Res> get book {
    return $BookCopyWith<$Res>(_value.book, (value) {
      return _then(_value.copyWith(book: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookScreenStateImplCopyWith<$Res>
    implements $BookScreenStateCopyWith<$Res> {
  factory _$$BookScreenStateImplCopyWith(_$BookScreenStateImpl value,
          $Res Function(_$BookScreenStateImpl) then) =
      __$$BookScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Book book, bool isMy});

  @override
  $BookCopyWith<$Res> get book;
}

/// @nodoc
class __$$BookScreenStateImplCopyWithImpl<$Res>
    extends _$BookScreenStateCopyWithImpl<$Res, _$BookScreenStateImpl>
    implements _$$BookScreenStateImplCopyWith<$Res> {
  __$$BookScreenStateImplCopyWithImpl(
      _$BookScreenStateImpl _value, $Res Function(_$BookScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book = null,
    Object? isMy = null,
  }) {
    return _then(_$BookScreenStateImpl(
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
      isMy: null == isMy
          ? _value.isMy
          : isMy // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BookScreenStateImpl implements _BookScreenState {
  _$BookScreenStateImpl({required this.book, this.isMy = false});

  @override
  final Book book;
  @override
  @JsonKey()
  final bool isMy;

  @override
  String toString() {
    return 'BookScreenState(book: $book, isMy: $isMy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookScreenStateImpl &&
            (identical(other.book, book) || other.book == book) &&
            (identical(other.isMy, isMy) || other.isMy == isMy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, book, isMy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookScreenStateImplCopyWith<_$BookScreenStateImpl> get copyWith =>
      __$$BookScreenStateImplCopyWithImpl<_$BookScreenStateImpl>(
          this, _$identity);
}

abstract class _BookScreenState implements BookScreenState {
  factory _BookScreenState({required final Book book, final bool isMy}) =
      _$BookScreenStateImpl;

  @override
  Book get book;
  @override
  bool get isMy;
  @override
  @JsonKey(ignore: true)
  _$$BookScreenStateImplCopyWith<_$BookScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
