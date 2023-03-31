// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatScreenControllerHash() =>
    r'be35800f89232f9d0a5a1b723d74377059aba97f';

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

abstract class _$ChatScreenController
    extends BuildlessAutoDisposeNotifier<ChatScreenState> {
  late final Chat chat;

  ChatScreenState build(
    Chat chat,
  );
}

/// See also [ChatScreenController].
@ProviderFor(ChatScreenController)
const chatScreenControllerProvider = ChatScreenControllerFamily();

/// See also [ChatScreenController].
class ChatScreenControllerFamily extends Family<ChatScreenState> {
  /// See also [ChatScreenController].
  const ChatScreenControllerFamily();

  /// See also [ChatScreenController].
  ChatScreenControllerProvider call(
    Chat chat,
  ) {
    return ChatScreenControllerProvider(
      chat,
    );
  }

  @override
  ChatScreenControllerProvider getProviderOverride(
    covariant ChatScreenControllerProvider provider,
  ) {
    return call(
      provider.chat,
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
  String? get name => r'chatScreenControllerProvider';
}

/// See also [ChatScreenController].
class ChatScreenControllerProvider extends AutoDisposeNotifierProviderImpl<
    ChatScreenController, ChatScreenState> {
  /// See also [ChatScreenController].
  ChatScreenControllerProvider(
    this.chat,
  ) : super.internal(
          () => ChatScreenController()..chat = chat,
          from: chatScreenControllerProvider,
          name: r'chatScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chatScreenControllerHash,
          dependencies: ChatScreenControllerFamily._dependencies,
          allTransitiveDependencies:
              ChatScreenControllerFamily._allTransitiveDependencies,
        );

  final Chat chat;

  @override
  bool operator ==(Object other) {
    return other is ChatScreenControllerProvider && other.chat == chat;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chat.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  ChatScreenState runNotifierBuild(
    covariant ChatScreenController notifier,
  ) {
    return notifier.build(
      chat,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
