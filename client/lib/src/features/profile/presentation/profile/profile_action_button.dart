import '../../../../common/hardcoded.dart';
import 'profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileActionButton extends ConsumerWidget {
  const ProfileActionButton({
    super.key,
    required this.edit, // TODO: or better simply invoke Controller methods from here?
    required this.unsubscribe,
    required this.subscribe
  });

  final void Function() edit;
  final void Function() unsubscribe;
  final void Function() subscribe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileScreenControllerProvider);
    return (state.value!.isMy) 
      ? FilledButton.icon(
        icon: const Icon(Icons.mode_edit_outline_outlined),
        label: Text("edit".hardcoded),
        onPressed: edit
      ) 
      : (state.value!.isSubscribed) 
        ? FilledButton.icon(
          icon: const Icon(Icons.person_remove_alt_1_outlined),
          label: Text("unsubscribe".hardcoded),
          onPressed: unsubscribe
        )
        : FilledButton.icon(
          icon: const Icon(Icons.person_add_alt),
          label: Text("subscribe".hardcoded),
          onPressed: subscribe
        );
  }
}