import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/auth/auth_failure.dart';
import '../../domain/auth/i_auth_facade.dart';
import '../../domain/auth/user.dart';
import '../../domain/core/logger.dart';
import 'dart:async';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IAuthFacade _authFacade;
  AuthCubit(this._authFacade) : super(AuthState.initial());

  StreamSubscription<Either<AuthFailure, User>>? _userDataSubscription;

  Future<void> authCheckRequested() async {
    emit(
      state.copyWith(
        // loadStatus: const LoadStatus.inProgress(),
        status: const AuthStatus.inProgress(),
      ),
    );

    try {
      print('1');
      // 獲得signedIn的userId
      final userIdOption = await _authFacade.getSignedInUserId();
      print('2');

      userIdOption.fold(
          () => emit(
                state.copyWith(
                  status: const AuthStatus.unauthenticated(),
                ),
              ), (userId) async {
        await _userDataSubscription?.cancel();
        _userDataSubscription =
            _authFacade.watchUserData(userId: userId).listen(
                  (failureOrUser) => userDataReceived(failureOrUser),
                );
      });
    } catch (e) {
      LoggerService.simple.i('[AuthCubit] $e');
    }
  }

  void userDataReceived(
    Either<AuthFailure, User> failureOrUser,
  ) async {
    // NOTE: firebase_auth 裡面成登入成功，但 userData 卻搜尋失敗
    failureOrUser.fold(
      (f) => emit(
        state.copyWith(
          status: const AuthStatus.unauthenticated(),
        ),
      ),
      (user) => emit(
        state.copyWith(
          user: user,
          // loadStatus: const LoadStatus.succeed(),
          status: const AuthStatus.authenticated(),
        ),
      ),
    );
    print(state);
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
    // await _userDataSubscription?.cancel();
    return super.close();
  }
}
