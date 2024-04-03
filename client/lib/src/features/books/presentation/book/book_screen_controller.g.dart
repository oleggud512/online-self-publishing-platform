// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bookScreenControllerHash() =>
    r'c3d511e6c46a6fbee5f110bf9354275378eb2cd0';

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

abstract class _$BookScreenController
    extends BuildlessAutoDisposeAsyncNotifier<BookScreenState> {
  late final String bookId;

  FutureOr<BookScreenState> build(
    String bookId,
  );
}

/// See also [BookScreenController].
@ProviderFor(BookScreenController)
const bookScreenControllerProvider = BookScreenControllerFamily();

/// See also [BookScreenController].
class BookScreenControllerFamily extends Family<AsyncValue<BookScreenState>> {
  /// See also [BookScreenController].
  const BookScreenControllerFamily();

  /// See also [BookScreenController].
  BookScreenControllerProvider call(
    String bookId,
  ) {
    return BookScreenControllerProvider(
      bookId,
    );
  }

  @override
  BookScreenControllerProvider getProviderOverride(
    covariant BookScreenControllerProvider provider,
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
  String? get name => r'bookScreenControllerProvider';
}

/// See also [BookScreenController].
class BookScreenControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    BookScreenController, BookScreenState> {
  /// See also [BookScreenController].
  BookScreenControllerProvider(
    String bookId,
  ) : this._internal(
          () => BookScreenController()..bookId = bookId,
          from: bookScreenControllerProvider,
          name: r'bookScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bookScreenControllerHash,
          dependencies: BookScreenControllerFamily._dependencies,
          allTransitiveDependencies:
              BookScreenControllerFamily._allTransitiveDependencies,
          bookId: bookId,
        );

  BookScreenControllerProvider._internal(
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
  FutureOr<BookScreenState> runNotifierBuild(
    covariant BookScreenController notifier,
  ) {
    return notifier.build(
      bookId,
    );
  }

  @override
  Override overrideWith(BookScreenController Function() create) {
    return ProviderOverride(
      origin: this,
      override: BookScreenControllerProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<BookScreenController, BookScreenState>
      createElement() {
    return _BookScreenControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BookScreenControllerProvider && other.bookId == bookId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, bookId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BookScreenControllerRef
    on AutoDisposeAsyncNotifierProviderRef<BookScreenState> {
  /// The parameter `bookId` of this provider.
  String get bookId;
}

class _BookScreenControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<BookScreenController,
        BookScreenState> with BookScreenControllerRef {
  _BookScreenControllerProviderElement(super.provider);

  @override
  String get bookId => (origin as BookScreenControllerProvider).bookId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
