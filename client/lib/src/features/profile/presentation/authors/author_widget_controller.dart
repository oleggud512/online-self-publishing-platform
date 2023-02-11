import 'package:client/src/common/hardcoded.dart';
import 'package:client/src/features/profile/domain/profile.dart';
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
    await profileRepo.subscribe(state.id);
    state = state.setSubscribed(true);
    ref.watch(scaffoldMessangerStateProvider).showMessage('Subscribed ${profile.name}'.hardcoded);
    printInfo(state);
  }

  Future<void> unsubscribe() async {
    await profileRepo.unsubscribe(state.id);
    state = state.setSubscribed(false);
    ref.watch(scaffoldMessangerStateProvider).showMessage('${profile.name} unsubscribed'.hardcoded);
    printInfo(state);
  }

}