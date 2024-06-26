// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'books_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BooksScreenState {
  AsyncValue<List<Book>> get books => throw _privateConstructorUsedError;
  Filters get filters => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BooksScreenStateCopyWith<BooksScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BooksScreenStateCopyWith<$Res> {
  factory $BooksScreenStateCopyWith(
          BooksScreenState value, $Res Function(BooksScreenState) then) =
      _$BooksScreenStateCopyWithImpl<$Res, BooksScreenState>;
  @useResult
  $Res call({AsyncValue<List<Book>> books, Filters filters});

  $FiltersCopyWith<$Res> get filters;
}

/// @nodoc
class _$BooksScreenStateCopyWithImpl<$Res, $Val extends BooksScreenState>
    implements $BooksScreenStateCopyWith<$Res> {
  _$BooksScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? books = null,
    Object? filters = null,
  }) {
    return _then(_value.copyWith(
      books: null == books
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Book>>,
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as Filters,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FiltersCopyWith<$Res> get filters {
    return $FiltersCopyWith<$Res>(_value.filters, (value) {
      return _then(_value.copyWith(filters: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BooksScreenStateImplCopyWith<$Res>
    implements $BooksScreenStateCopyWith<$Res> {
  factory _$$BooksScreenStateImplCopyWith(_$BooksScreenStateImpl value,
          $Res Function(_$BooksScreenStateImpl) then) =
      __$$BooksScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<List<Book>> books, Filters filters});

  @override
  $FiltersCopyWith<$Res> get filters;
}

/// @nodoc
class __$$BooksScreenStateImplCopyWithImpl<$Res>
    extends _$BooksScreenStateCopyWithImpl<$Res, _$BooksScreenStateImpl>
    implements _$$BooksScreenStateImplCopyWith<$Res> {
  __$$BooksScreenStateImplCopyWithImpl(_$BooksScreenStateImpl _value,
      $Res Function(_$BooksScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? books = null,
    Object? filters = null,
  }) {
    return _then(_$BooksScreenStateImpl(
      books: null == books
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Book>>,
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as Filters,
    ));
  }
}

/// @nodoc

class _$BooksScreenStateImpl implements _BooksScreenState {
  _$BooksScreenStateImpl(
      {this.books = const AsyncValue.loading(), required this.filters});

  @override
  @JsonKey()
  final AsyncValue<List<Book>> books;
  @override
  final Filters filters;

  @override
  String toString() {
    return 'BooksScreenState(books: $books, filters: $filters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BooksScreenStateImpl &&
            (identical(other.books, books) || other.books == books) &&
            (identical(other.filters, filters) || other.filters == filters));
  }

  @override
  int get hashCode => Object.hash(runtimeType, books, filters);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BooksScreenStateImplCopyWith<_$BooksScreenStateImpl> get copyWith =>
      __$$BooksScreenStateImplCopyWithImpl<_$BooksScreenStateImpl>(
          this, _$identity);
}

abstract class _BooksScreenState implements BooksScreenState {
  factory _BooksScreenState(
      {final AsyncValue<List<Book>> books,
      required final Filters filters}) = _$BooksScreenStateImpl;

  @override
  AsyncValue<List<Book>> get books;
  @override
  Filters get filters;
  @override
  @JsonKey(ignore: true)
  _$$BooksScreenStateImplCopyWith<_$BooksScreenStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
