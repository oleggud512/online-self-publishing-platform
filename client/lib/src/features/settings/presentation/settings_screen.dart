import 'package:client/src/common/constants/constants.dart';
import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/features/localization/application/current_locale.dart';
import 'package:client/src/features/localization/application/current_localization.dart';
import 'package:client/src/features/localization/data/localization_controller.dart';
import 'package:client/src/features/localization/data/localization_state.dart';
import 'package:client/src/shared/scaffold_messanger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/data/auth_repository.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ll = ref.watch(currentLocalizationProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(ll.screenTitle.settings),
        centerTitle: true,
      ), 
      body: ListView(
        padding: const EdgeInsets.all(p16),
        children: [
          DropdownButtonFormField(
            decoration: InputDecoration(
              labelText: ll.settings.changeLanguageLabel
            ),
            value: ref.watch(currentLocaleProvider),
            items: [
              DropdownMenuItem(
                value: const Locale('en'),
                child: Text(ll.settings.english()),
              ),
              DropdownMenuItem(
                value: const Locale('uk'),
                child: Text(ll.settings.ukrainian()),
              ),
            ], 
            onChanged: (nv) {
              ref.read(localizationControllerProvider.notifier)
                .changeLocale(nv!).then((v) {
                  final newLl = ref.watch(currentLocalizationProvider);
                  ref.read(scaffoldMessangerStateProvider).showMessage(
                    newLl.settings.onLangChangedLabel(
                      nv.languageCode == SupportedLocale.en
                        ? newLl.settings.english(true)
                        : newLl.settings.ukrainian(true),
                    ),
                  );
                });
            }
          ),
          h8gap,
          FilledButton.icon(
            icon: const Icon(Icons.logout),
            label: const Text("Sign Out"),
            onPressed: () {
              ref.watch(authRepositoryProvider).signOut();
            }, 
          ),
        ]
      )
    );
  }
}