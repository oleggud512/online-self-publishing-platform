import 'package:client/src/features/localization/application/current_localization.dart';

import '../../../../common/hardcoded.dart';
import '../../../auth/application/my_id_provider.dart';
import 'profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileActionButton extends ConsumerWidget {
  const ProfileActionButton({
    super.key,
    required this.profileId,
    required this.edit, // TODO: or better simply invoke Controller methods from here? Yeah. It's better.
    required this.unsubscribe,
    required this.subscribe
  });

  final String profileId;
  final void Function() edit;
  final void Function() unsubscribe;
  final void Function() subscribe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileScreenControllerProvider(profileId));
    final ll = ref.watch(currentLocalizationProvider);
    return (state.value!.isMy) 
      ? FilledButton.icon(
        icon: const Icon(Icons.mode_edit_outline_outlined),
        label: Text(ll.edit),
        onPressed: edit,
      ) 
      : (state.value!.isSubscribed) 
        ? FilledButton.icon(
          icon: const Icon(Icons.person_remove_alt_1_outlined),
          label: Text(ll.unsubscribe),
          onPressed: unsubscribe
        )
        : FilledButton.icon(
          icon: const Icon(Icons.person_add_alt),
          label: Text(ll.subscribe),
          // поскольку у меня в ProfileScreenState дефолтом стоит subscribed=false, 
          // и если не авторизован то subscribed остается не изменным, то можно 
          // оставить это так. 
          // но для надежности лучше на всех это поставить, наверно...
          onPressed: ref.watch(myIdProvider) != null ? subscribe : null
        );
  }
}