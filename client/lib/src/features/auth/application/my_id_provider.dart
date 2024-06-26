import 'package:client/src/features/auth/application/current_user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final myIdProvider = Provider<String?>((ref) {
  final currentUser = ref.watch(currentUserProvider);
  return currentUser?.uid;
});