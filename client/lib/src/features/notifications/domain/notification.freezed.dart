// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyNotification _$MyNotificationFromJson(Map<String, dynamic> json) {
  switch (json['notificationType']) {
    case 'newChapter':
      return NewChapterNotification.fromJson(json);
    case 'bookUnpublished':
      return BookUnpublishedNotification.fromJson(json);
    case 'reportRejected':
      return ReportRejectedNotification.fromJson(json);
    case 'subscribed':
      return SubscribedNotification.fromJson(json);
    case 'commentAnswer':
      return CommentAnswerNotification.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'notificationType', 'MyNotification',
          'Invalid union type "${json['notificationType']}"!');
  }
}

/// @nodoc
mixin _$MyNotification {
  String get notificationType => throw _privateConstructorUsedError;
  String get localId => throw _privateConstructorUsedError;
  String get messageId => throw _privateConstructorUsedError;
  @intDate
  DateTime get sentTime => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String? book,
            String? bookId,
            String? chapter,
            String? chapterId)
        newChapter,
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String? book,
            String? bookId)
        bookUnpublished,
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            String subjectId)
        reportRejected,
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String profile,
            String profileId)
        subscribed,
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            int depth)
        commentAnswer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String? book,
            String? bookId,
            String? chapter,
            String? chapterId)?
        newChapter,
    TResult? Function(String notificationType, String localId, String messageId,
            @intDate DateTime sentTime, String? book, String? bookId)?
        bookUnpublished,
    TResult? Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            String subjectId)?
        reportRejected,
    TResult? Function(String notificationType, String localId, String messageId,
            @intDate DateTime sentTime, String profile, String profileId)?
        subscribed,
    TResult? Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            int depth)?
        commentAnswer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String? book,
            String? bookId,
            String? chapter,
            String? chapterId)?
        newChapter,
    TResult Function(String notificationType, String localId, String messageId,
            @intDate DateTime sentTime, String? book, String? bookId)?
        bookUnpublished,
    TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            String subjectId)?
        reportRejected,
    TResult Function(String notificationType, String localId, String messageId,
            @intDate DateTime sentTime, String profile, String profileId)?
        subscribed,
    TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            int depth)?
        commentAnswer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewChapterNotification value) newChapter,
    required TResult Function(BookUnpublishedNotification value)
        bookUnpublished,
    required TResult Function(ReportRejectedNotification value) reportRejected,
    required TResult Function(SubscribedNotification value) subscribed,
    required TResult Function(CommentAnswerNotification value) commentAnswer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewChapterNotification value)? newChapter,
    TResult? Function(BookUnpublishedNotification value)? bookUnpublished,
    TResult? Function(ReportRejectedNotification value)? reportRejected,
    TResult? Function(SubscribedNotification value)? subscribed,
    TResult? Function(CommentAnswerNotification value)? commentAnswer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewChapterNotification value)? newChapter,
    TResult Function(BookUnpublishedNotification value)? bookUnpublished,
    TResult Function(ReportRejectedNotification value)? reportRejected,
    TResult Function(SubscribedNotification value)? subscribed,
    TResult Function(CommentAnswerNotification value)? commentAnswer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyNotificationCopyWith<MyNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyNotificationCopyWith<$Res> {
  factory $MyNotificationCopyWith(
          MyNotification value, $Res Function(MyNotification) then) =
      _$MyNotificationCopyWithImpl<$Res, MyNotification>;
  @useResult
  $Res call(
      {String notificationType,
      String localId,
      String messageId,
      @intDate DateTime sentTime});
}

