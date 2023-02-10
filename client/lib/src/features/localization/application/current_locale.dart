import 'package:client/src/features/localization/data/localization_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentLocaleProvider = Provider<Locale>((ref) {
  return ref.watch(localizationControllerProvider).locale;
});