part of 'user_profile_cubit.dart';

@freezed
class UserProfileState with _$UserProfileState {
  const UserProfileState._();
  const factory UserProfileState({
    required User user,
    required bool isUpdating,
    required bool isUploadingImage,
    required Option<HomeFailure> failureOption,
  }) = _UserProfileState;

  factory UserProfileState.initial() => UserProfileState(
        user: User.empty(),
        isUpdating: false,
        isUploadingImage: false,
        failureOption: none(),
      );
}