/// @nodoc
class _$MyNotificationCopyWithImpl<$Res, $Val extends MyNotification>
    implements $MyNotificationCopyWith<$Res> {
  _$MyNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationType = null,
    Object? localId = null,
    Object? messageId = null,
    Object? sentTime = null,
  }) {
    return _then(_value.copyWith(
      notificationType: null == notificationType
          ? _value.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
              as String,
      localId: null == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      sentTime: null == sentTime
          ? _value.sentTime
          : sentTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewChapterNotificationCopyWith<$Res>
    implements $MyNotificationCopyWith<$Res> {
  factory _$$NewChapterNotificationCopyWith(_$NewChapterNotification value,
          $Res Function(_$NewChapterNotification) then) =
      __$$NewChapterNotificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String notificationType,
      String localId,
      String messageId,
      @intDate DateTime sentTime,
      String? book,
      String? bookId,
      String? chapter,
      String? chapterId});
}

/// @nodoc
class __$$NewChapterNotificationCopyWithImpl<$Res>
    extends _$MyNotificationCopyWithImpl<$Res, _$NewChapterNotification>
    implements _$$NewChapterNotificationCopyWith<$Res> {
  __$$NewChapterNotificationCopyWithImpl(_$NewChapterNotification _value,
      $Res Function(_$NewChapterNotification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationType = null,
    Object? localId = null,
    Object? messageId = null,
    Object? sentTime = null,
    Object? book = freezed,
    Object? bookId = freezed,
    Object? chapter = freezed,
    Object? chapterId = freezed,
  }) {
    return _then(_$NewChapterNotification(
      notificationType: null == notificationType
          ? _value.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
              as String,
      localId: null == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      sentTime: null == sentTime
          ? _value.sentTime
          : sentTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      book: freezed == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as String?,
      bookId: freezed == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String?,
      chapter: freezed == chapter
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as String?,
      chapterId: freezed == chapterId
          ? _value.chapterId
          : chapterId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewChapterNotification implements NewChapterNotification {
  _$NewChapterNotification(
      {required this.notificationType,
      this.localId = "",
      this.messageId = "",
      @intDate required this.sentTime,
      this.book,
      this.bookId,
      this.chapter,
      this.chapterId});

  factory _$NewChapterNotification.fromJson(Map<String, dynamic> json) =>
      _$$NewChapterNotificationFromJson(json);

  @override
  final String notificationType;
  @override
  @JsonKey()
  final String localId;
  @override
  @JsonKey()
  final String messageId;
  @override
  @intDate
  final DateTime sentTime;
  @override
  final String? book;
  @override
  final String? bookId;
  @override
  final String? chapter;
  @override
  final String? chapterId;

  @override
  String toString() {
    return 'MyNotification.newChapter(notificationType: $notificationType, localId: $localId, messageId: $messageId, sentTime: $sentTime, book: $book, bookId: $bookId, chapter: $chapter, chapterId: $chapterId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewChapterNotification &&
            (identical(other.notificationType, notificationType) ||
                other.notificationType == notificationType) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.sentTime, sentTime) ||
                other.sentTime == sentTime) &&
            (identical(other.book, book) || other.book == book) &&
            (identical(other.bookId, bookId) || other.bookId == bookId) &&
            (identical(other.chapter, chapter) || other.chapter == chapter) &&
            (identical(other.chapterId, chapterId) ||
                other.chapterId == chapterId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, notificationType, localId,
      messageId, sentTime, book, bookId, chapter, chapterId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewChapterNotificationCopyWith<_$NewChapterNotification> get copyWith =>
      __$$NewChapterNotificationCopyWithImpl<_$NewChapterNotification>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String? book,
            String? bookId,
            String? chapter,
            String? chapterId)
        newChapter,
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String? book,
            String? bookId)
        bookUnpublished,
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            String subjectId)
        reportRejected,
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String profile,
            String profileId)
        subscribed,
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            int depth)
        commentAnswer,
  }) {
    return newChapter(notificationType, localId, messageId, sentTime, book,
        bookId, chapter, chapterId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String? book,
            String? bookId,
            String? chapter,
            String? chapterId)?
        newChapter,
    TResult? Function(String notificationType, String localId, String messageId,
            @intDate DateTime sentTime, String? book, String? bookId)?
        bookUnpublished,
    TResult? Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            String subjectId)?
        reportRejected,
    TResult? Function(String notificationType, String localId, String messageId,
            @intDate DateTime sentTime, String profile, String profileId)?
        subscribed,
    TResult? Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            int depth)?
        commentAnswer,
  }) {
    return newChapter?.call(notificationType, localId, messageId, sentTime,
        book, bookId, chapter, chapterId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String? book,
            String? bookId,
            String? chapter,
            String? chapterId)?
        newChapter,
    TResult Function(String notificationType, String localId, String messageId,
            @intDate DateTime sentTime, String? book, String? bookId)?
        bookUnpublished,
    TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            String subjectId)?
        reportRejected,
    TResult Function(String notificationType, String localId, String messageId,
            @intDate DateTime sentTime, String profile, String profileId)?
        subscribed,
    TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            int depth)?
        commentAnswer,
    required TResult orElse(),
  }) {
    if (newChapter != null) {
      return newChapter(notificationType, localId, messageId, sentTime, book,
          bookId, chapter, chapterId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewChapterNotification value) newChapter,
    required TResult Function(BookUnpublishedNotification value)
        bookUnpublished,
    required TResult Function(ReportRejectedNotification value) reportRejected,
    required TResult Function(SubscribedNotification value) subscribed,
    required TResult Function(CommentAnswerNotification value) commentAnswer,
  }) {
    return newChapter(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewChapterNotification value)? newChapter,
    TResult? Function(BookUnpublishedNotification value)? bookUnpublished,
    TResult? Function(ReportRejectedNotification value)? reportRejected,
    TResult? Function(SubscribedNotification value)? subscribed,
    TResult? Function(CommentAnswerNotification value)? commentAnswer,
  }) {
    return newChapter?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewChapterNotification value)? newChapter,
    TResult Function(BookUnpublishedNotification value)? bookUnpublished,
    TResult Function(ReportRejectedNotification value)? reportRejected,
    TResult Function(SubscribedNotification value)? subscribed,
    TResult Function(CommentAnswerNotification value)? commentAnswer,
    required TResult orElse(),
  }) {
    if (newChapter != null) {
      return newChapter(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NewChapterNotificationToJson(
      this,
    );
  }
}

abstract class NewChapterNotification implements MyNotification {
  factory NewChapterNotification(
      {required final String notificationType,
      final String localId,
      final String messageId,
      @intDate required final DateTime sentTime,
      final String? book,
      final String? bookId,
      final String? chapter,
      final String? chapterId}) = _$NewChapterNotification;

  factory NewChapterNotification.fromJson(Map<String, dynamic> json) =
      _$NewChapterNotification.fromJson;

  @override
  String get notificationType;
  @override
  String get localId;
  @override
  String get messageId;
  @override
  @intDate
  DateTime get sentTime;
  String? get book;
  String? get bookId;
  String? get chapter;
  String? get chapterId;
  @override
  @JsonKey(ignore: true)
  _$$NewChapterNotificationCopyWith<_$NewChapterNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BookUnpublishedNotificationCopyWith<$Res>
    implements $MyNotificationCopyWith<$Res> {
  factory _$$BookUnpublishedNotificationCopyWith(
          _$BookUnpublishedNotification value,
          $Res Function(_$BookUnpublishedNotification) then) =
      __$$BookUnpublishedNotificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String notificationType,
      String localId,
      String messageId,
      @intDate DateTime sentTime,
      String? book,
      String? bookId});
}

