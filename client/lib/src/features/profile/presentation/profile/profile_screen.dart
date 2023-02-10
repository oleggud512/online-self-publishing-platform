import 'package:client/src/common/constants/constants.dart';
import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/common/pub_sub.dart';
import 'package:client/src/common/widgets/error_handler.dart';
import 'package:client/src/common/widgets/see_all_header.dart';
import 'package:client/src/features/auth/data/auth_repository.dart';
import 'package:client/src/features/localization/application/current_localization.dart';
import 'package:client/src/features/profile/application/current_profile_id.dart';
import 'package:client/src/features/profile/domain/profile.dart';
import 'package:client/src/features/profile/presentation/edit_profile_screen/edit_profile_screen_controller.dart';
import 'package:client/src/features/profile/presentation/profile/profile_screen_app_bar.dart';
import 'package:client/src/features/profile/presentation/profile/profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

import '../../../../common/widgets/my_image.dart';
import '../../../auth/application/my_id_provider.dart';
import '../../../localization/application/ll.dart';
import 'profile_action_button.dart';


class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {

  void showBooks() {}
  void showSubscribers() {}
  void showSubscriptions() {}
  void subscribe() {}
  void unsubscribe() {}
  void edit() {
    context.pushNamed("editProfile", 
      params: { 'id': ref.watch(profileScreenControllerProvider).value!.profile.id },
      extra: ref.watch(profileScreenControllerProvider).value!.profile
    );
  }

  final logger = Logger();

  @override
  Widget build(BuildContext context) {
    final ll = ref.watch(currentLocalizationProvider);
    final state = ref.watch(profileScreenControllerProvider);
    ref.listen(pubSub, (previous, next) {
      if (next is ProfileUpdatedPubSubEvent) {
        ref.watch(profileScreenControllerProvider.notifier).refresh();
      }
    });
    return state.when(
      data: (state) {
        final tt = Theme.of(context).textTheme;
        final profile = state.profile;
        Future(() => ref.read(profileScreenTitleProvider.notifier).state = profile.name);
        return Scaffold(
          body: ListView(
            padding: const EdgeInsets.all(p16),
            children: [
              SizedBox(
                height: 176,
                child: Row(
                  children: [
                    SizedBox(
                      width: 160,
                      child: MyImage(
                        imageUrl: profile.avatarUrl, 
                        placeholderIconSize: 96
                      ),
                    ),
                    w8gap,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(profile.displayName ?? profile.name, 
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              h8gap,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: showBooks,
                                    child: Column(
                                      children: [
                                        Text(profile.booksCount.toString(),
                                          style: tt.labelSmall
                                        ),
                                        Text(ll.profile.books,
                                          style: tt.labelSmall
                                        )  
                                      ]
                                    ),
                                  ),
                                  InkWell(
                                    onTap: showSubscribers,
                                    child: Column(
                                      children: [
                                        Text(profile.subscribers.toString(),
                                          style: tt.labelSmall
                                        ),
                                        Text(ll.profile.subscribers,
                                          style: tt.labelSmall
                                        )
                                      ]
                                    ),
                                  ),
                                  InkWell(
                                    onTap: showSubscriptions,
                                    child: Column(
                                      children: [
                                        Text(profile.subscriptions.toString(),
                                          style: tt.labelSmall
                                        ),
                                        Text(ll.profile.subscriptions,
                                          style: tt.labelSmall
                                        )
                                      ]
                                    ),
                                  )
                                ]
                              ),
                            ],
                          ),
                          const Spacer(),
                          Flexible(
                            flex: 0,
                            child: ProfileActionButton(
                              edit: edit,
                              subscribe: subscribe,
                              unsubscribe: unsubscribe,
                            )
                          )
                        ]
                      ),
                    )
                  ]
                ),
              ),
              h16gap,
              Text(profile.description ?? ll.profile.noDescriptionPlaceholder,
                style: tt.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                )
              ),
              h8gap,
              const Divider(),
              h8gap,
              SeeAllHeader(
                labelText: "Books",
                onSeeAll: showBooks
              ),
              h16gap,
              SizedBox(
                height: 250,
                child: ListView(
                  controller: ScrollController(),
                  scrollDirection: Axis.horizontal,
                  children: profile.books?.map((book) => SizedBox(
                    width: 160,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 176,
                          width: 160,
                          child: MyImage(
                            placeholderIconSize: 96,
                            imageUrl: book.coverUrl,
                          )
                        ),
                        h4gap,
                        Padding(
                          padding: const EdgeInsets.all(p8),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(book.name, 
                                style: tt.titleMedium,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                              ),
                              if (book.description != null) 
                                Text(book.description!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                )
                            ],
                          ),
                        ),
                      ]
                    ),
                  )).toList() ?? []
                ),
              )
            ]
          )
        );
      },
      loading: defaultLoading,
      error: defaultErrorHandler
    );
  }
}