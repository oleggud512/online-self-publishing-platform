// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_list_item_widget_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookListItemWidgetState {
  Book get book => throw _privateConstructorUsedError;
  bool get isMy => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookListItemWidgetStateCopyWith<BookListItemWidgetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookListItemWidgetStateCopyWith<$Res> {
  factory $BookListItemWidgetStateCopyWith(BookListItemWidgetState value,
          $Res Function(BookListItemWidgetState) then) =
      _$BookListItemWidgetStateCopyWithImpl<$Res, BookListItemWidgetState>;
  @useResult
  $Res call({Book book, bool isMy});

  $BookCopyWith<$Res> get book;
}

/// @nodoc
class _$BookListItemWidgetStateCopyWithImpl<$Res,
        $Val extends BookListItemWidgetState>
    implements $BookListItemWidgetStateCopyWith<$Res> {
  _$BookListItemWidgetStateCopyWithImpl(this._value, this._then);

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
abstract class _$$BookListItemWidgetStateImplCopyWith<$Res>
    implements $BookListItemWidgetStateCopyWith<$Res> {
  factory _$$BookListItemWidgetStateImplCopyWith(
          _$BookListItemWidgetStateImpl value,
          $Res Function(_$BookListItemWidgetStateImpl) then) =
      __$$BookListItemWidgetStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Book book, bool isMy});

  @override
  $BookCopyWith<$Res> get book;
}

/// @nodoc
class __$$BookListItemWidgetStateImplCopyWithImpl<$Res>
    extends _$BookListItemWidgetStateCopyWithImpl<$Res,
        _$BookListItemWidgetStateImpl>
    implements _$$BookListItemWidgetStateImplCopyWith<$Res> {
  __$$BookListItemWidgetStateImplCopyWithImpl(
      _$BookListItemWidgetStateImpl _value,
      $Res Function(_$BookListItemWidgetStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? book = null,
    Object? isMy = null,
  }) {
    return _then(_$BookListItemWidgetStateImpl(
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

class _$BookListItemWidgetStateImpl implements _BookListItemWidgetState {
  _$BookListItemWidgetStateImpl({required this.book, this.isMy = false});

  @override
  final Book book;
  @override
  @JsonKey()
  final bool isMy;

  @override
  String toString() {
    return 'BookListItemWidgetState(book: $book, isMy: $isMy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookListItemWidgetStateImpl &&
            (identical(other.book, book) || other.book == book) &&
            (identical(other.isMy, isMy) || other.isMy == isMy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, book, isMy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookListItemWidgetStateImplCopyWith<_$BookListItemWidgetStateImpl>
      get copyWith => __$$BookListItemWidgetStateImplCopyWithImpl<
          _$BookListItemWidgetStateImpl>(this, _$identity);
}

abstract class _BookListItemWidgetState implements BookListItemWidgetState {
  factory _BookListItemWidgetState(
      {required final Book book,
      final bool isMy}) = _$BookListItemWidgetStateImpl;

  @override
  Book get book;
  @override
  bool get isMy;
  @override
  @JsonKey(ignore: true)
  _$$BookListItemWidgetStateImplCopyWith<_$BookListItemWidgetStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
