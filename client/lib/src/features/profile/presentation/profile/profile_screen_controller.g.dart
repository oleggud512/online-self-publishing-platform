// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profileScreenControllerHash() =>
    r'1da7625b6f0a3dc2ec513d68d34447d2b86d5e75';

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

abstract class _$ProfileScreenController
    extends BuildlessAutoDisposeAsyncNotifier<ProfileScreenState> {
  late final String? profileId;

  FutureOr<ProfileScreenState> build(
    String? profileId,
  );
}

/// See also [ProfileScreenController].
@ProviderFor(ProfileScreenController)
const profileScreenControllerProvider = ProfileScreenControllerFamily();

/// See also [ProfileScreenController].
class ProfileScreenControllerFamily
    extends Family<AsyncValue<ProfileScreenState>> {
  /// See also [ProfileScreenController].
  const ProfileScreenControllerFamily();

  /// See also [ProfileScreenController].
  ProfileScreenControllerProvider call(
    String? profileId,
  ) {
    return ProfileScreenControllerProvider(
      profileId,
    );
  }

  @override
  ProfileScreenControllerProvider getProviderOverride(
    covariant ProfileScreenControllerProvider provider,
  ) {
    return call(
      provider.profileId,
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
  String? get name => r'profileScreenControllerProvider';
}

/// See also [ProfileScreenController].
class ProfileScreenControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProfileScreenController,
        ProfileScreenState> {
  /// See also [ProfileScreenController].
  ProfileScreenControllerProvider(
    String? profileId,
  ) : this._internal(
          () => ProfileScreenController()..profileId = profileId,
          from: profileScreenControllerProvider,
          name: r'profileScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$profileScreenControllerHash,
          dependencies: ProfileScreenControllerFamily._dependencies,
          allTransitiveDependencies:
              ProfileScreenControllerFamily._allTransitiveDependencies,
          profileId: profileId,
        );

  ProfileScreenControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.profileId,
  }) : super.internal();

  final String? profileId;

  @override
  FutureOr<ProfileScreenState> runNotifierBuild(
    covariant ProfileScreenController notifier,
  ) {
    return notifier.build(
      profileId,
    );
  }

  @override
  Override overrideWith(ProfileScreenController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProfileScreenControllerProvider._internal(
        () => create()..profileId = profileId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        profileId: profileId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProfileScreenController,
      ProfileScreenState> createElement() {
    return _ProfileScreenControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProfileScreenControllerProvider &&
        other.profileId == profileId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, profileId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProfileScreenControllerRef
    on AutoDisposeAsyncNotifierProviderRef<ProfileScreenState> {
  /// The parameter `profileId` of this provider.
  String? get profileId;
}

class _ProfileScreenControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProfileScreenController,
        ProfileScreenState> with ProfileScreenControllerRef {
  _ProfileScreenControllerProviderElement(super.provider);

  @override
  String? get profileId =>
      (origin as ProfileScreenControllerProvider).profileId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
