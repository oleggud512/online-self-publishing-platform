import 'package:flutter/material.dart';

import '../domain/localization.i69n.dart';
import '../domain/localization_uk.i69n.dart';

class SupportedLocale {
  static const String en = 'en';
  static const String uk = 'uk';

  static const List<String> values = [en, uk];

  static Locale localeFromString([String? languageCode]) {
    if (languageCode == null) return const Locale(en);
    for (final locale in values) {
      if (locale == languageCode) return Locale(locale);
    }
    throw 'incorrect languageCode "$languageCode"';
  }

  static Localization localizationFromLocale(Locale locale) {
    switch (locale.languageCode) {
      case en: return const Localization();
      case uk: return const Localization_uk();
    }
    throw 'incorrect locale';
  }
  
}

class LocalizationState {

  final Localization localization;
  final Locale locale;

  LocalizationState(this.localization, this.locale) : 
    assert(locale.languageCode == 'en' ||
      localization is Localization_uk && locale.languageCode == 'uk');

  factory LocalizationState.fromLocale(Locale locale) {
    return LocalizationState(
      SupportedLocale.localizationFromLocale(locale),
      locale
    );
  }
}