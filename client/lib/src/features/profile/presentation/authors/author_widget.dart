import 'package:client/src/common/widgets/my_image.dart';
import 'package:client/src/features/profile/domain/profile.dart';
import 'package:client/src/features/profile/presentation/authors/author_widget_controller.dart';
import 'package:client/src/features/profile/presentation/profile/profile_action_button.dart';
import 'package:client/src/shared/constants.dart';
import 'package:client/src/shared/scaffold_messanger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/constants/constants.dart';
import '../../../../common/log.dart';
import '../profile/profile_screen_controller.dart';

class AuthorWidget extends ConsumerWidget {
  AuthorWidget({
    super.key,
    required this.profile,
    this.listDirection = Axis.vertical
  });

  Axis listDirection;
  Profile profile;


  Future<void> subscribe(WidgetRef ref) async {
    bool subscribed = 
      await ref.read(profileScreenControllerProvider.notifier).subscribe();
  }
  Future<void> unsubscribe(WidgetRef ref) async {
    bool unsubscribed = 
      await ref.read(profileScreenControllerProvider.notifier).unsubscribe();
  }
  void edit(BuildContext context, WidgetRef ref) {
    context.pushNamed("editProfile", 
      params: { 'id': ref.watch(profileScreenControllerProvider).value!.profile.id },
      extra: ref.watch(profileScreenControllerProvider).value!.profile
    );
  }
  void view(BuildContext context, WidgetRef ref) {
    context.pushNamed(MyRoute.profile.name,
      params: { 'id': profile.id }
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authorWidgetControllerProvider(profile));
    final cont = ref.watch(authorWidgetControllerProvider(profile).notifier);

    return InkWell(
      onTap: () => view(context, ref),
      child: (listDirection == Axis.vertical)
        ? Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            w8gap,
            MyImage(
              imageUrl: state.avatarUrl,
              size: const Size.fromRadius(48),
              placeholderIconSize: 48,
            ),
            w8gap,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.displayName ?? state.name,
                    style: Theme.of(context).textTheme.titleMedium
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.people_outlined, 
                        size: 24,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      w4gap,
                      Text(state.subscribers.toString(),
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.outline
                        )
                      ),
                    ]
                  )
                ]
              ),
            ),
            w8gap,
            if (state.isSubscribed != null) 
              state.isSubscribed!
                ? IconButton(
                  onPressed: () async {
                    await cont.unsubscribe();
                  },
                  icon: const Icon(Icons.person_remove_alt_1)
                )
                : IconButton(
                  onPressed: () async {
                    await cont.subscribe();
                  },
                  icon: const Icon(Icons.person_add_alt_1)
                ),
            w8gap
          ]
        )
        : SizedBox(
          child: Text(profile.name)
        ),
    );
  }
}