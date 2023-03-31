// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_widget_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$commentsWidgetControllerHash() =>
    r'37230dea57a457cbfcee5bb81fd6d9f12398e076';

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

abstract class _$CommentsWidgetController
    extends BuildlessAutoDisposeAsyncNotifier<CommentsWidgetState> {
  late final String subjectId;
  late final String subjectName;

  FutureOr<CommentsWidgetState> build(
    String subjectId,
    String subjectName,
  );
}

/// See also [CommentsWidgetController].
@ProviderFor(CommentsWidgetController)
const commentsWidgetControllerProvider = CommentsWidgetControllerFamily();

/// See also [CommentsWidgetController].
class CommentsWidgetControllerFamily
    extends Family<AsyncValue<CommentsWidgetState>> {
  /// See also [CommentsWidgetController].
  const CommentsWidgetControllerFamily();

  /// See also [CommentsWidgetController].
  CommentsWidgetControllerProvider call(
    String subjectId,
    String subjectName,
  ) {
    return CommentsWidgetControllerProvider(
      subjectId,
      subjectName,
    );
  }

  @override
  CommentsWidgetControllerProvider getProviderOverride(
    covariant CommentsWidgetControllerProvider provider,
  ) {
    return call(
      provider.subjectId,
      provider.subjectName,
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
  String? get name => r'commentsWidgetControllerProvider';
}

/// See also [CommentsWidgetController].
class CommentsWidgetControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CommentsWidgetController,
        CommentsWidgetState> {
  /// See also [CommentsWidgetController].
  CommentsWidgetControllerProvider(
    this.subjectId,
    this.subjectName,
  ) : super.internal(
          () => CommentsWidgetController()
            ..subjectId = subjectId
            ..subjectName = subjectName,
          from: commentsWidgetControllerProvider,
          name: r'commentsWidgetControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$commentsWidgetControllerHash,
          dependencies: CommentsWidgetControllerFamily._dependencies,
          allTransitiveDependencies:
              CommentsWidgetControllerFamily._allTransitiveDependencies,
        );

  final String subjectId;
  final String subjectName;

  @override
  bool operator ==(Object other) {
    return other is CommentsWidgetControllerProvider &&
        other.subjectId == subjectId &&
        other.subjectName == subjectName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, subjectId.hashCode);
    hash = _SystemHash.combine(hash, subjectName.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<CommentsWidgetState> runNotifierBuild(
    covariant CommentsWidgetController notifier,
  ) {
    return notifier.build(
      subjectId,
      subjectName,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
