import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/auth/auth_failure.dart';
import '../../../domain/auth/i_auth_facade.dart';

part 'sign_in_form_cubit.freezed.dart';
part 'sign_in_form_state.dart';

class SignInFormCubit extends Cubit<SignInFormState> {
  final IAuthFacade _authFacade;
  SignInFormCubit(this._authFacade) : super(SignInFormState.initial());

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

  void passwordVisibleSwitched() {
    emit(
      state.copyWith(isPWObscure: !state.isPWObscure),
    );
  }

  Future<void> signInWithEmailAndPasswordPressed() async {
    Either<AuthFailure, String> failureOrSuccess;

    emit(
      state.copyWith(
        isSubmitting: true,
        validate: true,
        authFailureOrSuccessOption: none(),
      ),
    );

    failureOrSuccess = await _authFacade.signIn(
      emailAddress: state.emailAddress,
      password: state.password,
    );

    emit(
      state.copyWith(
        isSubmitting: false,
        authFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }

  @override
  Future<void> close() async {
    return super.close();
  }
}
