import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/common/log.dart';
import 'package:client/src/common/widgets/google_list_tile.dart';
import 'package:client/src/features/auth/presentation/auth_screen_controller.dart';
import 'package:client/src/features/auth/presentation/auth_screen_state.dart';
import 'package:client/src/features/profile/domain/profile.dart';
import 'package:client/src/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../common/constants/constants.dart';
import '../../profile/presentation/edit_profile_widget/edit_profile_widget.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthScreenState();
}
class _AuthScreenState extends ConsumerState<AuthScreen> {
  AuthScreenController get cont => ref.watch(authScreenControllerProvider.notifier);

  void onSkip() {
    print("skip authentication");
    context.goNamed(MyRoute.home.name);
  }

  void onSignInSignUp() async {
    print("Sign in button clicked");
    final authenticated = await cont.submit();
    if (authenticated && context.mounted) {
      context.goNamed(MyRoute.home.name);
    }
  }

  void onChangeMode() {
    cont.changeMode();
  }

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController displayName = TextEditingController();
  final TextEditingController age = TextEditingController();
  Gender gender = Gender.preferNotToSay;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    printInfo("AuthScreen build");
    final state = ref.watch(authScreenControllerProvider);
    final c = cont;
    printInfo("PHOTO URL = ${state.googleSignInAccount?.photoUrl ?? "NO GOOGLE"}");
    formKey.currentState?.validate();

    return Scaffold(
      appBar: AppBar(
        title: Text("Auth Screen".hardcoded),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(p16),
          children: [
            if (state.googleSignInAccount == null) ...[
              TextField(
                controller: email,
                decoration: InputDecoration(
                  labelText: "email".hardcoded,
                ),
                onChanged: (v) {
                  c.email = v;
                }
              ),
              h8gap,
              TextFormField(
                controller: password,
                decoration: InputDecoration(
                  labelText: "password".hardcoded,
                ),
                obscureText: true,
                onChanged: (newV) {
                  c.password = newV;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: c.passwordValidator
              ),
              h8gap,
              OutlinedButton.icon(
                icon: const Icon(FontAwesomeIcons.google, color: Colors.red),
                label: Text("Google".hardcoded),
                onPressed: () {
                  c.selectGoogleUser();
                }
              ),
              h8gap
            ] 
            else GoogleListTile(
              googleSignInAccount: state.googleSignInAccount, 
              onRemove: () {
                print("back to email + password");
                c.backToEmailAndPassword();
              }
            ),
            if (state.isSignUp) ...[
              const Divider(),
              h8gap,
              const EditProfileWidget(isAuth: true),
            ],
            const Divider(),
            Row(
              children: [
                // skip
                Expanded(
                  child: OutlinedButton(
                    onPressed: onSkip,
                    child: Text("Skip".hardcoded),
                  ),
                ),
                w16gap,
            
                // sign in with email and password
                Expanded(
                  child: FilledButton(
                    onPressed: onSignInSignUp,
                    child: Text(state.isSignUp ? "Sign Up".hardcoded : "Sign In".hardcoded),
                  ),
                ),
              ]
            ),
      
            h16gap,
            TextButton(
              onPressed: onChangeMode,
              child: Text("Switch to ${state.isSignIn ? "Sign Up".hardcoded : "Sign In".hardcoded}".hardcoded),
            )
          ]
        ),
      ),
    );
  }
}
