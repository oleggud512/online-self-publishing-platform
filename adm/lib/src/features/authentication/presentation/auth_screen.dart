import 'package:adm/src/common/hardcoded.dart';
import 'package:adm/src/features/authentication/presentation/auth_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/sizes.dart';
import '../data/auth_repository.dart';

class AuthScreen extends ConsumerWidget {
  AuthScreen({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cont = ref.read(authScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Auth screen".hardcoded)),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 400,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: email,
                decoration: const InputDecoration(
                  labelText: "email",
                  border: OutlineInputBorder(),
                ),
              ),
              h8gap,
              TextFormField(
                controller: password,
                decoration: const InputDecoration(
                  labelText: "password",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              h8gap,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(56),
                ),
                child: const Text("Sign In"),
                onPressed: () async {
                  print("Sign in button clicked");
                  final creds = await cont.signInWithEmailAndPassword(email.text, password.text);
                  if (creds == null && (scaffoldKey.currentState?.mounted ?? false)) {
                    ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(const SnackBar(content: Text("Can't sign in")));
                  }
                }
              ),
              h8gap,
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  // backgroundColor: Colors.red,
                  minimumSize: const Size.fromHeight(56),
                ),
                icon: const Icon(FontAwesomeIcons.google),
                label: const Text("Sign In With Google"),
                onPressed: () {
                  cont.signInWithGoogle();
                }
              ),
            ]
          ),
        ),
      ),
    );
  }
}