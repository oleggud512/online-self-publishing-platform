import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthRepository { 
  /*
  paste this inside the <head></head> before deploying. 
  это нужно посмотреть в google cloud там credentials разные для web, android и ios. 
  <meta name="google-signin-client_id" 
    content="626801727731-some-credentials-for-the-web.apps.googleusercontent.com">
  */
  final _googleSignIn = GoogleSignIn(
    serverClientId: "626801727731-t82pausgvkhnb21siio50vnefhgg9806.apps.googleusercontent.com"
  );

  Future<UserCredential?> signIn() async {
    print("GoogleSignInProvider.login");
    if (kIsWeb) await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser == null) return null;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<GoogleSignInAccount?> selectGoogleAccount() async {
    if (kIsWeb) await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
    GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    return googleUser;
  }

  Future<GoogleSignInAccount?> get currentUser => _googleSignIn.signInSilently();
  Future<bool> get isSignedIn => _googleSignIn.isSignedIn();

  Future<void> signOut() async {
    await _googleSignIn.disconnect();
    
  }
}

final googleAuthRepositoryProvider = Provider((ref) {
  return GoogleAuthRepository();
});