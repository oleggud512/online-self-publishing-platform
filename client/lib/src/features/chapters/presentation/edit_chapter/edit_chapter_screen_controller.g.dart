// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_chapter_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editChapterScreenControllerHash() =>
    r'85821e1135231c7ae245075bfd3330c4ef64a3e3';

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
    this.chapterToEdit,
  ) : super.internal(
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
        );

  final Chapter chapterToEdit;

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

  @override
  EditChapterScreenState runNotifierBuild(
    covariant EditChapterScreenController notifier,
  ) {
    return notifier.build(
      chapterToEdit,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
