part of 'sign_in_form_cubit.dart';

@freezed
abstract class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required String emailAddress,
    required String password,
    String? checkPassword,
    required bool isSubmitting,
    required Option<Either<AuthFailure, String>> authFailureOrSuccessOption,
    required bool isPWObscure, // 密碼是否隱藏
    required bool validate, // 是否驗證過
  }) = _SignInFormState;

  factory SignInFormState.initial() => SignInFormState(
        emailAddress: 'testEmail@gmail.com',
        password: 'aaaaaa',
        checkPassword: '',
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
        isPWObscure: true,
        validate: false,
      );
}
