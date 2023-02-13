// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

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

String _$ProfileScreenControllerHash() =>
    r'3ed6a40003c2a63a1e6693886750f90035ae3c74';

/// See also [ProfileScreenController].
class ProfileScreenControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProfileScreenController,
        ProfileScreenState> {
  ProfileScreenControllerProvider(
    this.profileId,
  ) : super(
          () => ProfileScreenController()..profileId = profileId,
          from: profileScreenControllerProvider,
          name: r'profileScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$ProfileScreenControllerHash,
        );

  final String profileId;

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

  @override
  FutureOr<ProfileScreenState> runNotifierBuild(
    covariant _$ProfileScreenController notifier,
  ) {
    return notifier.build(
      profileId,
    );
  }
}

typedef ProfileScreenControllerRef
    = AutoDisposeAsyncNotifierProviderRef<ProfileScreenState>;

/// See also [ProfileScreenController].
final profileScreenControllerProvider = ProfileScreenControllerFamily();

class ProfileScreenControllerFamily
    extends Family<AsyncValue<ProfileScreenState>> {
  ProfileScreenControllerFamily();

  ProfileScreenControllerProvider call(
    String profileId,
  ) {
    return ProfileScreenControllerProvider(
      profileId,
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderImpl<ProfileScreenController,
      ProfileScreenState> getProviderOverride(
    covariant ProfileScreenControllerProvider provider,
  ) {
    return call(
      provider.profileId,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'profileScreenControllerProvider';
}

abstract class _$ProfileScreenController
    extends BuildlessAutoDisposeAsyncNotifier<ProfileScreenState> {
  late final String profileId;

  FutureOr<ProfileScreenState> build(
    String profileId,
  );
}
