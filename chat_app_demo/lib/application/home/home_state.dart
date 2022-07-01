part of 'home_cubit.dart';

// 登入之後獲取company跟user之類的都在這
@freezed
class HomeState with _$HomeState {
  const HomeState._();
  const factory HomeState({
    // required CompanyInfo companyInfo,
    required String emailAddress,
    required List<User> searchUserList,
    required LoadStatus searchStatus,
    // required Option<ChatWatcherFailure> ChatWatcherFailureOption,
    // required LoadStatus loadStatus,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
        emailAddress: 'testEmail2@gmail.com',
        searchUserList: <User>[],
        searchStatus: LoadStatus.initial(),
      );
}
