import 'package:client/src/common/log.dart';
import 'package:client/src/features/auth/application/my_id_provider.dart';
import 'package:client/src/features/profile/application/current_profile_id.dart';
import 'package:client/src/features/profile/data/profile_repository.dart';
import 'package:client/src/features/profile/domain/profile.dart';
import 'package:client/src/features/profile/presentation/profile/profile_screen_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_screen_controller.g.dart';

@Riverpod(keepAlive: false)
// class ProfileScreenController extends _$ProfileScreenController {
//   ProfileRepository get profileRepo => ref.watch(profileRepositoryProvider);

//   @override
//   FutureOr<ProfileScreenState> build() async {
//     final profileId = ref.watch(currentProfileIdProvider);
//     final profile = await profileRepo.getProfile(profileId);
//     if (profile.id != ref.watch(myIdProvider)) {
//       // state = state.copyWith(subscribed: await profileRepo.checkSubscribed(profile.id))
//       // еще нужно проверять на могу ли я вообще подписываться... Ведь я, в теории, могу пропустить аутентификацию.
//     }
//     return ProfileScreenState(profile: profile, isMy: ref.watch(myIdProvider) == profile.id);
//   }
// }

class ProfileScreenController
    extends _$ProfileScreenController {
  ProfileRepository get profileRepo => ref.watch(profileRepositoryProvider);

  @override
  FutureOr<ProfileScreenState> build(String profileId) async {
    // final profileId = ref.watch(currentProfileIdProvider);
    printInfo("build ProfileScreenController with profileId = $profileId");
    final profile = await profileRepo.getProfile(profileId);
    if (profile.id != ref.watch(myIdProvider)) {
      Future(
        () async => 
          state = AsyncData(state.value!.copyWith(
            isSubscribed: await profileRepo.isSubscribed(profile.id)
          ))
      );
      // TODO: еще нужно проверять на могу ли я вообще подписываться... Ведь я, в теории, могу пропустить аутентификацию.
    }
    return ProfileScreenState(
      profile: profile, 
      isMy: ref.watch(myIdProvider) == profile.id
    );
  }

  Future<bool> subscribe() async {
    bool subscribedSuccessfully = await profileRepo.subscribe(state.value!.profile.id);
    state = AsyncData(state.value!.setSubscribed(true));
    // TODO: show snackbar
    return subscribedSuccessfully;
  }

  Future<bool> unsubscribe() async {
    bool unsubscribedSuccessfully = await profileRepo.unsubscribe(state.value!.profile.id);
    state = AsyncData(state.value!.setSubscribed(false));
    // TODO: show snackbar
    return unsubscribedSuccessfully;
  }

  Future<void> refresh() async {
    printInfo("refresh()");
    state = await AsyncValue.guard(() async {
      Profile profile = await profileRepo.getProfile(state.value!.profile.id);
      return ProfileScreenState(
          profile: profile, isMy: ref.watch(myIdProvider) == profile.id);
    });
  }
}

// final profileScreenControllerProvider = AsyncNotifierProvider.autoDispose<
//     ProfileScreenController,
//     ProfileScreenState>(() => ProfileScreenController(), dependencies: [
//   currentProfileIdProvider,
//   myIdProvider,
//   profileRepositoryProvider
// ]);
