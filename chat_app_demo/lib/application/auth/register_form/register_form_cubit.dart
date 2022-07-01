import 'package:chat_app_demo/domain/auth/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/auth/auth_failure.dart';
import '../../../domain/auth/i_auth_facade.dart';

part 'register_form_state.dart';
part 'register_form_cubit.freezed.dart';

class RegisterFormCubit extends Cubit<RegisterFormState> {
  final IAuthFacade _authFacade;
  RegisterFormCubit(this._authFacade) : super(RegisterFormState.initial());

  void emailAddressChanged(String emailAddressStr) {
    emit(
      state.copyWith(
        emailAddress: emailAddressStr,
      ),
    );
  }

  void passwordChanged(String passwordStr) {
    emit(
      state.copyWith(
        password: passwordStr,
      ),
    );
  }

  void checkPasswordChanged(String passwordStr) {
    emit(
      state.copyWith(
        password: passwordStr,
      ),
    );
  }

  void passwordVisibleSwitched() {
    emit(
      state.copyWith(isPWObscure: !state.isPWObscure),
    );
  }

  Future<void> registerWithEmailAndPasswordPressed() async {
    Either<AuthFailure, String> failureOrSuccess;

    emit(
      state.copyWith(
        isSubmitting: true,
        validate: true,
        authFailureOrSuccessOption: none(),
      ),
    );

    failureOrSuccess = await _authFacade.register(
      emailAddress: state.emailAddress,
      password: state.password,
    );

    emit(
      state.copyWith(
        isSubmitting: false,
        // showErrorMessages: true,
        authFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }

  @override
  Future<void> close() async {
    return super.close();
  }
}
