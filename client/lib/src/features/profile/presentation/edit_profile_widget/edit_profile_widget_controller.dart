import 'dart:io';

import 'package:client/src/common/log.dart';
import 'package:client/src/features/profile/domain/profile.dart';
import 'package:client/src/shared/utils.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/currently_edited_profile.dart';
import '../../data/profile_repository.dart';
import 'edit_profile_widget_state.dart';

// part 'edit_profile_widget_controller.g.dart';

class EditProfileWidgetController extends AutoDisposeNotifier<EditProfileWidgetState> {
  ProfileRepository get profileRepo => ref.watch(profileRepositoryProvider);
  
  @override
  EditProfileWidgetState build() {
    printInfo("EditProfileWidgetController build()");
    Future(() => updateName(state.profile.name));
    return EditProfileWidgetState(
      profile: ref.read(currentlyEditedProfileProvider).copyWith()
    );
  }

  Future<void> updateName(String newName) async {
    printInfo('trying to update name to $newName');
    final isUnique = await profileRepo.isUniqueName(newName);
    printInfo("isUnique = $isUnique");
    state = state.copyWith(
      isUniqueName: isUnique,
      profile: state.profile.copyWith(
        name: isUnique ? newName : state.profile.name
      ),
    );
    ref.watch(currentlyEditedProfileProvider.notifier).state = 
      state.profile.copyWith();
  }

  set gender(Gender g) {
    state = state.copyWith(profile: state.profile.copyWith(gender: g));
    ref.watch(currentlyEditedProfileProvider.notifier).state = 
      state.profile.copyWith();
  }
  set displayName(String dn) {
    state = state.copyWith(profile: state.profile.copyWith(displayName: dn.isEmpty ? null : dn));
    ref.watch(currentlyEditedProfileProvider.notifier).state = 
      state.profile.copyWith();
  }
  set age(int? a) {
    state = state.copyWith(profile: state.profile.copyWith(age: a == 0 ? null : a));
    ref.watch(currentlyEditedProfileProvider.notifier).state = 
      state.profile.copyWith();
  }
  set description(String ds) {
    state = state.copyWith(profile: state.profile.copyWith(description: ds.isEmpty ? null : ds));
    ref.watch(currentlyEditedProfileProvider.notifier).state = 
      state.profile.copyWith();
  }

  Future<void> chooseImage() async {
    String? path = await Utils.pickImage();
    state = state.copyWith(profile: state.profile.copyWith(avatarUrl: path));
    ref.watch(currentlyEditedProfileProvider.notifier).state = 
      state.profile.copyWith();
  }
}

final editProfileWidgetControllerProvider = NotifierProvider.autoDispose<
  EditProfileWidgetController,
  EditProfileWidgetState
>(
  () => EditProfileWidgetController(),
  dependencies: [
    currentlyEditedProfileProvider,
    profileRepositoryProvider
  ]
);