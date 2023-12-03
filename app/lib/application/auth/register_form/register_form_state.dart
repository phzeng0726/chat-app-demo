part of 'register_form_cubit.dart';

@freezed
abstract class RegisterFormState with _$RegisterFormState {
  const factory RegisterFormState({
    required String emailAddress,
    required String password,
    required String checkPassword,
    required bool isSubmitting,
    required Option<Either<AuthFailure, String>> authFailureOrSuccessOption,
    required bool isPWObscure, // 密碼是否隱藏
    required bool validate, // 是否驗證過
  }) = _RegisterFormState;

  factory RegisterFormState.initial() => RegisterFormState(
        emailAddress: '',
        password: '',
        checkPassword: '',
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
        isPWObscure: true,
        validate: false,
      );
}
