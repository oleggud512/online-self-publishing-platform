import 'package:client/src/features/profile/domain/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_screen_state.freezed.dart';

@freezed
class EditProfileScreenState with _$EditProfileScreenState {
  factory EditProfileScreenState({
    required Profile originalProfile,
    required Profile editedProfile, // TODO: убрать это. Оно не нужно в этом виджете. 
  }) = _EditProfileScreenState;

  factory EditProfileScreenState.start(Profile profile) {
    return EditProfileScreenState(
      originalProfile: profile,
      editedProfile: profile.copyWith(), 
    );
  }
}