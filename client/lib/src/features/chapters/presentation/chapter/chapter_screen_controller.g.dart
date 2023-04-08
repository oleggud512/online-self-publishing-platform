// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chapterScreenControllerHash() =>
    r'2761b8a5c29c4188cab3f92b0d3ba205918a9bfc';

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

abstract class _$ChapterScreenController
    extends BuildlessAutoDisposeAsyncNotifier<ChapterScreenState> {
  late final String chapterId;

  FutureOr<ChapterScreenState> build(
    String chapterId,
  );
}

/// See also [ChapterScreenController].
@ProviderFor(ChapterScreenController)
const chapterScreenControllerProvider = ChapterScreenControllerFamily();

/// See also [ChapterScreenController].
class ChapterScreenControllerFamily
    extends Family<AsyncValue<ChapterScreenState>> {
  /// See also [ChapterScreenController].
  const ChapterScreenControllerFamily();

  /// See also [ChapterScreenController].
  ChapterScreenControllerProvider call(
    String chapterId,
  ) {
    return ChapterScreenControllerProvider(
      chapterId,
    );
  }

  @override
  ChapterScreenControllerProvider getProviderOverride(
    covariant ChapterScreenControllerProvider provider,
  ) {
    return call(
      provider.chapterId,
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
  String? get name => r'chapterScreenControllerProvider';
}

/// See also [ChapterScreenController].
class ChapterScreenControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ChapterScreenController,
        ChapterScreenState> {
  /// See also [ChapterScreenController].
  ChapterScreenControllerProvider(
    this.chapterId,
  ) : super.internal(
          () => ChapterScreenController()..chapterId = chapterId,
          from: chapterScreenControllerProvider,
          name: r'chapterScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chapterScreenControllerHash,
          dependencies: ChapterScreenControllerFamily._dependencies,
          allTransitiveDependencies:
              ChapterScreenControllerFamily._allTransitiveDependencies,
        );

  final String chapterId;

  @override
  bool operator ==(Object other) {
    return other is ChapterScreenControllerProvider &&
        other.chapterId == chapterId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chapterId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<ChapterScreenState> runNotifierBuild(
    covariant ChapterScreenController notifier,
  ) {
    return notifier.build(
      chapterId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
