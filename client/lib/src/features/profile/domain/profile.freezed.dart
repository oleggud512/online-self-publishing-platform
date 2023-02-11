// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  Gender? get gender => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(toJson: ignore, includeIfNull: false)
  int? get subscribers => throw _privateConstructorUsedError;
  @JsonKey(toJson: ignore, includeIfNull: false)
  int? get subscriptions => throw _privateConstructorUsedError;
  @JsonKey(toJson: ignore, includeIfNull: false)
  int? get booksCount => throw _privateConstructorUsedError;
  @JsonKey(toJson: ignore, includeIfNull: false)
  List<Book>? get books =>
      throw _privateConstructorUsedError; // подписан ли я на этого пользователя. Null, если я без аккаунта
  @JsonKey(toJson: ignore, includeIfNull: false)
  bool? get isSubscribed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String name,
      String? avatarUrl,
      String? displayName,
      String? description,
      int? age,
      Gender? gender,
      String email,
      @JsonKey(toJson: ignore, includeIfNull: false) int? subscribers,
      @JsonKey(toJson: ignore, includeIfNull: false) int? subscriptions,
      @JsonKey(toJson: ignore, includeIfNull: false) int? booksCount,
      @JsonKey(toJson: ignore, includeIfNull: false) List<Book>? books,
      @JsonKey(toJson: ignore, includeIfNull: false) bool? isSubscribed});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatarUrl = freezed,
    Object? displayName = freezed,
    Object? description = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? email = null,
    Object? subscribers = freezed,
    Object? subscriptions = freezed,
    Object? booksCount = freezed,
    Object? books = freezed,
    Object? isSubscribed = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      subscribers: freezed == subscribers
          ? _value.subscribers
          : subscribers // ignore: cast_nullable_to_non_nullable
              as int?,
      subscriptions: freezed == subscriptions
          ? _value.subscriptions
          : subscriptions // ignore: cast_nullable_to_non_nullable
              as int?,
      booksCount: freezed == booksCount
          ? _value.booksCount
          : booksCount // ignore: cast_nullable_to_non_nullable
              as int?,
      books: freezed == books
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>?,
      isSubscribed: freezed == isSubscribed
          ? _value.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$_ProfileCopyWith(
          _$_Profile value, $Res Function(_$_Profile) then) =
      __$$_ProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      String name,
      String? avatarUrl,
      String? displayName,
      String? description,
      int? age,
      Gender? gender,
      String email,
      @JsonKey(toJson: ignore, includeIfNull: false) int? subscribers,
      @JsonKey(toJson: ignore, includeIfNull: false) int? subscriptions,
      @JsonKey(toJson: ignore, includeIfNull: false) int? booksCount,
      @JsonKey(toJson: ignore, includeIfNull: false) List<Book>? books,
      @JsonKey(toJson: ignore, includeIfNull: false) bool? isSubscribed});
}

