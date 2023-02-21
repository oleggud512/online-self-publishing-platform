// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_widget_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authorWidgetControllerHash() =>
    r'76427142407a8049f796385011994379b8e01d32';

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

abstract class _$AuthorWidgetController
    extends BuildlessAutoDisposeNotifier<Profile> {
  late final Profile profile;

  Profile build(
    Profile profile,
  );
}

/// See also [AuthorWidgetController].
@ProviderFor(AuthorWidgetController)
const authorWidgetControllerProvider = AuthorWidgetControllerFamily();

/// See also [AuthorWidgetController].
class AuthorWidgetControllerFamily extends Family<Profile> {
  /// See also [AuthorWidgetController].
  const AuthorWidgetControllerFamily();

  /// See also [AuthorWidgetController].
  AuthorWidgetControllerProvider call(
    Profile profile,
  ) {
    return AuthorWidgetControllerProvider(
      profile,
    );
  }

  @override
  AuthorWidgetControllerProvider getProviderOverride(
    covariant AuthorWidgetControllerProvider provider,
  ) {
    return call(
      provider.profile,
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
  String? get name => r'authorWidgetControllerProvider';
}

/// See also [AuthorWidgetController].
class AuthorWidgetControllerProvider
    extends AutoDisposeNotifierProviderImpl<AuthorWidgetController, Profile> {
  /// See also [AuthorWidgetController].
  AuthorWidgetControllerProvider(
    this.profile,
  ) : super.internal(
          () => AuthorWidgetController()..profile = profile,
          from: authorWidgetControllerProvider,
          name: r'authorWidgetControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$authorWidgetControllerHash,
          dependencies: AuthorWidgetControllerFamily._dependencies,
          allTransitiveDependencies:
              AuthorWidgetControllerFamily._allTransitiveDependencies,
        );

  final Profile profile;

  @override
  bool operator ==(Object other) {
    return other is AuthorWidgetControllerProvider && other.profile == profile;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, profile.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Profile runNotifierBuild(
    covariant AuthorWidgetController notifier,
  ) {
    return notifier.build(
      profile,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
