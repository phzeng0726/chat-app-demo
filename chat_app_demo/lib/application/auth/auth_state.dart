part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState({
    required User user,
    required AuthStatus status,
    required Option<AuthFailure> authFailureOption,
  }) = _AuthState;

  factory AuthState.initial() => AuthState(
        user: User.empty(),
        status: const AuthStatus.initial(),
        authFailureOption: none(),
      );
}

@freezed
class AuthStatus with _$AuthStatus {
  const factory AuthStatus.initial() = _Initial;
  const factory AuthStatus.inProgress() = _InProgress;
  const factory AuthStatus.authenticated() = _Authenticated;
  const factory AuthStatus.unauthenticated() = _Unauthenticated;
}
