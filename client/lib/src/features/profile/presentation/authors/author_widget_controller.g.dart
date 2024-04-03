// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_widget_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authorWidgetControllerHash() =>
    r'4cb683cd5e0cc7ba3ab55b1f74ed7c16199becd1';

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
    Profile profile,
  ) : this._internal(
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
          profile: profile,
        );

  AuthorWidgetControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.profile,
  }) : super.internal();

  final Profile profile;

  @override
  Profile runNotifierBuild(
    covariant AuthorWidgetController notifier,
  ) {
    return notifier.build(
      profile,
    );
  }

  @override
  Override overrideWith(AuthorWidgetController Function() create) {
    return ProviderOverride(
      origin: this,
      override: AuthorWidgetControllerProvider._internal(
        () => create()..profile = profile,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        profile: profile,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<AuthorWidgetController, Profile>
      createElement() {
    return _AuthorWidgetControllerProviderElement(this);
  }

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
}

mixin AuthorWidgetControllerRef on AutoDisposeNotifierProviderRef<Profile> {
  /// The parameter `profile` of this provider.
  Profile get profile;
}

class _AuthorWidgetControllerProviderElement
    extends AutoDisposeNotifierProviderElement<AuthorWidgetController, Profile>
    with AuthorWidgetControllerRef {
  _AuthorWidgetControllerProviderElement(super.provider);

  @override
  Profile get profile => (origin as AuthorWidgetControllerProvider).profile;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
