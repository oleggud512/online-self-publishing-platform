import 'dart:async';
import 'dart:io';

import 'package:client/src/common/log.dart';
import 'package:client/src/common/pub_sub.dart';
import 'package:client/src/features/profile/application/currently_edited_profile.dart';
import 'package:client/src/features/profile/presentation/edit_profile_widget/edit_profile_widget_controller.dart';
import 'package:client/src/shared/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/profile_repository.dart';
import '../../domain/profile.dart';
import 'edit_profile_screen_state.dart';

class ProfileEditedPubSubEvent extends PubSubEvent { }

class EditProfileScreenController 
    extends AutoDisposeAsyncNotifier<EditProfileScreenState> {
  ProfileRepository get profileRepo => ref.watch(profileRepositoryProvider);

  @override
  FutureOr<EditProfileScreenState> build() async {
    final profile = ref.read(currentlyEditedProfileProvider);
    return EditProfileScreenState.start(profile.copyWith());
  }

  Future<bool> saveProfile() async {
    Profile editedProfile = ref.watch(currentlyEditedProfileProvider);

    if (editedProfile.avatarUrl != null && !editedProfile.avatarUrl!.startsWith('https://')) {
      var avatarUrl = await Utils.saveToFirebase(
        'avatars/${editedProfile.id}', 
        File(editedProfile.avatarUrl!)
      );
      editedProfile = editedProfile.copyWith(avatarUrl: avatarUrl);
      printInfo('saving with image: $avatarUrl');
    } else {
      /// do nothing
      printInfo("saving with no image");
    }

    printInfo("---- before update: ${editedProfile.toJson()}");
    if (!ref.watch(editProfileWidgetControllerProvider).isUniqueName) return false;
    
    await profileRepo.updateProfile(editedProfile);
    printInfo("saved");
    ref.read(pubSub.notifier).state = ProfileEditedPubSubEvent();
    return true;
  }
}

final editProfileScreenControllerProvider = AutoDisposeAsyncNotifierProvider<
  EditProfileScreenController,
  EditProfileScreenState
>(
  () {
    return EditProfileScreenController();
  },
  dependencies: [
    profileRepositoryProvider,
    currentlyEditedProfileProvider,
    editProfileWidgetControllerProvider,
  ]
);