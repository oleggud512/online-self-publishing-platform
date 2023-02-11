// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_widget_controller.dart';

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

String _$AuthorWidgetControllerHash() =>
    r'c7e3378c2a5e883b1cb71f6a5b57677325696c50';

/// See also [AuthorWidgetController].
class AuthorWidgetControllerProvider
    extends AutoDisposeNotifierProviderImpl<AuthorWidgetController, Profile> {
  AuthorWidgetControllerProvider(
    this.profile,
  ) : super(
          () => AuthorWidgetController()..profile = profile,
          from: authorWidgetControllerProvider,
          name: r'authorWidgetControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$AuthorWidgetControllerHash,
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
    covariant _$AuthorWidgetController notifier,
  ) {
    return notifier.build(
      profile,
    );
  }
}

typedef AuthorWidgetControllerRef = AutoDisposeNotifierProviderRef<Profile>;

/// See also [AuthorWidgetController].
final authorWidgetControllerProvider = AuthorWidgetControllerFamily();

class AuthorWidgetControllerFamily extends Family<Profile> {
  AuthorWidgetControllerFamily();

  AuthorWidgetControllerProvider call(
    Profile profile,
  ) {
    return AuthorWidgetControllerProvider(
      profile,
    );
  }

  @override
  AutoDisposeNotifierProviderImpl<AuthorWidgetController, Profile>
      getProviderOverride(
    covariant AuthorWidgetControllerProvider provider,
  ) {
    return call(
      provider.profile,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'authorWidgetControllerProvider';
}

abstract class _$AuthorWidgetController
    extends BuildlessAutoDisposeNotifier<Profile> {
  late final Profile profile;

  Profile build(
    Profile profile,
  );
}
