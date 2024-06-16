
import 'package:client/src/features/auth/data/google_auth_repository.dart';
import 'package:client/src/shared/errors/errors.dart';
import 'package:client/src/shared/errors/handle_error.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../shared/errors/exceptions.dart';
import '../../../shared/constants.dart';
import '../../../shared/dio.dart';
import '../../profile/domain/profile.dart';

class BlockedUserAuthException extends AppException { 
  static const String name = 'blockedUserAuth';
}

class AuthRepository {
  AuthRepository(GoogleAuthRepository googleAuth, Dio dio)
      : _googleAuth = googleAuth,
        _dio = dio {
    // FirebaseAuth.instance.userChanges().listen((u) {
    //   if (u == null) {
    //     print("Permanent User Listener: not authenticated");
    //     return;
    //   }
    //   print("User: $u");
    //   u.getIdTokenResult().then((r) {
    //     print("Token Result: $r");
    //     print("Claims: ${jsonEncode(r.claims)}");
    //   });
    // });
  }

  final Dio _dio;
  final GoogleAuthRepository _googleAuth;

  User? get currentUser => FirebaseAuth.instance.currentUser;
  Stream<User?> get userChanges => FirebaseAuth.instance.authStateChanges();

  Future<UserCredential> signInWithGoogle(GoogleSignInAccount acc) async {
    final auth = await acc.authentication;
    final creds = GoogleAuthProvider.credential(
        idToken: auth.idToken, accessToken: auth.accessToken);
    return await FirebaseAuth.instance.signInWithCredential(creds);
  }

  Future<UserCredential> signUpWithGoogle({
    required GoogleSignInAccount acc, 
    required Profile newProfile
  }) async {
    final auth = await acc.authentication;
    final resp = await _dio.post(Str.dio.googleAuth,
        data: newProfile.toJson()
          ..addAll({
            Str.dio.idToken: auth.idToken,
            Str.dio.accessToken: auth.accessToken
          }));
    final creds = GoogleAuthProvider.credential(
        idToken: resp.data[Str.dio.data][Str.dio.idToken],
        accessToken: resp.data[Str.dio.data][Str.dio.accessToken]);
    return await FirebaseAuth.instance.signInWithCredential(creds);
  }

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    final creds = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return creds;
  }

  Future<UserCredential> signUpWithEmailAndPassword({ // password
    required String email,
    required String password,
    required Profile newProfile
  }) async {
    final resp = await _dio.post(Str.dio.passwordAuth,
      data: newProfile.toJson()
        ..addAll({
          Str.dio.email: email,
          Str.dio.password: password
        })
    );
    return await FirebaseAuth.instance.signInWithCustomToken(
      resp.data[Str.dio.data][Str.dio.customToken]);
  }

  Future<void> signOut() async {
    if (await _googleAuth.isSignedIn) {
      _googleAuth.signOut();
    }
    FirebaseAuth.instance.signOut();
  }

  Future<T> _handleBlockedAuth<T>(Future<T> Function() func) async {
    try {
      return await func();
    } on AppError catch (e) {
      if (e.code == BlockedUserAuthException.name) {
        throw BlockedUserAuthException();
      }
      rethrow;
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    ref.watch(googleAuthRepositoryProvider), 
    ref.watch(dioProvider),
  );
});
