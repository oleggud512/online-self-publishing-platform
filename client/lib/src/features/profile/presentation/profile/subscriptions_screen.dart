import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/pagination/simple_pagination_list_screen.dart';
import '../../../../shared/pagination_list_callback_factory.dart';
import '../../../localization/application/current_localization.dart';
import '../../domain/profile.dart';
import '../authors/author_widget.dart';

class SubscriptionsScreen extends ConsumerWidget {
  const SubscriptionsScreen({
    super.key,
    required this.profileId
  });

  final String profileId;
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimplePaginationListScreen<Profile>(
      title: ref.watch(currentLocalizationProvider).profile.subscriptions,
      itemBuilder: (context, item) {
        return AuthorWidget(profile: item);
      },
      callback: 
        PaginationCallbackFactory.instance
          .createSubscriptionsCallback(
              ref, profileId)
    );
  }
}