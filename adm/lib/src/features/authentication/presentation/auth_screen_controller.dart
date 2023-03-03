import 'package:adm/src/features/authentication/data/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreenController {
  AuthRepository authRepo;

  AuthScreenController(this.authRepo);

  Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    print("authController.signInWithEmailAndPassword");
    return authRepo.signInWithEmailAndPassword(email, password);
  }

  Future<void> signInWithGoogle() async {
    return authRepo.signInWithGoogle();
  }
}

final authScreenControllerProvider = Provider.autoDispose((ref) {
  return AuthScreenController(ref.watch(authRepositoryProvider));
});