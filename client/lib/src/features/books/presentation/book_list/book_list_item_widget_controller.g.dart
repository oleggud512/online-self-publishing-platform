// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_list_item_widget_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bookListItemWidgetControllerHash() =>
    r'f9eb8802ef325bc0722eaa2a8ec7ac64b9d45cda';

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
    this.book,
  ) : super.internal(
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
        );

  final Book book;

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

  @override
  BookListItemWidgetState runNotifierBuild(
    covariant BookListItemWidgetController notifier,
  ) {
    return notifier.build(
      book,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
