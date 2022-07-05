part of 'user_profile_edit_cubit.dart';

@freezed
class UserProfileEditState with _$UserProfileEditState {
  const UserProfileEditState._();
  const factory UserProfileEditState({
    required User user,
    required bool isUpdating,
    required bool isUploadingImage,
    required Option<HomeFailure> failureOption,
  }) = _UserProfileEditState;

  factory UserProfileEditState.initial() => UserProfileEditState(
        user: User.empty(),
        isUpdating: false,
        isUploadingImage: false,
        failureOption: none(),
      );
}
