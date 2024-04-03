import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/localization/application/current_localization.dart';

Future<bool?> showSimpleYesNoDialog(BuildContext context, String title) {
  return showDialog(
    context: context, 
    builder: (context) {
      return Consumer(
        builder: (context, ref, child) {
          final ll = ref.watch(currentLocalizationProvider);
          return SimpleDialog(
            title: Text(title),
            children: [
              SimpleDialogOption(
                child: Text(ll.yes),
                onPressed: () {
                  context.pop(true);
                },
              ),
              SimpleDialogOption(
                child: Text(ll.no),
                onPressed: () {
                  context.pop(false);
                },
              ),
            ]
          );
        }
      );
    }
  );
}