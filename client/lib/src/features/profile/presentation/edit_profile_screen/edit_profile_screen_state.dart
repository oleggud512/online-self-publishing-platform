import 'package:client/src/features/profile/domain/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_screen_state.freezed.dart';

@freezed
class EditProfileScreenState with _$EditProfileScreenState {
  factory EditProfileScreenState({
    required Profile originalProfile,
  }) = _EditProfileScreenState;

  factory EditProfileScreenState.start(Profile profile) {
    return EditProfileScreenState(
      originalProfile: profile,
    );
  }
}