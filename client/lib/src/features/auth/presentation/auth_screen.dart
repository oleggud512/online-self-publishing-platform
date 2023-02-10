import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/common/log.dart';
import 'package:client/src/common/widgets/google_list_tile.dart';
import 'package:client/src/features/auth/presentation/auth_screen_controller.dart';
import 'package:client/src/features/auth/presentation/auth_screen_state.dart';
import 'package:client/src/features/profile/domain/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../common/constants/constants.dart';
import '../../profile/presentation/edit_profile_widget/edit_profile_widget.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthScreenState();
}
class _AuthScreenState extends ConsumerState<AuthScreen> {

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
    final cont = ref.watch(authScreenControllerProvider.notifier);
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
                decoration: const InputDecoration(
                  labelText: "email",
                ),
                onChanged: (v) {
                  cont.email = v;
                }
              ),
              h8gap,
              TextFormField(
                controller: password,
                decoration: const InputDecoration(
                  labelText: "password",
                ),
                obscureText: true,
                onChanged: (newV) {
                  cont.password = newV;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: cont.passwordValidator
              ),
              h8gap,
              OutlinedButton.icon(
                icon: const Icon(FontAwesomeIcons.google, color: Colors.red),
                label: Text("Google".hardcoded),
                onPressed: () {
                  cont.selectGoogleUser();
                }
              ),
              h8gap
            ] 
            else GoogleListTile(
              googleSignInAccount: state.googleSignInAccount, 
              onRemove: () {
                print("back to email + password");
                cont.backToEmailAndPassword();
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
                    child: Text("Skip".hardcoded),
                    onPressed: () {
                      print("skip authentication");
                    },
                  ),
                ),
                w16gap,
            
                // sign in with email and password
                Expanded(
                  child: FilledButton(
                    child: Text(state.isSignUp ? "Sign Up".hardcoded : "Sign In".hardcoded),
                    onPressed: () async {
                      print("Sign in button clicked");
                      cont.submit();
                    }
                  ),
                ),
              ]
            ),
      
            h16gap,
            TextButton(
              child: Text("Switch to ${state.isSignIn ? "Sign Up".hardcoded : "Sign In".hardcoded}".hardcoded),
              onPressed: () {
                cont.changeMode();
              }
            )
          ]
        ),
      ),
    );
  }
}
