import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../domain/localization.i69n.dart';
import 'localization_state.dart';

/// обычно логика изменения локализации должна быть здесь. Но не сегодня. 
/// Такой себе, адаптер. 
class AppLocalizationsDelegate extends LocalizationsDelegate<Localization> {
  AppLocalizationsDelegate(this._localization);

  final Localization _localization;

  @override
  bool isSupported(Locale locale) {
    return SupportedLocale.values.contains(locale.languageCode);
  }

  @override
  Future<Localization> load(Locale locale) { 
    return SynchronousFuture(_localization);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<Localization> old) {
    return false;
  }

}
