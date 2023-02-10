import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentProfileIdProvider = StateProvider<String>((ref) {
  print("currentProfileIdProvider updated");
  return "";
});