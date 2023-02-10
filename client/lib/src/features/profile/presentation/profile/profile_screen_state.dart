import 'package:client/src/features/profile/domain/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_screen_state.freezed.dart';

@freezed
class ProfileScreenState with _$ProfileScreenState {
  factory ProfileScreenState({
    required Profile profile,
    @Default(false) bool isSubscribed, // do I subscribed on this profile?
    @Default(false) bool isMy
  }) = _ProfileScreenState;
}