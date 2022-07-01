part of 'auth_cubit.dart';

// 登入之後獲取company跟user之類的都在這
@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState({
    // required CompanyInfo companyInfo,
    required User user,
    required AuthStatus status,
    required Option<AuthFailure> authFailureOption,
    // required LoadStatus loadStatus,
  }) = _AuthState;

  factory AuthState.initial() => AuthState(
        // companyInfo: CompanyInfo.empty(),
        user: User.empty(),
        status: const AuthStatus.initial(),
        authFailureOption: none(),
        // loadStatus: const LoadStatus.initial(),
      );
}

@freezed
class AuthStatus with _$AuthStatus {
  const factory AuthStatus.initial() = _Initial;
  const factory AuthStatus.inProgress() = _InProgress;
  const factory AuthStatus.authenticated() = _Authenticated;
  const factory AuthStatus.unauthenticated() = _Unauthenticated;
}
