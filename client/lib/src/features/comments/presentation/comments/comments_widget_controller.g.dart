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
    String subjectId,
    String subjectName,
  ) : this._internal(
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
          subjectId: subjectId,
          subjectName: subjectName,
        );

  CommentsWidgetControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.subjectId,
    required this.subjectName,
  }) : super.internal();

  final String subjectId;
  final String subjectName;

  @override
  FutureOr<CommentsWidgetState> runNotifierBuild(
    covariant CommentsWidgetController notifier,
  ) {
    return notifier.build(
      subjectId,
      subjectName,
    );
  }

  @override
  Override overrideWith(CommentsWidgetController Function() create) {
    return ProviderOverride(
      origin: this,
      override: CommentsWidgetControllerProvider._internal(
        () => create()
          ..subjectId = subjectId
          ..subjectName = subjectName,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        subjectId: subjectId,
        subjectName: subjectName,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CommentsWidgetController,
      CommentsWidgetState> createElement() {
    return _CommentsWidgetControllerProviderElement(this);
  }

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
}

mixin CommentsWidgetControllerRef
    on AutoDisposeAsyncNotifierProviderRef<CommentsWidgetState> {
  /// The parameter `subjectId` of this provider.
  String get subjectId;

  /// The parameter `subjectName` of this provider.
  String get subjectName;
}

class _CommentsWidgetControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CommentsWidgetController,
        CommentsWidgetState> with CommentsWidgetControllerRef {
  _CommentsWidgetControllerProviderElement(super.provider);

  @override
  String get subjectId =>
      (origin as CommentsWidgetControllerProvider).subjectId;
  @override
  String get subjectName =>
      (origin as CommentsWidgetControllerProvider).subjectName;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
