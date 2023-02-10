import 'package:client/src/features/localization/data/localization_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/localization.i69n.dart';

final currentLocalizationProvider = Provider<Localization>((ref) {
  return ref.watch(localizationControllerProvider).localization;
});