/// @nodoc
class __$$BookUnpublishedNotificationCopyWithImpl<$Res>
    extends _$MyNotificationCopyWithImpl<$Res, _$BookUnpublishedNotification>
    implements _$$BookUnpublishedNotificationCopyWith<$Res> {
  __$$BookUnpublishedNotificationCopyWithImpl(
      _$BookUnpublishedNotification _value,
      $Res Function(_$BookUnpublishedNotification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationType = null,
    Object? localId = null,
    Object? messageId = null,
    Object? sentTime = null,
    Object? book = freezed,
    Object? bookId = freezed,
  }) {
    return _then(_$BookUnpublishedNotification(
      notificationType: null == notificationType
          ? _value.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
              as String,
      localId: null == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      sentTime: null == sentTime
          ? _value.sentTime
          : sentTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      book: freezed == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as String?,
      bookId: freezed == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookUnpublishedNotification implements BookUnpublishedNotification {
  _$BookUnpublishedNotification(
      {required this.notificationType,
      this.localId = "",
      this.messageId = "",
      @intDate required this.sentTime,
      this.book,
      this.bookId});

  factory _$BookUnpublishedNotification.fromJson(Map<String, dynamic> json) =>
      _$$BookUnpublishedNotificationFromJson(json);

  @override
  final String notificationType;
  @override
  @JsonKey()
  final String localId;
  @override
  @JsonKey()
  final String messageId;
  @override
  @intDate
  final DateTime sentTime;
  @override
  final String? book;
  @override
  final String? bookId;

  @override
  String toString() {
    return 'MyNotification.bookUnpublished(notificationType: $notificationType, localId: $localId, messageId: $messageId, sentTime: $sentTime, book: $book, bookId: $bookId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookUnpublishedNotification &&
            (identical(other.notificationType, notificationType) ||
                other.notificationType == notificationType) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.sentTime, sentTime) ||
                other.sentTime == sentTime) &&
            (identical(other.book, book) || other.book == book) &&
            (identical(other.bookId, bookId) || other.bookId == bookId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, notificationType, localId,
      messageId, sentTime, book, bookId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookUnpublishedNotificationCopyWith<_$BookUnpublishedNotification>
      get copyWith => __$$BookUnpublishedNotificationCopyWithImpl<
          _$BookUnpublishedNotification>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String? book,
            String? bookId,
            String? chapter,
            String? chapterId)
        newChapter,
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String? book,
            String? bookId)
        bookUnpublished,
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            String subjectId)
        reportRejected,
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String profile,
            String profileId)
        subscribed,
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            int depth)
        commentAnswer,
  }) {
    return bookUnpublished(
        notificationType, localId, messageId, sentTime, book, bookId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String? book,
            String? bookId,
            String? chapter,
            String? chapterId)?
        newChapter,
    TResult? Function(String notificationType, String localId, String messageId,
            @intDate DateTime sentTime, String? book, String? bookId)?
        bookUnpublished,
    TResult? Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            String subjectId)?
        reportRejected,
    TResult? Function(String notificationType, String localId, String messageId,
            @intDate DateTime sentTime, String profile, String profileId)?
        subscribed,
    TResult? Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            int depth)?
        commentAnswer,
  }) {
    return bookUnpublished?.call(
        notificationType, localId, messageId, sentTime, book, bookId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String? book,
            String? bookId,
            String? chapter,
            String? chapterId)?
        newChapter,
    TResult Function(String notificationType, String localId, String messageId,
            @intDate DateTime sentTime, String? book, String? bookId)?
        bookUnpublished,
    TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            String subjectId)?
        reportRejected,
    TResult Function(String notificationType, String localId, String messageId,
            @intDate DateTime sentTime, String profile, String profileId)?
        subscribed,
    TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            int depth)?
        commentAnswer,
    required TResult orElse(),
  }) {
    if (bookUnpublished != null) {
      return bookUnpublished(
          notificationType, localId, messageId, sentTime, book, bookId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewChapterNotification value) newChapter,
    required TResult Function(BookUnpublishedNotification value)
        bookUnpublished,
    required TResult Function(ReportRejectedNotification value) reportRejected,
    required TResult Function(SubscribedNotification value) subscribed,
    required TResult Function(CommentAnswerNotification value) commentAnswer,
  }) {
    return bookUnpublished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewChapterNotification value)? newChapter,
    TResult? Function(BookUnpublishedNotification value)? bookUnpublished,
    TResult? Function(ReportRejectedNotification value)? reportRejected,
    TResult? Function(SubscribedNotification value)? subscribed,
    TResult? Function(CommentAnswerNotification value)? commentAnswer,
  }) {
    return bookUnpublished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewChapterNotification value)? newChapter,
    TResult Function(BookUnpublishedNotification value)? bookUnpublished,
    TResult Function(ReportRejectedNotification value)? reportRejected,
    TResult Function(SubscribedNotification value)? subscribed,
    TResult Function(CommentAnswerNotification value)? commentAnswer,
    required TResult orElse(),
  }) {
    if (bookUnpublished != null) {
      return bookUnpublished(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BookUnpublishedNotificationToJson(
      this,
    );
  }
}

abstract class BookUnpublishedNotification implements MyNotification {
  factory BookUnpublishedNotification(
      {required final String notificationType,
      final String localId,
      final String messageId,
      @intDate required final DateTime sentTime,
      final String? book,
      final String? bookId}) = _$BookUnpublishedNotification;

  factory BookUnpublishedNotification.fromJson(Map<String, dynamic> json) =
      _$BookUnpublishedNotification.fromJson;

  @override
  String get notificationType;
  @override
  String get localId;
  @override
  String get messageId;
  @override
  @intDate
  DateTime get sentTime;
  String? get book;
  String? get bookId;
  @override
  @JsonKey(ignore: true)
  _$$BookUnpublishedNotificationCopyWith<_$BookUnpublishedNotification>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReportRejectedNotificationCopyWith<$Res>
    implements $MyNotificationCopyWith<$Res> {
  factory _$$ReportRejectedNotificationCopyWith(
          _$ReportRejectedNotification value,
          $Res Function(_$ReportRejectedNotification) then) =
      __$$ReportRejectedNotificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String notificationType,
      String localId,
      String messageId,
      @intDate DateTime sentTime,
      String subject,
      String subjectName,
      String subjectId});
}

