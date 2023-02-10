import 'dart:convert';

import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/features/auth/data/google_auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../shared/dio.dart';
import '../../profile/domain/profile.dart';

class AuthRepository {
  AuthRepository(GoogleAuthRepository googleAuth, Dio dio)
      : _googleAuth = googleAuth,
        _dio = dio {
    FirebaseAuth.instance.userChanges().listen((u) {
      if (u == null) {
        print("Permanent User Listener: not authenticated");
        return;
      }
      print("User: $u");
      u.getIdTokenResult().then((r) {
        print("Token Result: $r");
        print("Claims: ${jsonEncode(r.claims)}");
      });
    });
  }

  final Dio _dio;
  final GoogleAuthRepository _googleAuth;

  User? get currentUser => FirebaseAuth.instance.currentUser;
  Stream<User?> get userChanges => FirebaseAuth.instance.authStateChanges();

  Future signInWithGoogle(GoogleSignInAccount acc) async {
    final auth = await acc.authentication;
    final creds = GoogleAuthProvider.credential(
        idToken: auth.idToken, accessToken: auth.accessToken);
    await FirebaseAuth.instance.signInWithCredential(creds);
  }

  Future signUpWithGoogle(
      {required GoogleSignInAccount acc, required Profile newProfile}) async {
    final auth = await acc.authentication;
    final resp = await _dio.post('auth/google',
        data: newProfile.toJson()
          ..addAll({
            "idToken".hardcoded: auth.idToken,
            "accessToken".hardcoded: auth.accessToken
          }));
    final creds = GoogleAuthProvider.credential(
        idToken: resp.data['data']['idToken'],
        accessToken: resp.data['data']['accessToken']);
    await FirebaseAuth.instance.signInWithCredential(creds);
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future signUpWithEmailAndPassword({ // password
    required String email,
    required String password,
    required Profile newProfile
  }) async {
    final resp = await _dio.post('auth/password',
      data: newProfile.toJson()
        ..addAll({
          "email".hardcoded: email,
          "password".hardcoded: password
        })
    );
    await FirebaseAuth.instance.signInWithCustomToken(resp.data['data']['customToken']);
  }

  Future<void> signOut() async {
    if (await _googleAuth.isSignedIn) {
      _googleAuth.signOut();
    }
    FirebaseAuth.instance.signOut();
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    ref.watch(googleAuthRepositoryProvider), 
    ref.watch(dioProvider),
  );
});
