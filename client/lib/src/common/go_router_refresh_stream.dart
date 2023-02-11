import 'dart:async';

import 'package:client/src/common/log.dart';
import 'package:flutter/material.dart';

/// makes GoRouter redirect when stream recevies an event
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) {
            printSuccess("GoRouterRefreshStream - value arrived");
            return notifyListeners();
          },
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}