/// @nodoc
class __$$ReportRejectedNotificationCopyWithImpl<$Res>
    extends _$MyNotificationCopyWithImpl<$Res, _$ReportRejectedNotification>
    implements _$$ReportRejectedNotificationCopyWith<$Res> {
  __$$ReportRejectedNotificationCopyWithImpl(
      _$ReportRejectedNotification _value,
      $Res Function(_$ReportRejectedNotification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationType = null,
    Object? localId = null,
    Object? messageId = null,
    Object? sentTime = null,
    Object? subject = null,
    Object? subjectName = null,
    Object? subjectId = null,
  }) {
    return _then(_$ReportRejectedNotification(
      notificationType: null == notificationType
          ? _value.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
              as String,
      localId: null == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      sentTime: null == sentTime
          ? _value.sentTime
          : sentTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      subjectId: null == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportRejectedNotification implements ReportRejectedNotification {
  _$ReportRejectedNotification(
      {required this.notificationType,
      this.localId = "",
      this.messageId = "",
      @intDate required this.sentTime,
      required this.subject,
      required this.subjectName,
      required this.subjectId});

  factory _$ReportRejectedNotification.fromJson(Map<String, dynamic> json) =>
      _$$ReportRejectedNotificationFromJson(json);

  @override
  final String notificationType;
  @override
  @JsonKey()
  final String localId;
  @override
  @JsonKey()
  final String messageId;
  @override
  @intDate
  final DateTime sentTime;
  @override
  final String subject;
  @override
  final String subjectName;
  @override
  final String subjectId;

  @override
  String toString() {
    return 'MyNotification.reportRejected(notificationType: $notificationType, localId: $localId, messageId: $messageId, sentTime: $sentTime, subject: $subject, subjectName: $subjectName, subjectId: $subjectId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportRejectedNotification &&
            (identical(other.notificationType, notificationType) ||
                other.notificationType == notificationType) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.sentTime, sentTime) ||
                other.sentTime == sentTime) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName) &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, notificationType, localId,
      messageId, sentTime, subject, subjectName, subjectId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportRejectedNotificationCopyWith<_$ReportRejectedNotification>
      get copyWith => __$$ReportRejectedNotificationCopyWithImpl<
          _$ReportRejectedNotification>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String? book,
            String? bookId,
            String? chapter,
            String? chapterId)
        newChapter,
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String? book,
            String? bookId)
        bookUnpublished,
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            String subjectId)
        reportRejected,
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String profile,
            String profileId)
        subscribed,
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            int depth)
        commentAnswer,
  }) {
    return reportRejected(notificationType, localId, messageId, sentTime,
        subject, subjectName, subjectId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String? book,
            String? bookId,
            String? chapter,
            String? chapterId)?
        newChapter,
    TResult? Function(String notificationType, String localId, String messageId,
            @intDate DateTime sentTime, String? book, String? bookId)?
        bookUnpublished,
    TResult? Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            String subjectId)?
        reportRejected,
    TResult? Function(String notificationType, String localId, String messageId,
            @intDate DateTime sentTime, String profile, String profileId)?
        subscribed,
    TResult? Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            int depth)?
        commentAnswer,
  }) {
    return reportRejected?.call(notificationType, localId, messageId, sentTime,
        subject, subjectName, subjectId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String? book,
            String? bookId,
            String? chapter,
            String? chapterId)?
        newChapter,
    TResult Function(String notificationType, String localId, String messageId,
            @intDate DateTime sentTime, String? book, String? bookId)?
        bookUnpublished,
    TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            String subjectId)?
        reportRejected,
    TResult Function(String notificationType, String localId, String messageId,
            @intDate DateTime sentTime, String profile, String profileId)?
        subscribed,
    TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            int depth)?
        commentAnswer,
    required TResult orElse(),
  }) {
    if (reportRejected != null) {
      return reportRejected(notificationType, localId, messageId, sentTime,
          subject, subjectName, subjectId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewChapterNotification value) newChapter,
    required TResult Function(BookUnpublishedNotification value)
        bookUnpublished,
    required TResult Function(ReportRejectedNotification value) reportRejected,
    required TResult Function(SubscribedNotification value) subscribed,
    required TResult Function(CommentAnswerNotification value) commentAnswer,
  }) {
    return reportRejected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewChapterNotification value)? newChapter,
    TResult? Function(BookUnpublishedNotification value)? bookUnpublished,
    TResult? Function(ReportRejectedNotification value)? reportRejected,
    TResult? Function(SubscribedNotification value)? subscribed,
    TResult? Function(CommentAnswerNotification value)? commentAnswer,
  }) {
    return reportRejected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewChapterNotification value)? newChapter,
    TResult Function(BookUnpublishedNotification value)? bookUnpublished,
    TResult Function(ReportRejectedNotification value)? reportRejected,
    TResult Function(SubscribedNotification value)? subscribed,
    TResult Function(CommentAnswerNotification value)? commentAnswer,
    required TResult orElse(),
  }) {
    if (reportRejected != null) {
      return reportRejected(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportRejectedNotificationToJson(
      this,
    );
  }
}

abstract class ReportRejectedNotification implements MyNotification {
  factory ReportRejectedNotification(
      {required final String notificationType,
      final String localId,
      final String messageId,
      @intDate required final DateTime sentTime,
      required final String subject,
      required final String subjectName,
      required final String subjectId}) = _$ReportRejectedNotification;

  factory ReportRejectedNotification.fromJson(Map<String, dynamic> json) =
      _$ReportRejectedNotification.fromJson;

  @override
  String get notificationType;
  @override
  String get localId;
  @override
  String get messageId;
  @override
  @intDate
  DateTime get sentTime;
  String get subject;
  String get subjectName;
  String get subjectId;
  @override
  @JsonKey(ignore: true)
  _$$ReportRejectedNotificationCopyWith<_$ReportRejectedNotification>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubscribedNotificationCopyWith<$Res>
    implements $MyNotificationCopyWith<$Res> {
  factory _$$SubscribedNotificationCopyWith(_$SubscribedNotification value,
          $Res Function(_$SubscribedNotification) then) =
      __$$SubscribedNotificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String notificationType,
      String localId,
      String messageId,
      @intDate DateTime sentTime,
      String profile,
      String profileId});
}

