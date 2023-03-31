import 'package:client/src/features/auth/data/auth_repository.dart';
import 'package:client/src/features/auth/data/google_auth_repository.dart';
import 'package:client/src/features/auth/presentation/auth_screen_state.dart';
import 'package:client/src/features/books/application/local_bookmarks_provider.dart';
import 'package:client/src/features/localization/application/current_localization.dart';
import 'package:client/src/features/profile/domain/profile.dart';
import 'package:client/src/features/profile/presentation/edit_profile_widget/edit_profile_widget_controller.dart';
import 'package:client/src/shared/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/log.dart';
import '../../profile/application/currently_edited_profile.dart';

class AuthScreenController extends AutoDisposeNotifier<AuthScreenState> {
  @override
  AuthScreenState build() {
    _googleSignInRepo.currentUser.then((u) => state = state.copyWith(googleSignInAccount: u));
    return AuthScreenState();
  }

  GoogleAuthRepository get _googleSignInRepo => 
    ref.watch(googleAuthRepositoryProvider);

  void changeMode() {
    state = state.copyWith(
      mode: state.mode == AuthMode.signIn ? AuthMode.signUp : AuthMode.signIn);
  }

  set email(String m) => state = state.copyWith(email: m);
  set password(String p) => state = state.copyWith(password: p);
  set name(String n) => state = state.copyWith(name: n);
  set gender(Gender g) => state = state.copyWith(gender: g);
  set displayName(String dn) => state = state.copyWith(displayName: dn);
  set age(int a) => state = state.copyWith(age: a);

  String? passwordValidator(String? s) {
    printInfo("password validation");
    if ((s?.length ?? 0) < 6) {
      return ref.read(currentLocalizationProvider).errors.shortPassword;
    }
    return null;
  }

  Future<bool> submit() async {
    late UserCredential creds;
    if (state.isSignIn) {
      try {
        creds = await signIn();
      } on BlockedUserAuthException catch (_) {
        Utils.showMessage(ref, 'Account is blocked');
        return false;
      }
    } else if (state.isSignUp) {
      creds = await signUp();
    }
    if (creds.user == null) return false;
    await ref.watch(localBookmarksControllerProvider.notifier).syncBookmarks();
    return true;
  }

  Future<UserCredential> signUp() async {
    bool canSignUp = 
      ref.read(editProfileWidgetControllerProvider).isUniqueName;
    printInfo('canSignUp = $canSignUp');
    final authRepo = ref.watch(authRepositoryProvider);
    if (state.isGoogleAuth) {
      return await authRepo.signUpWithGoogle(
        acc: state.googleSignInAccount!,
        newProfile: ref.read(currentlyEditedProfileProvider)
      );
    } else {
      return await authRepo.signUpWithEmailAndPassword(
        email: state.email,
        password: state.password,
        newProfile: ref.read(currentlyEditedProfileProvider),
      );
    }
  }

  Future<UserCredential> signIn() async {
    try {
      final authRepo = ref.watch(authRepositoryProvider);
      if (state.isGoogleAuth) {
        return await authRepo.signInWithGoogle(state.googleSignInAccount!);
      } else {
        return await authRepo.signInWithEmailAndPassword(state.email, state.password);
      }
    } catch (_) {
      rethrow;
    }
  }

  void selectGoogleUser() async {
    state = state.copyWith(
      googleSignInAccount: 
        await _googleSignInRepo.selectGoogleAccount()
    );
    final auth = await state.googleSignInAccount!.authentication;
    final headers = await state.googleSignInAccount!.authHeaders;
    print("headers: $headers \n auth: ${auth.accessToken} ${auth.idToken}");
  }

  void backToEmailAndPassword() async {
    await ref.read(googleAuthRepositoryProvider).signOut();
    state = state.copyWith(googleSignInAccount: await _googleSignInRepo.currentUser);
  }

}

final authScreenControllerProvider = NotifierProvider.autoDispose<
  AuthScreenController,
  AuthScreenState
>(
  () => AuthScreenController(),
  dependencies: [
    googleAuthRepositoryProvider,
    authRepositoryProvider,
    currentlyEditedProfileProvider,
    editProfileWidgetControllerProvider,
    currentLocalizationProvider
  ]
);