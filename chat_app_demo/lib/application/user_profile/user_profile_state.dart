part of 'user_profile_cubit.dart';

// 登入之後獲取company跟user之類的都在這
@freezed
class UserProfileState with _$UserProfileState {
  const UserProfileState._();
  const factory UserProfileState({
    // required CompanyInfo companyInfo,
    required User user,
    // required LoadStatus loadStatus,
    required bool isUpdating,

    // required Option<AuthFailure> authFailureOption,
    // required LoadStatus loadStatus,
  }) = _UserProfileState;

  factory UserProfileState.initial() => UserProfileState(
        // companyInfo: CompanyInfo.empty(),
        user: User.empty(),
        // loadStatus: const LoadStatus.initial(),
        isUpdating: false,
        // authFailureOption: none(),
        // loadStatus: const LoadStatus.initial(),
      );
}
