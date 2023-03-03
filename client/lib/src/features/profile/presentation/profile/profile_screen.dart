import 'package:client/src/common/constants/constants.dart';
import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/common/pub_sub.dart';
import 'package:client/src/common/widgets/error_handler.dart';
import 'package:client/src/common/widgets/see_all_header.dart';
import 'package:client/src/features/auth/data/auth_repository.dart';
import 'package:client/src/features/books/application/books_changed_event.dart';
import 'package:client/src/features/localization/application/current_localization.dart';
import 'package:client/src/features/localization/domain/localization.i69n.dart';
import 'package:client/src/features/messages/domain/chat.dart';
import 'package:client/src/features/profile/application/current_profile_id.dart';
import 'package:client/src/features/profile/domain/profile.dart';
import 'package:client/src/features/profile/presentation/edit_profile_screen/edit_profile_screen_controller.dart';
import 'package:client/src/features/profile/presentation/profile/profile_screen_controller.dart';
import 'package:client/src/features/profile/presentation/profile/profile_screen_state.dart';
import 'package:client/src/features/reports/presentation/report_dialog.dart';
import 'package:client/src/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../common/log.dart';
import '../../../../common/widgets/my_image.dart';
import '../../../../router/menu_button_leading.dart';
import '../../../auth/application/my_id_provider.dart';
import '../../../books/presentation/book_list/book_list_widget.dart';
import 'profile_action_button.dart';


class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({
    super.key,
    this.profileId
  });

  final String? profileId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  AsyncValue<ProfileScreenState> get state => 
    ref.watch(profileScreenControllerProvider(widget.profileId!));

  void showBooks() {
    context.pushNamed(MyRoute.profileBooks.name,
      params: { 'id': widget.profileId! }
    );
  }

  void showSubscribers() {
    context.pushNamed(MyRoute.subscribers.name, 
      params: { 'id': widget.profileId! }
    );
  }

  void showSubscriptions() {
    context.pushNamed(MyRoute.subscriptions.name, 
      params: { 'id': widget.profileId! }
    );
  }
  
  void subscribe() async {
    await ref.watch(profileScreenControllerProvider(widget.profileId!).notifier).subscribe();
  }

  void unsubscribe() async {
    await ref.watch(profileScreenControllerProvider(widget.profileId!).notifier).unsubscribe();
  }

  void onSendMessage() {
    context.pushNamed(MyRoute.chat.name,
      params: { 'id': widget.profileId! },
      extra: Chat(other: ref.watch(profileScreenControllerProvider(widget.profileId!)).value!.profile)
    );
  }

  void edit() {
    context.pushNamed(MyRoute.editProfile.name, 
      params: { 'id': ref.watch(profileScreenControllerProvider(widget.profileId!)).value!.profile.id },
      extra: ref.watch(profileScreenControllerProvider(widget.profileId!)).value!.profile
    );
  }

  void onRefresh() async {
    await ref.watch(profileScreenControllerProvider(widget.profileId!).notifier).refresh();
    refreshController.refreshCompleted();
    refreshController.loadComplete();
  }

  void onReport() {
    showReportDialog(context, state.value!.profile);
  }

  @override
  void initState() { 
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final logger = Logger();
  final refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    ref.listen(pubSub, (previous, next) {
      if (next is ProfileEditedPubSubEvent || next is BooksChangedEvent) {
        printSuccess('HOOOOOOOOO');
        ref.watch(profileScreenControllerProvider(widget.profileId).notifier)
          .refresh();
      }
    });

    final ll = ref.watch(currentLocalizationProvider);
    final state = ref.watch(profileScreenControllerProvider(widget.profileId));
    
    // вот эта строчка выдаст ошибку если ты не авторизован, потому что value даже не существует. 
    // его не существует потому что сама state будет не data а error.
    // printInfo("got controller (with id=${state.value?.profile.id})");
    
    return state.when(
      data: (state) {
        final tt = Theme.of(context).textTheme;
        final profile = state.profile;
        // Future(() => ref.read(profileScreenTitleProvider.notifier).state = 
        //     profile.name);
        return Scaffold(
          appBar: AppBar(
            leading: GoRouter.of(context).location.contains('profiles'.hardcoded) 
              ? const BackButton()
              : const MenuButtonLeading(),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) => [PopupMenuItem(
                  onTap: onReport,
                  child: Text('report'.hardcoded)
                )]
              )
            ],
            title: Text(profile.name),
          ),
          body: SmartRefresher(
            controller: refreshController,
            onRefresh: onRefresh,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(p16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            MyImage(
                              imageUrl: profile.avatarUrl, 
                              placeholderIconSize: 96,
                              size: const Size(p160, p176)
                            ),
                            w8gap,
                            Expanded(
                              child: buildHead(context, profile, ll),
                            )
                          ]
                        ),
                      ),
                      h16gap,
                      Text(profile.description ?? ll.profile.noDescriptionPlaceholder,
                        style: tt.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      h8gap,
                      const Divider(),
                      h8gap,
                      SeeAllHeader(
                        labelText: ll.screenTitle.books,
                        onSeeAll: showBooks
                      ),
                    ]
                  ),
                ),
                BookListWidget(books: profile.books ?? [])
              ],
            ),
          ),
        );
      },
      loading: defaultLoading,
      error: defaultErrorHandler
    );
  }


  Column buildHead(BuildContext context, Profile profile, Localization ll) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(profile.displayName ?? profile.name, 
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(profile.id, style: Theme.of(context).textTheme.labelSmall),
        h8gap,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildStatistics(
              onTap: showBooks,
              title: profile.booksCount.toString(),
              subtitle: ll.profile.books
            ),
            buildStatistics(
              onTap: showSubscribers,
              title: profile.subscribers.toString(),
              subtitle: ll.profile.subscribers
            ),
            buildStatistics(
              onTap: showSubscriptions,
              title: profile.subscriptions.toString(),
              subtitle: ll.profile.subscriptions
            ),
          ]
        ),
        const Spacer(),
        Row(
          children: [
            const Spacer(),
            ProfileActionButton(
              profileId: profile.id,
              edit: edit,
              subscribe: subscribe,
              unsubscribe: unsubscribe,
            ),
            if (ref.watch(myIdProvider) != profile.id) IconButton(
              icon: Icon(Icons.message),
              onPressed: onSendMessage
            )
          ],
        )
      ]
    );
  }


  InkWell buildStatistics({
    required void Function() onTap, 
    required String title, 
    required String subtitle
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Text(title,
            style: Theme.of(context).textTheme.labelSmall
          ),
          Text(subtitle,
            style: Theme.of(context).textTheme.labelSmall
          )
        ]
      ),
    );
  }


}