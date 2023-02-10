import 'package:client/src/features/auth/data/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentUserStreamProvider = StreamProvider<User?>((ref) {
  return ref.watch(authRepositoryProvider).userChanges;
});

final currentUserProvider = Provider<User?>((ref) {
  final currentUser = ref.watch(currentUserStreamProvider);
  return currentUser.value;
});