import 'package:client/src/app.dart';
import 'package:client/src/common/constants/constants.dart';
import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/features/auth/data/auth_repository.dart';
import 'package:client/src/features/profile/application/current_profile_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../localization/application/ll.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ll = curLl(context);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(p16),
        children: [
          // FilledButton(
          //   child: Text("to my profile"),
          //   onPressed: () {
          //     context.pushNamed('profile', 
          //       queryParams: {
          //         'id': ref.watch(authRepositoryProvider).currentUser!.uid
          //       }, 
          //       params: {
          //         'id': ref.watch(authRepositoryProvider).currentUser!.uid
          //       });
          //   }
          // ),
        ]
      )
    );
  }
}