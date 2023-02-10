import 'package:client/src/router/router.dart';
import 'package:client/src/shared/scaffold_messanger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'features/localization/data/localization_controller.dart';
import 'features/localization/data/localization_state.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = ThemeData(
      useMaterial3: true, 
      colorSchemeSeed: Colors.brown,
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder()
      ),
      navigationBarTheme: NavigationBarThemeData(
        labelTextStyle: MaterialStatePropertyAll(
          Theme.of(context).textTheme.labelMedium!.copyWith(
            overflow: TextOverflow.ellipsis
          )
        )
      )
    );
    GoRouter router = ref.watch(routerProvider);
    GlobalKey<ScaffoldMessengerState> scaffoldMessengerState = 
      ref.watch(scaffoldMessangerStateProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      
      scaffoldMessengerKey: scaffoldMessengerState,
      
      routerConfig: router,

      localizationsDelegates: 
        ref.watch(localizationControllerProvider.notifier).getDelegates(),
      supportedLocales: SupportedLocale.values.map((v) => Locale(v)),
      locale: ref.watch(localizationControllerProvider).locale,

      theme: theme
    );
  }
}