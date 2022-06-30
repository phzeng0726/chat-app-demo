import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/auth/i_auth_facade.dart';
import '../../domain/auth/user.dart';
import '../../domain/core/logger.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IAuthFacade _authFacade;
  AuthCubit(this._authFacade) : super(AuthState.initial());

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
      final userOption = await _authFacade.getSignedInUser();
      print('2');

      userOption.fold(
          () => emit(
                state.copyWith(
                  status: const AuthStatus.unauthenticated(),
                ),
              ), (user) async {
        emit(
          state.copyWith(
            user: user,
            // loadStatus: const LoadStatus.succeed(),
            status: const AuthStatus.authenticated(),
          ),
        );
      });
    } catch (e) {
      LoggerService.simple.i('[AuthCubit] $e');
    }
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
