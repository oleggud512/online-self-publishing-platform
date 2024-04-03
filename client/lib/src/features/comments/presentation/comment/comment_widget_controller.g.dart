// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_widget_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$commentWidgetControllerHash() =>
    r'cb8de8d9203a12eb2556c0e0eb4cb49f0d938f66';

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

abstract class _$CommentWidgetController
    extends BuildlessAutoDisposeNotifier<CommentWidgetState> {
  late final Comment comment;

  CommentWidgetState build(
    Comment comment,
  );
}

/// See also [CommentWidgetController].
@ProviderFor(CommentWidgetController)
const commentWidgetControllerProvider = CommentWidgetControllerFamily();

/// See also [CommentWidgetController].
class CommentWidgetControllerFamily extends Family<CommentWidgetState> {
  /// See also [CommentWidgetController].
  const CommentWidgetControllerFamily();

  /// See also [CommentWidgetController].
  CommentWidgetControllerProvider call(
    Comment comment,
  ) {
    return CommentWidgetControllerProvider(
      comment,
    );
  }

  @override
  CommentWidgetControllerProvider getProviderOverride(
    covariant CommentWidgetControllerProvider provider,
  ) {
    return call(
      provider.comment,
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
  String? get name => r'commentWidgetControllerProvider';
}

/// See also [CommentWidgetController].
class CommentWidgetControllerProvider extends AutoDisposeNotifierProviderImpl<
    CommentWidgetController, CommentWidgetState> {
  /// See also [CommentWidgetController].
  CommentWidgetControllerProvider(
    Comment comment,
  ) : this._internal(
          () => CommentWidgetController()..comment = comment,
          from: commentWidgetControllerProvider,
          name: r'commentWidgetControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$commentWidgetControllerHash,
          dependencies: CommentWidgetControllerFamily._dependencies,
          allTransitiveDependencies:
              CommentWidgetControllerFamily._allTransitiveDependencies,
          comment: comment,
        );

  CommentWidgetControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.comment,
  }) : super.internal();

  final Comment comment;

  @override
  CommentWidgetState runNotifierBuild(
    covariant CommentWidgetController notifier,
  ) {
    return notifier.build(
      comment,
    );
  }

  @override
  Override overrideWith(CommentWidgetController Function() create) {
    return ProviderOverride(
      origin: this,
      override: CommentWidgetControllerProvider._internal(
        () => create()..comment = comment,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        comment: comment,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CommentWidgetController,
      CommentWidgetState> createElement() {
    return _CommentWidgetControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CommentWidgetControllerProvider && other.comment == comment;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, comment.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CommentWidgetControllerRef
    on AutoDisposeNotifierProviderRef<CommentWidgetState> {
  /// The parameter `comment` of this provider.
  Comment get comment;
}

class _CommentWidgetControllerProviderElement
    extends AutoDisposeNotifierProviderElement<CommentWidgetController,
        CommentWidgetState> with CommentWidgetControllerRef {
  _CommentWidgetControllerProviderElement(super.provider);

  @override
  Comment get comment => (origin as CommentWidgetControllerProvider).comment;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
