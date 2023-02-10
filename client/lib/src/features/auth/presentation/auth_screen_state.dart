import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../profile/domain/profile.dart';

part 'auth_screen_state.freezed.dart';

enum AuthMode { signUp, signIn }

@freezed
class AuthScreenState with _$AuthScreenState {
  factory AuthScreenState({
    @Default(AuthMode.signIn) AuthMode mode,
    @Default("") String email,
    @Default("") String password, 
    @Default("") String name,
    @Default("") String displayName,
    @Default(0) int age,
    @Default(Gender.preferNotToSay) Gender gender,
    GoogleSignInAccount? googleSignInAccount,
    @Default(true) bool passwordTooLong
  }) = _AuthScreenState;
}

extension AuthScreenStateExtension on AuthScreenState {
  bool get isGoogleAuth => googleSignInAccount != null;
  bool get isSignIn => mode == AuthMode.signIn;
  bool get isSignUp => mode == AuthMode.signUp;
}