/// @nodoc
class __$$_ProfileCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$_Profile>
    implements _$$_ProfileCopyWith<$Res> {
  __$$_ProfileCopyWithImpl(_$_Profile _value, $Res Function(_$_Profile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatarUrl = freezed,
    Object? displayName = freezed,
    Object? description = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? email = null,
    Object? subscribers = freezed,
    Object? subscriptions = freezed,
    Object? booksCount = freezed,
    Object? books = freezed,
    Object? isSubscribed = freezed,
  }) {
    return _then(_$_Profile(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      subscribers: freezed == subscribers
          ? _value.subscribers
          : subscribers // ignore: cast_nullable_to_non_nullable
              as int?,
      subscriptions: freezed == subscriptions
          ? _value.subscriptions
          : subscriptions // ignore: cast_nullable_to_non_nullable
              as int?,
      booksCount: freezed == booksCount
          ? _value.booksCount
          : booksCount // ignore: cast_nullable_to_non_nullable
              as int?,
      books: freezed == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>?,
      isSubscribed: freezed == isSubscribed
          ? _value.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Profile implements _Profile {
  _$_Profile(
      {@JsonKey(name: "_id") this.id = "",
      this.name = "",
      this.avatarUrl,
      this.displayName,
      this.description,
      this.age,
      this.gender,
      this.email = "",
      @JsonKey(toJson: ignore, includeIfNull: false) this.subscribers,
      @JsonKey(toJson: ignore, includeIfNull: false) this.subscriptions,
      @JsonKey(toJson: ignore, includeIfNull: false) this.booksCount,
      @JsonKey(toJson: ignore, includeIfNull: false) final List<Book>? books,
      @JsonKey(toJson: ignore, includeIfNull: false) this.isSubscribed})
      : _books = books;

  factory _$_Profile.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  final String? avatarUrl;
  @override
  final String? displayName;
  @override
  final String? description;
  @override
  final int? age;
  @override
  final Gender? gender;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  final int? subscribers;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  final int? subscriptions;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  final int? booksCount;
  final List<Book>? _books;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  List<Book>? get books {
    final value = _books;
    if (value == null) return null;
    if (_books is EqualUnmodifiableListView) return _books;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// подписан ли я на этого пользователя. Null, если я без аккаунта
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  final bool? isSubscribed;

  @override
  String toString() {
    return 'Profile(id: $id, name: $name, avatarUrl: $avatarUrl, displayName: $displayName, description: $description, age: $age, gender: $gender, email: $email, subscribers: $subscribers, subscriptions: $subscriptions, booksCount: $booksCount, books: $books, isSubscribed: $isSubscribed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Profile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.subscribers, subscribers) ||
                other.subscribers == subscribers) &&
            (identical(other.subscriptions, subscriptions) ||
                other.subscriptions == subscriptions) &&
            (identical(other.booksCount, booksCount) ||
                other.booksCount == booksCount) &&
            const DeepCollectionEquality().equals(other._books, _books) &&
            (identical(other.isSubscribed, isSubscribed) ||
                other.isSubscribed == isSubscribed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      avatarUrl,
      displayName,
      description,
      age,
      gender,
      email,
      subscribers,
      subscriptions,
      booksCount,
      const DeepCollectionEquality().hash(_books),
      isSubscribed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileCopyWith<_$_Profile> get copyWith =>
      __$$_ProfileCopyWithImpl<_$_Profile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileToJson(
      this,
    );
  }
}

abstract class _Profile implements Profile {
  factory _Profile(
      {@JsonKey(name: "_id")
          final String id,
      final String name,
      final String? avatarUrl,
      final String? displayName,
      final String? description,
      final int? age,
      final Gender? gender,
      final String email,
      @JsonKey(toJson: ignore, includeIfNull: false)
          final int? subscribers,
      @JsonKey(toJson: ignore, includeIfNull: false)
          final int? subscriptions,
      @JsonKey(toJson: ignore, includeIfNull: false)
          final int? booksCount,
      @JsonKey(toJson: ignore, includeIfNull: false)
          final List<Book>? books,
      @JsonKey(toJson: ignore, includeIfNull: false)
          final bool? isSubscribed}) = _$_Profile;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$_Profile.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  String get name;
  @override
  String? get avatarUrl;
  @override
  String? get displayName;
  @override
  String? get description;
  @override
  int? get age;
  @override
  Gender? get gender;
  @override
  String get email;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  int? get subscribers;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  int? get subscriptions;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  int? get booksCount;
  @override
  @JsonKey(toJson: ignore, includeIfNull: false)
  List<Book>? get books;
  @override // подписан ли я на этого пользователя. Null, если я без аккаунта
  @JsonKey(toJson: ignore, includeIfNull: false)
  bool? get isSubscribed;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileCopyWith<_$_Profile> get copyWith =>
      throw _privateConstructorUsedError;
}
