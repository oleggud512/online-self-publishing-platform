import 'package:client/src/features/profile/domain/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_widget_state.freezed.dart';

@freezed
class EditProfileWidgetState with _$EditProfileWidgetState {
  factory EditProfileWidgetState({
    required Profile profile,
    @Default(false) bool isUniqueName
  }) = _EditProfileWidgetState;
}