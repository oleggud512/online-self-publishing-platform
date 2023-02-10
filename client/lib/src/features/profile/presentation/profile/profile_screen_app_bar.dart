import 'package:client/src/common/log.dart';
import 'package:client/src/features/profile/presentation/profile/profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileScreenTitleProvider = StateProvider<String>((ref) => "");

class ProfileScreenAppBar extends StatelessWidget with PreferredSizeWidget {
@override
  final Size preferredSize;

  ProfileScreenAppBar({Key? key}) : preferredSize = const Size.fromHeight(56.0), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final title = ref.watch(profileScreenTitleProvider);
        return AppBar(
          title: Text(title),
        );
      }
    );
  }
}