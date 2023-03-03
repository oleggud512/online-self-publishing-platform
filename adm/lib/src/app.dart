import 'package:adm/src/features/authentication/presentation/auth_screen.dart';
import 'package:adm/src/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: ref.watch(goRouterProvider)
    );
  }
}