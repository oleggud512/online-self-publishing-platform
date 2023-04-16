import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/features/localization/application/current_localization.dart';
import 'package:client/src/features/profile/domain/profile.dart';
import 'package:client/src/shared/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../common/log.dart';
import '../../../../shared/scaffold_messanger.dart';
import '../../data/profile_repository.dart';

part 'author_widget_controller.g.dart';

@riverpod
class AuthorWidgetController extends _$AuthorWidgetController {
  ProfileRepository get profileRepo => ref.watch(profileRepositoryProvider);

  @override
  Profile build(Profile profile) {
    return profile;
  }

  Future<void> subscribe() async {
    final subscribedSuccessfully = await profileRepo.subscribe(state.id);
    if (subscribedSuccessfully) {
      state = state.setSubscribed(true);
      Utils.showMessage(ref, ref.watch(currentLocalizationProvider)
        .profile.gotSubscribed(profile.name));
    }
    printInfo(state);
  }

  Future<void> unsubscribe() async {
    await profileRepo.unsubscribe(state.id);
    state = state.setSubscribed(false);
    Utils.showMessage(ref, ref.watch(currentLocalizationProvider)
      .profile.gotUnsubscribed(profile.name));
    printInfo(state);
  }

}
