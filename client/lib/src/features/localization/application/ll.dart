import 'package:flutter/material.dart';

import '../domain/localization.i69n.dart';

/// helper function to obtain current localization from context
Localization? curLl(BuildContext context) {
  return Localizations.of<Localization>(context, Localization);
}