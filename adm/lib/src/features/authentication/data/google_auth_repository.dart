import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_repository.dart';

class GoogleAuthRepository { 
  GoogleAuthRepository(this.verify);

  Future<bool> Function(String) verify;
  /*
  paste this inside the <head></head> before deploying. 
  <meta name="google-signin-client_id" 
    content="929066756161-aavua5oqdms11arp09urhq71hfrt47fj.apps.googleusercontent.com">
  */
  final _googleSignIn = GoogleSignIn(
    clientId: "929066756161-aavua5oqdms11arp09urhq71hfrt47fj.apps.googleusercontent.com"
  );

  Future<void> signIn() async {
    print("GoogleSignInProvider.login()");
    if (kIsWeb) await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    
    if (googleUser == null) return;

    if (!await verify(googleUser.email)) {
      _googleSignIn.disconnect();
      return;
    }

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }


  Future<void> signOut() async {
    await _googleSignIn.disconnect();  
  }
}

final googleAuthRepositoryProvider = Provider((ref) {
  final verifier = ref.watch(authVerifierProvider);
  return GoogleAuthRepository(verifier);
});