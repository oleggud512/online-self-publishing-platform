// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bookScreenControllerHash() =>
    r'f6d0dc8b6c0c49d111d5b7742f4b48b0a3b01e58';

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
    this.bookId,
  ) : super.internal(
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
        );

  final String bookId;

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

  @override
  FutureOr<BookScreenState> runNotifierBuild(
    covariant BookScreenController notifier,
  ) {
    return notifier.build(
      bookId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