/// @nodoc
class __$$SubscribedNotificationCopyWithImpl<$Res>
    extends _$MyNotificationCopyWithImpl<$Res, _$SubscribedNotification>
    implements _$$SubscribedNotificationCopyWith<$Res> {
  __$$SubscribedNotificationCopyWithImpl(_$SubscribedNotification _value,
      $Res Function(_$SubscribedNotification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationType = null,
    Object? localId = null,
    Object? messageId = null,
    Object? sentTime = null,
    Object? profile = null,
    Object? profileId = null,
  }) {
    return _then(_$SubscribedNotification(
      notificationType: null == notificationType
          ? _value.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
              as String,
      localId: null == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      sentTime: null == sentTime
          ? _value.sentTime
          : sentTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as String,
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscribedNotification implements SubscribedNotification {
  _$SubscribedNotification(
      {required this.notificationType,
      this.localId = "",
      this.messageId = "",
      @intDate required this.sentTime,
      required this.profile,
      required this.profileId});

  factory _$SubscribedNotification.fromJson(Map<String, dynamic> json) =>
      _$$SubscribedNotificationFromJson(json);

  @override
  final String notificationType;
  @override
  @JsonKey()
  final String localId;
  @override
  @JsonKey()
  final String messageId;
  @override
  @intDate
  final DateTime sentTime;
  @override
  final String profile;
  @override
  final String profileId;

  @override
  String toString() {
    return 'MyNotification.subscribed(notificationType: $notificationType, localId: $localId, messageId: $messageId, sentTime: $sentTime, profile: $profile, profileId: $profileId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscribedNotification &&
            (identical(other.notificationType, notificationType) ||
                other.notificationType == notificationType) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.sentTime, sentTime) ||
                other.sentTime == sentTime) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, notificationType, localId,
      messageId, sentTime, profile, profileId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscribedNotificationCopyWith<_$SubscribedNotification> get copyWith =>
      __$$SubscribedNotificationCopyWithImpl<_$SubscribedNotification>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String? book,
            String? bookId,
            String? chapter,
            String? chapterId)
        newChapter,
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String? book,
            String? bookId)
        bookUnpublished,
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            String subjectId)
        reportRejected,
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String profile,
            String profileId)
        subscribed,
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            int depth)
        commentAnswer,
  }) {
    return subscribed(
        notificationType, localId, messageId, sentTime, profile, profileId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String? book,
            String? bookId,
            String? chapter,
            String? chapterId)?
        newChapter,
    TResult? Function(String notificationType, String localId, String messageId,
            @intDate DateTime sentTime, String? book, String? bookId)?
        bookUnpublished,
    TResult? Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            String subjectId)?
        reportRejected,
    TResult? Function(String notificationType, String localId, String messageId,
            @intDate DateTime sentTime, String profile, String profileId)?
        subscribed,
    TResult? Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            int depth)?
        commentAnswer,
  }) {
    return subscribed?.call(
        notificationType, localId, messageId, sentTime, profile, profileId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String? book,
            String? bookId,
            String? chapter,
            String? chapterId)?
        newChapter,
    TResult Function(String notificationType, String localId, String messageId,
            @intDate DateTime sentTime, String? book, String? bookId)?
        bookUnpublished,
    TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            String subjectId)?
        reportRejected,
    TResult Function(String notificationType, String localId, String messageId,
            @intDate DateTime sentTime, String profile, String profileId)?
        subscribed,
    TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            int depth)?
        commentAnswer,
    required TResult orElse(),
  }) {
    if (subscribed != null) {
      return subscribed(
          notificationType, localId, messageId, sentTime, profile, profileId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewChapterNotification value) newChapter,
    required TResult Function(BookUnpublishedNotification value)
        bookUnpublished,
    required TResult Function(ReportRejectedNotification value) reportRejected,
    required TResult Function(SubscribedNotification value) subscribed,
    required TResult Function(CommentAnswerNotification value) commentAnswer,
  }) {
    return subscribed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewChapterNotification value)? newChapter,
    TResult? Function(BookUnpublishedNotification value)? bookUnpublished,
    TResult? Function(ReportRejectedNotification value)? reportRejected,
    TResult? Function(SubscribedNotification value)? subscribed,
    TResult? Function(CommentAnswerNotification value)? commentAnswer,
  }) {
    return subscribed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewChapterNotification value)? newChapter,
    TResult Function(BookUnpublishedNotification value)? bookUnpublished,
    TResult Function(ReportRejectedNotification value)? reportRejected,
    TResult Function(SubscribedNotification value)? subscribed,
    TResult Function(CommentAnswerNotification value)? commentAnswer,
    required TResult orElse(),
  }) {
    if (subscribed != null) {
      return subscribed(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscribedNotificationToJson(
      this,
    );
  }
}

abstract class SubscribedNotification implements MyNotification {
  factory SubscribedNotification(
      {required final String notificationType,
      final String localId,
      final String messageId,
      @intDate required final DateTime sentTime,
      required final String profile,
      required final String profileId}) = _$SubscribedNotification;

  factory SubscribedNotification.fromJson(Map<String, dynamic> json) =
      _$SubscribedNotification.fromJson;

  @override
  String get notificationType;
  @override
  String get localId;
  @override
  String get messageId;
  @override
  @intDate
  DateTime get sentTime;
  String get profile;
  String get profileId;
  @override
  @JsonKey(ignore: true)
  _$$SubscribedNotificationCopyWith<_$SubscribedNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CommentAnswerNotificationCopyWith<$Res>
    implements $MyNotificationCopyWith<$Res> {
  factory _$$CommentAnswerNotificationCopyWith(
          _$CommentAnswerNotification value,
          $Res Function(_$CommentAnswerNotification) then) =
      __$$CommentAnswerNotificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String notificationType,
      String localId,
      String messageId,
      @intDate DateTime sentTime,
      String subject,
      String subjectName,
      int depth});
}

