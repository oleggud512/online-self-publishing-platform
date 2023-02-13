import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/pagination/pagination_list_widget_controller.dart';
import '../features/profile/application/current_profile_id.dart';
import '../features/profile/data/profile_repository.dart';
import '../features/profile/domain/profile.dart';


/// should be used after you ensure that currentProfileIdProvider is set. 
/// Usualy it's set after you navigate to some profile. 
class ProfilesListCallbackFactory {
  ProfilesListCallbackFactory._internal();

  static ProfilesListCallbackFactory? _instance;

  static ProfilesListCallbackFactory get instance {
    _instance ??= ProfilesListCallbackFactory._internal();
    return _instance!;
  }

  PaginationItemsCallback<Profile> createSubscribersPaginationCallback(WidgetRef ref, String profileId) {
    return (int from) => 
      ref.watch(profileRepositoryProvider).subscribers(profileId, from);
  }

  PaginationItemsCallback<Profile> createSubscriptionsPaginationCallback(WidgetRef ref, String profileId) {
    return (int from) => 
      ref.watch(profileRepositoryProvider).subscriptions(profileId, from);
  }
}
