part of 'home_cubit.dart';

// 登入之後獲取company跟user之類的都在這
@freezed
class HomeState with _$HomeState {
  const HomeState._();
  const factory HomeState({
    // required CompanyInfo companyInfo,
    required String emailAddress,
    // 可能要改Option，因為有可能為空
    required List<User> searchedUserList,
    required LoadStatus searchStatus,
    required List<User> friendList,
    required LoadStatus friendListLoadStatus,
    required Option<ChatFailure> chatFailureOption,
    // required Option<ChatWatcherFailure> ChatWatcherFailureOption,
    // required LoadStatus loadStatus,
  }) = _HomeState;

  factory HomeState.initial() => HomeState(
        emailAddress: 'testEmail2@gmail.com',
        searchedUserList: <User>[],
        searchStatus: const LoadStatus.initial(),
        friendList: <User>[],
        friendListLoadStatus: const LoadStatus.initial(),
        chatFailureOption: none(),
      );
}
