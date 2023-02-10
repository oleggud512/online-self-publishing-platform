import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scaffoldMessangerStateProvider = Provider((ref) {
  return GlobalKey<ScaffoldMessengerState>();
});

extension Messanger on GlobalKey<ScaffoldMessengerState> {
  void showMessage(String message) {
    currentState?.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}