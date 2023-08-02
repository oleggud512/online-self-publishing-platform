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
      await ref.read(profileScreenControllerProvider(profile.id).notifier).subscribe();
  }
  Future<void> unsubscribe(WidgetRef ref) async {
    bool unsubscribed = 
      await ref.read(profileScreenControllerProvider(profile.id).notifier).unsubscribe();
  }
  
  void view(BuildContext context, WidgetRef ref) {
    context.pushNamed(MyRoute.profile.name,
      pathParameters: { 'id': profile.id }
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: buildSubscribersCount(context, state)
                  ),
                ]
              ),
            ),
            w8gap,
            buildSubscriptionButton(cont, state),
          ]
        )
        : Column(
          children: [
            MyImage(
              imageUrl: state.avatarUrl,
              size: const Size.fromRadius(p56),
              placeholderIconSize: p56,
            ),
            h8gap,
            Align(
              alignment: Alignment.topLeft,
              child: Text(state.displayName ?? state.name,
                style: Theme.of(context).textTheme.titleMedium
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildSubscribersCount(context, state),
                buildSubscriptionButton(cont, state),
              ]
            )
          ]
        )
    );
  }

  Widget buildSubscriptionButton(AuthorWidgetController cont, Profile state) {
    if (state.isSubscribed == null) return shrink;

    return state.isSubscribed!
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
      );
  }

  Widget buildSubscribersCount(BuildContext context, Profile state) {
    return Row(
      mainAxisSize: MainAxisSize.min,
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
    );
  }
}
