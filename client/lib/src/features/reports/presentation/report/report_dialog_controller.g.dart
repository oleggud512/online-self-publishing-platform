// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_dialog_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reportDialogControllerHash() =>
    r'fc56a633a42af3fbf436350a70e948bd1510a757';

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

abstract class _$ReportDialogController
    extends BuildlessAutoDisposeAsyncNotifier<List<ReportType>> {
  late final Identifiable subject;

  FutureOr<List<ReportType>> build(
    Identifiable subject,
  );
}

/// See also [ReportDialogController].
@ProviderFor(ReportDialogController)
const reportDialogControllerProvider = ReportDialogControllerFamily();

/// See also [ReportDialogController].
class ReportDialogControllerFamily
    extends Family<AsyncValue<List<ReportType>>> {
  /// See also [ReportDialogController].
  const ReportDialogControllerFamily();

  /// See also [ReportDialogController].
  ReportDialogControllerProvider call(
    Identifiable subject,
  ) {
    return ReportDialogControllerProvider(
      subject,
    );
  }

  @override
  ReportDialogControllerProvider getProviderOverride(
    covariant ReportDialogControllerProvider provider,
  ) {
    return call(
      provider.subject,
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
  String? get name => r'reportDialogControllerProvider';
}

/// See also [ReportDialogController].
class ReportDialogControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ReportDialogController,
        List<ReportType>> {
  /// See also [ReportDialogController].
  ReportDialogControllerProvider(
    Identifiable subject,
  ) : this._internal(
          () => ReportDialogController()..subject = subject,
          from: reportDialogControllerProvider,
          name: r'reportDialogControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$reportDialogControllerHash,
          dependencies: ReportDialogControllerFamily._dependencies,
          allTransitiveDependencies:
              ReportDialogControllerFamily._allTransitiveDependencies,
          subject: subject,
        );

  ReportDialogControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.subject,
  }) : super.internal();

  final Identifiable subject;

  @override
  FutureOr<List<ReportType>> runNotifierBuild(
    covariant ReportDialogController notifier,
  ) {
    return notifier.build(
      subject,
    );
  }

  @override
  Override overrideWith(ReportDialogController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ReportDialogControllerProvider._internal(
        () => create()..subject = subject,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        subject: subject,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ReportDialogController,
      List<ReportType>> createElement() {
    return _ReportDialogControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ReportDialogControllerProvider && other.subject == subject;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, subject.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ReportDialogControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<ReportType>> {
  /// The parameter `subject` of this provider.
  Identifiable get subject;
}

class _ReportDialogControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ReportDialogController,
        List<ReportType>> with ReportDialogControllerRef {
  _ReportDialogControllerProviderElement(super.provider);

  @override
  Identifiable get subject =>
      (origin as ReportDialogControllerProvider).subject;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
