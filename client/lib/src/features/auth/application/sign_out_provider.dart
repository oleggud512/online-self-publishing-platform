import 'package:client/src/features/auth/data/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_out_provider.g.dart';

@riverpod
Future<void> Function() signOutUseCaseProvider(Ref ref) {
  final authRepo = ref.watch(authRepositoryProvider);
  return authRepo.signOut;
}