import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../shared/constants.dart';
import 'app_localizations_delegate.dart';
import 'localization_state.dart';


class LocalizationController extends Notifier<LocalizationState> {

  List<LocalizationsDelegate<dynamic>> getDelegates() {
    return [
      AppLocalizationsDelegate(state.localization),
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ];
  }

  @override
  LocalizationState build() {
    return LocalizationState.fromLocale(const Locale(SupportedLocale.en));
  }

  Future<void> changeLocale(Locale newLocale) async {
    final perfs = await SharedPreferences.getInstance();
    await perfs.setString(Prefs.currentLocale, newLocale.languageCode);
    state = LocalizationState.fromLocale(newLocale);
  }

  Future<void> loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    String? currentLocale = prefs.getString(Prefs.currentLocale);
    state = LocalizationState.fromLocale(
      SupportedLocale.localeFromString(currentLocale));
  }
}

/// в нем уж ТОЧНО будет сидеть нужная локаля. В любом случае. 
final localizationControllerProvider = NotifierProvider<
  LocalizationController,
  LocalizationState
>(
  () => LocalizationController()
);