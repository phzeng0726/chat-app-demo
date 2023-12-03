import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/auth/auth_failure.dart';
import '../../domain/auth/i_auth_facade.dart';
import '../../domain/auth/user.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IAuthFacade _authFacade;
  AuthCubit(this._authFacade) : super(AuthState.initial());

  StreamSubscription<Either<AuthFailure, User>>? _userDataSubscription;

  Future<void> authCheckRequested() async {
    emit(
      state.copyWith(
        status: const AuthStatus.inProgress(),
      ),
    );
    // Get the signed in user's userId.
    final userIdOption = await _authFacade.getSignedInUserId();

    userIdOption.fold(
        () => emit(
              state.copyWith(
                status: const AuthStatus.unauthenticated(),
              ),
            ), (userId) async {
      await _userDataSubscription?.cancel();
      _userDataSubscription = _authFacade.watchUserData(userId: userId).listen(
            (failureOrUser) => userDataReceived(failureOrUser),
          );
    });
  }

  void userDataReceived(
    Either<AuthFailure, User> failureOrUser,
  ) async {
    // NOTE: firebase_auth 裡面成登入成功，但 userData 卻搜尋失敗
    failureOrUser.fold(
      (f) => emit(
        state.copyWith(
          authFailureOption: some(f),
          status: const AuthStatus.unauthenticated(),
        ),
      ),
      (user) => emit(
        state.copyWith(
          user: user,
          authFailureOption: none(),
          status: const AuthStatus.authenticated(),
        ),
      ),
    );
  }

  void signedOut() async {
    await _authFacade.signOut();
    emit(
      state.copyWith(
        status: const AuthStatus.unauthenticated(),
      ),
    );
  }

  @override
  Future<void> close() async {
    await _userDataSubscription?.cancel();
    return super.close();
  }
}
