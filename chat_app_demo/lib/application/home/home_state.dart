part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState._();
  const factory HomeState({
    required String emailAddress,
    // 可能要改Option，因為有可能為空
    required List<User> searchedUserList,
    required LoadStatus searchStatus,
    required List<User> friendList,
    required LoadStatus friendListLoadStatus,
    required Option<HomeFailure> failureOption,
  }) = _HomeState;

  factory HomeState.initial() => HomeState(
        emailAddress: '',
        searchedUserList: <User>[],
        searchStatus: const LoadStatus.initial(),
        friendList: <User>[],
        friendListLoadStatus: const LoadStatus.initial(),
        failureOption: none(),
      );
}