/// @nodoc
class __$$CommentAnswerNotificationCopyWithImpl<$Res>
    extends _$MyNotificationCopyWithImpl<$Res, _$CommentAnswerNotification>
    implements _$$CommentAnswerNotificationCopyWith<$Res> {
  __$$CommentAnswerNotificationCopyWithImpl(_$CommentAnswerNotification _value,
      $Res Function(_$CommentAnswerNotification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationType = null,
    Object? localId = null,
    Object? messageId = null,
    Object? sentTime = null,
    Object? subject = null,
    Object? subjectName = null,
    Object? depth = null,
  }) {
    return _then(_$CommentAnswerNotification(
      notificationType: null == notificationType
          ? _value.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
              as String,
      localId: null == localId
          ? _value.localId
          : localId // ignore: cast_nullable_to_non_nullable
              as String,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      sentTime: null == sentTime
          ? _value.sentTime
          : sentTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      depth: null == depth
          ? _value.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentAnswerNotification implements CommentAnswerNotification {
  _$CommentAnswerNotification(
      {required this.notificationType,
      this.localId = "",
      this.messageId = "",
      @intDate required this.sentTime,
      this.subject = "",
      this.subjectName = "",
      this.depth = 0});

  factory _$CommentAnswerNotification.fromJson(Map<String, dynamic> json) =>
      _$$CommentAnswerNotificationFromJson(json);

  @override
  final String notificationType;
  @override
  @JsonKey()
  final String localId;
  @override
  @JsonKey()
  final String messageId;
  @override
  @intDate
  final DateTime sentTime;
  @override
  @JsonKey()
  final String subject;
  @override
  @JsonKey()
  final String subjectName;
  @override
  @JsonKey()
  final int depth;

  @override
  String toString() {
    return 'MyNotification.commentAnswer(notificationType: $notificationType, localId: $localId, messageId: $messageId, sentTime: $sentTime, subject: $subject, subjectName: $subjectName, depth: $depth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentAnswerNotification &&
            (identical(other.notificationType, notificationType) ||
                other.notificationType == notificationType) &&
            (identical(other.localId, localId) || other.localId == localId) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.sentTime, sentTime) ||
                other.sentTime == sentTime) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName) &&
            (identical(other.depth, depth) || other.depth == depth));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, notificationType, localId,
      messageId, sentTime, subject, subjectName, depth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentAnswerNotificationCopyWith<_$CommentAnswerNotification>
      get copyWith => __$$CommentAnswerNotificationCopyWithImpl<
          _$CommentAnswerNotification>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String? book,
            String? bookId,
            String? chapter,
            String? chapterId)
        newChapter,
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String? book,
            String? bookId)
        bookUnpublished,
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            String subjectId)
        reportRejected,
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String profile,
            String profileId)
        subscribed,
    required TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            int depth)
        commentAnswer,
  }) {
    return commentAnswer(notificationType, localId, messageId, sentTime,
        subject, subjectName, depth);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String? book,
            String? bookId,
            String? chapter,
            String? chapterId)?
        newChapter,
    TResult? Function(String notificationType, String localId, String messageId,
            @intDate DateTime sentTime, String? book, String? bookId)?
        bookUnpublished,
    TResult? Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            String subjectId)?
        reportRejected,
    TResult? Function(String notificationType, String localId, String messageId,
            @intDate DateTime sentTime, String profile, String profileId)?
        subscribed,
    TResult? Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            int depth)?
        commentAnswer,
  }) {
    return commentAnswer?.call(notificationType, localId, messageId, sentTime,
        subject, subjectName, depth);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String? book,
            String? bookId,
            String? chapter,
            String? chapterId)?
        newChapter,
    TResult Function(String notificationType, String localId, String messageId,
            @intDate DateTime sentTime, String? book, String? bookId)?
        bookUnpublished,
    TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            String subjectId)?
        reportRejected,
    TResult Function(String notificationType, String localId, String messageId,
            @intDate DateTime sentTime, String profile, String profileId)?
        subscribed,
    TResult Function(
            String notificationType,
            String localId,
            String messageId,
            @intDate DateTime sentTime,
            String subject,
            String subjectName,
            int depth)?
        commentAnswer,
    required TResult orElse(),
  }) {
    if (commentAnswer != null) {
      return commentAnswer(notificationType, localId, messageId, sentTime,
          subject, subjectName, depth);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewChapterNotification value) newChapter,
    required TResult Function(BookUnpublishedNotification value)
        bookUnpublished,
    required TResult Function(ReportRejectedNotification value) reportRejected,
    required TResult Function(SubscribedNotification value) subscribed,
    required TResult Function(CommentAnswerNotification value) commentAnswer,
  }) {
    return commentAnswer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewChapterNotification value)? newChapter,
    TResult? Function(BookUnpublishedNotification value)? bookUnpublished,
    TResult? Function(ReportRejectedNotification value)? reportRejected,
    TResult? Function(SubscribedNotification value)? subscribed,
    TResult? Function(CommentAnswerNotification value)? commentAnswer,
  }) {
    return commentAnswer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewChapterNotification value)? newChapter,
    TResult Function(BookUnpublishedNotification value)? bookUnpublished,
    TResult Function(ReportRejectedNotification value)? reportRejected,
    TResult Function(SubscribedNotification value)? subscribed,
    TResult Function(CommentAnswerNotification value)? commentAnswer,
    required TResult orElse(),
  }) {
    if (commentAnswer != null) {
      return commentAnswer(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentAnswerNotificationToJson(
      this,
    );
  }
}

abstract class CommentAnswerNotification implements MyNotification {
  factory CommentAnswerNotification(
      {required final String notificationType,
      final String localId,
      final String messageId,
      @intDate required final DateTime sentTime,
      final String subject,
      final String subjectName,
      final int depth}) = _$CommentAnswerNotification;

  factory CommentAnswerNotification.fromJson(Map<String, dynamic> json) =
      _$CommentAnswerNotification.fromJson;

  @override
  String get notificationType;
  @override
  String get localId;
  @override
  String get messageId;
  @override
  @intDate
  DateTime get sentTime;
  String get subject;
  String get subjectName;
  int get depth;
  @override
  @JsonKey(ignore: true)
  _$$CommentAnswerNotificationCopyWith<_$CommentAnswerNotification>
      get copyWith => throw _privateConstructorUsedError;
}
