// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_list_item_widget_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bookListItemWidgetControllerHash() =>
    r'9992a4204a965752e85c0b3dda1257e023182bf5';

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

abstract class _$BookListItemWidgetController
    extends BuildlessAutoDisposeNotifier<BookListItemWidgetState> {
  late final Book book;

  BookListItemWidgetState build(
    Book book,
  );
}

/// See also [BookListItemWidgetController].
@ProviderFor(BookListItemWidgetController)
const bookListItemWidgetControllerProvider =
    BookListItemWidgetControllerFamily();

/// See also [BookListItemWidgetController].
class BookListItemWidgetControllerFamily
    extends Family<BookListItemWidgetState> {
  /// See also [BookListItemWidgetController].
  const BookListItemWidgetControllerFamily();

  /// See also [BookListItemWidgetController].
  BookListItemWidgetControllerProvider call(
    Book book,
  ) {
    return BookListItemWidgetControllerProvider(
      book,
    );
  }

  @override
  BookListItemWidgetControllerProvider getProviderOverride(
    covariant BookListItemWidgetControllerProvider provider,
  ) {
    return call(
      provider.book,
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
  String? get name => r'bookListItemWidgetControllerProvider';
}

/// See also [BookListItemWidgetController].
class BookListItemWidgetControllerProvider
    extends AutoDisposeNotifierProviderImpl<BookListItemWidgetController,
        BookListItemWidgetState> {
  /// See also [BookListItemWidgetController].
  BookListItemWidgetControllerProvider(
    Book book,
  ) : this._internal(
          () => BookListItemWidgetController()..book = book,
          from: bookListItemWidgetControllerProvider,
          name: r'bookListItemWidgetControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bookListItemWidgetControllerHash,
          dependencies: BookListItemWidgetControllerFamily._dependencies,
          allTransitiveDependencies:
              BookListItemWidgetControllerFamily._allTransitiveDependencies,
          book: book,
        );

  BookListItemWidgetControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.book,
  }) : super.internal();

  final Book book;

  @override
  BookListItemWidgetState runNotifierBuild(
    covariant BookListItemWidgetController notifier,
  ) {
    return notifier.build(
      book,
    );
  }

  @override
  Override overrideWith(BookListItemWidgetController Function() create) {
    return ProviderOverride(
      origin: this,
      override: BookListItemWidgetControllerProvider._internal(
        () => create()..book = book,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        book: book,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<BookListItemWidgetController,
      BookListItemWidgetState> createElement() {
    return _BookListItemWidgetControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BookListItemWidgetControllerProvider && other.book == book;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, book.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BookListItemWidgetControllerRef
    on AutoDisposeNotifierProviderRef<BookListItemWidgetState> {
  /// The parameter `book` of this provider.
  Book get book;
}

class _BookListItemWidgetControllerProviderElement
    extends AutoDisposeNotifierProviderElement<BookListItemWidgetController,
        BookListItemWidgetState> with BookListItemWidgetControllerRef {
  _BookListItemWidgetControllerProviderElement(super.provider);

  @override
  Book get book => (origin as BookListItemWidgetControllerProvider).book;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
