import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_repository.dart';

class FirebaseAuthRepository {
  FirebaseAuthRepository(this.verify);

  Future<bool> Function(String) verify;
  
  Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    print("verification");
    if (!await verify(email)) {
      print("failed");
      return null;
    }
    print("FirebaseAuthRepository.signInWithEmailAndPassword($email, $password) called");
    return FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() {
    return FirebaseAuth.instance.signOut();
  }
}

final firebaseAuthRepositoryProvider = Provider((ref) {
  final verifier = ref.watch(authVerifierProvider);
  return FirebaseAuthRepository(verifier);
});