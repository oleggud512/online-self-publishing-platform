// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_chapters_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bookChaptersScreenControllerHash() =>
    r'c1ad27dfaac219a24835daa3dcc1aa31b2db54e6';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$BookChaptersScreenController
    extends BuildlessAutoDisposeAsyncNotifier<List<Chapter>> {
  late final String bookId;

  FutureOr<List<Chapter>> build(
    String bookId,
  );
}

/// See also [BookChaptersScreenController].
@ProviderFor(BookChaptersScreenController)
const bookChaptersScreenControllerProvider =
    BookChaptersScreenControllerFamily();

/// See also [BookChaptersScreenController].
class BookChaptersScreenControllerFamily
    extends Family<AsyncValue<List<Chapter>>> {
  /// See also [BookChaptersScreenController].
  const BookChaptersScreenControllerFamily();

  /// See also [BookChaptersScreenController].
  BookChaptersScreenControllerProvider call(
    String bookId,
  ) {
    return BookChaptersScreenControllerProvider(
      bookId,
    );
  }

  @override
  BookChaptersScreenControllerProvider getProviderOverride(
    covariant BookChaptersScreenControllerProvider provider,
  ) {
    return call(
      provider.bookId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'bookChaptersScreenControllerProvider';
}

/// See also [BookChaptersScreenController].
class BookChaptersScreenControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<BookChaptersScreenController,
        List<Chapter>> {
  /// See also [BookChaptersScreenController].
  BookChaptersScreenControllerProvider(
    String bookId,
  ) : this._internal(
          () => BookChaptersScreenController()..bookId = bookId,
          from: bookChaptersScreenControllerProvider,
          name: r'bookChaptersScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bookChaptersScreenControllerHash,
          dependencies: BookChaptersScreenControllerFamily._dependencies,
          allTransitiveDependencies:
              BookChaptersScreenControllerFamily._allTransitiveDependencies,
          bookId: bookId,
        );

  BookChaptersScreenControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.bookId,
  }) : super.internal();

  final String bookId;

  @override
  FutureOr<List<Chapter>> runNotifierBuild(
    covariant BookChaptersScreenController notifier,
  ) {
    return notifier.build(
      bookId,
    );
  }

  @override
  Override overrideWith(BookChaptersScreenController Function() create) {
    return ProviderOverride(
      origin: this,
      override: BookChaptersScreenControllerProvider._internal(
        () => create()..bookId = bookId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        bookId: bookId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<BookChaptersScreenController,
      List<Chapter>> createElement() {
    return _BookChaptersScreenControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BookChaptersScreenControllerProvider &&
        other.bookId == bookId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, bookId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BookChaptersScreenControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<Chapter>> {
  /// The parameter `bookId` of this provider.
  String get bookId;
}

class _BookChaptersScreenControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        BookChaptersScreenController,
        List<Chapter>> with BookChaptersScreenControllerRef {
  _BookChaptersScreenControllerProviderElement(super.provider);

  @override
  String get bookId => (origin as BookChaptersScreenControllerProvider).bookId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
