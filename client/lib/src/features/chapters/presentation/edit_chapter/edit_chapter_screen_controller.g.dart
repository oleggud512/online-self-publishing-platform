// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_chapter_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editChapterScreenControllerHash() =>
    r'18411a5f4e69d9005f85c45e05ac98b1d52a8281';

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

abstract class _$EditChapterScreenController
    extends BuildlessAutoDisposeNotifier<EditChapterScreenState> {
  late final Chapter chapterToEdit;

  EditChapterScreenState build(
    Chapter chapterToEdit,
  );
}

/// See also [EditChapterScreenController].
@ProviderFor(EditChapterScreenController)
const editChapterScreenControllerProvider = EditChapterScreenControllerFamily();

/// See also [EditChapterScreenController].
class EditChapterScreenControllerFamily extends Family<EditChapterScreenState> {
  /// See also [EditChapterScreenController].
  const EditChapterScreenControllerFamily();

  /// See also [EditChapterScreenController].
  EditChapterScreenControllerProvider call(
    Chapter chapterToEdit,
  ) {
    return EditChapterScreenControllerProvider(
      chapterToEdit,
    );
  }

  @override
  EditChapterScreenControllerProvider getProviderOverride(
    covariant EditChapterScreenControllerProvider provider,
  ) {
    return call(
      provider.chapterToEdit,
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
  String? get name => r'editChapterScreenControllerProvider';
}

/// See also [EditChapterScreenController].
class EditChapterScreenControllerProvider
    extends AutoDisposeNotifierProviderImpl<EditChapterScreenController,
        EditChapterScreenState> {
  /// See also [EditChapterScreenController].
  EditChapterScreenControllerProvider(
    Chapter chapterToEdit,
  ) : this._internal(
          () => EditChapterScreenController()..chapterToEdit = chapterToEdit,
          from: editChapterScreenControllerProvider,
          name: r'editChapterScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$editChapterScreenControllerHash,
          dependencies: EditChapterScreenControllerFamily._dependencies,
          allTransitiveDependencies:
              EditChapterScreenControllerFamily._allTransitiveDependencies,
          chapterToEdit: chapterToEdit,
        );

  EditChapterScreenControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chapterToEdit,
  }) : super.internal();

  final Chapter chapterToEdit;

  @override
  EditChapterScreenState runNotifierBuild(
    covariant EditChapterScreenController notifier,
  ) {
    return notifier.build(
      chapterToEdit,
    );
  }

  @override
  Override overrideWith(EditChapterScreenController Function() create) {
    return ProviderOverride(
      origin: this,
      override: EditChapterScreenControllerProvider._internal(
        () => create()..chapterToEdit = chapterToEdit,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chapterToEdit: chapterToEdit,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<EditChapterScreenController,
      EditChapterScreenState> createElement() {
    return _EditChapterScreenControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is EditChapterScreenControllerProvider &&
        other.chapterToEdit == chapterToEdit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chapterToEdit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin EditChapterScreenControllerRef
    on AutoDisposeNotifierProviderRef<EditChapterScreenState> {
  /// The parameter `chapterToEdit` of this provider.
  Chapter get chapterToEdit;
}

class _EditChapterScreenControllerProviderElement
    extends AutoDisposeNotifierProviderElement<EditChapterScreenController,
        EditChapterScreenState> with EditChapterScreenControllerRef {
  _EditChapterScreenControllerProviderElement(super.provider);

  @override
  Chapter get chapterToEdit =>
      (origin as EditChapterScreenControllerProvider).chapterToEdit;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
