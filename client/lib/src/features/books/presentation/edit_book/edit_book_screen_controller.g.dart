// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_book_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editBookScreenControllerHash() =>
    r'e683868f6ff4b82830c927de7acb4adf201e94f3';

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

abstract class _$EditBookScreenController
    extends BuildlessAutoDisposeNotifier<EditBookScreenState> {
  late final Book book;

  EditBookScreenState build(
    Book book,
  );
}

/// See also [EditBookScreenController].
@ProviderFor(EditBookScreenController)
const editBookScreenControllerProvider = EditBookScreenControllerFamily();

/// See also [EditBookScreenController].
class EditBookScreenControllerFamily extends Family<EditBookScreenState> {
  /// See also [EditBookScreenController].
  const EditBookScreenControllerFamily();

  /// See also [EditBookScreenController].
  EditBookScreenControllerProvider call(
    Book book,
  ) {
    return EditBookScreenControllerProvider(
      book,
    );
  }

  @override
  EditBookScreenControllerProvider getProviderOverride(
    covariant EditBookScreenControllerProvider provider,
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
  String? get name => r'editBookScreenControllerProvider';
}

/// See also [EditBookScreenController].
class EditBookScreenControllerProvider extends AutoDisposeNotifierProviderImpl<
    EditBookScreenController, EditBookScreenState> {
  /// See also [EditBookScreenController].
  EditBookScreenControllerProvider(
    this.book,
  ) : super.internal(
          () => EditBookScreenController()..book = book,
          from: editBookScreenControllerProvider,
          name: r'editBookScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editBookScreenControllerHash,
          dependencies: EditBookScreenControllerFamily._dependencies,
          allTransitiveDependencies:
              EditBookScreenControllerFamily._allTransitiveDependencies,
        );

  final Book book;

  @override
  bool operator ==(Object other) {
    return other is EditBookScreenControllerProvider && other.book == book;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, book.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  EditBookScreenState runNotifierBuild(
    covariant EditBookScreenController notifier,
  ) {
    return notifier.build(
      book,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
