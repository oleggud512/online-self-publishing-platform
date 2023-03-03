import 'package:adm/src/features/authentication/data/firebase_auth_repository.dart';
import 'package:adm/src/features/authentication/data/google_auth_repository.dart';
import 'package:adm/src/features/users/domain/user.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/dio.dart';
import '../../users/domain/role.dart';
import '../domain/app_user.dart';


class AuthRepository {
  final FirebaseAuthRepository firAuth;
  final GoogleAuthRepository googleAuth;

  AuthRepository(this.firAuth, this.googleAuth);


  Stream<User?> get authStateChanges {
    print('i want to get authStateChanges');
    return FirebaseAuth.instance.authStateChanges();
  }


  User? get currentUser => FirebaseAuth.instance.currentUser;


  Future<String?> get token => 
    FirebaseAuth.instance.currentUser?.getIdToken() ?? Future.value(); 
  

  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) {
    print("AuthRepo.signInWithEmailAndPasword $email, $password");
    return firAuth.signInWithEmailAndPassword(email, password);
  }


  Future<void> signInWithGoogle() {
    return googleAuth.signIn();
  }


  Future<void> signOut() async {
    if (FirebaseAuth.instance.currentUser?.providerData.any(
      (userInfo) => userInfo.providerId == "google.com") ?? false) {
      await googleAuth.signOut();
    }
    await firAuth.signOut();
  }
}

typedef VerificationCallback = Future<bool> Function(String);

final authVerifierProvider = Provider<VerificationCallback>((ref) {
  final dio = ref.watch(dioProvider);
  return (String email) async {
    print("verifying...");
    final Response response = await dio.get('/users/isAdmin?email=$email');
    print(response.data);
    return response.data['data'] as bool;
  };
});


final authRepositoryProvider = Provider((ref) { 
  return AuthRepository(
    ref.watch(firebaseAuthRepositoryProvider),
    ref.watch(googleAuthRepositoryProvider)
  );
});

final currentUserStreamProvider = StreamProvider((ref) {
  return ref.watch(authRepositoryProvider).authStateChanges.map<Future<FireUser?>>(
    (u) async {
      return u == null 
      ? null
      : FireUser.fromJson({
        "uid": u.uid,
        "email": u.email,
        "displayName": u.displayName,
        "role": (await u.getIdTokenResult(true)).claims!['role']
      });
    }
  );
});

final currentUserProvider = FutureProvider<FireUser?>((ref) {
  final stream = ref.watch(currentUserStreamProvider);
  return stream.when(
    error: (e, st) => null,
    loading: () => null,
    data: (data) => data
  );
});