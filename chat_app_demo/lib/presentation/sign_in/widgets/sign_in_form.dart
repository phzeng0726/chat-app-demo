import 'package:chat_app_demo/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:another_flushbar/flushbar_helper.dart';

import '../../../application/auth/auth_cubit.dart';
import '../../../application/auth/sign_in_form/sign_in_form_cubit.dart';
import '../../../domain/core/logger.dart';
import 'email_address_box.dart';
import 'password_box.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormCubit, SignInFormState>(
      listenWhen: (p, c) =>
          p.authFailureOrSuccessOption != c.authFailureOrSuccessOption,
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) {
            either.fold(
              (failure) {
                LoggerService.simple.i(failure);

                FlushbarHelper.createError(
                    message: failure.map(
                  serverError: (_) => '伺服器有問題，請稍候再試',
                  unexpected: (_) => '未知的錯誤',
                  insufficientPermission: (_) => '沒有權限',
                  invalidEmailAndPassword: (_) => '帳號或密碼錯誤', // 只有sign_in才有這個
                  emailAddressAlreadyInUse: (_) => '帳號密碼已被使用', // 只有register才有這個
                  invalidEmail: (_) => 'Email格式有誤', // 只有register才有這個
                  weakPassword: (_) => '密碼強度太弱', // 只有register才有這個
                )).show(context);
              },
              (_) {
                context.read<AuthCubit>().authCheckRequested();
              },
            );
          },
        );
      },
      builder: (context, state) {
        return Column(
          children: [
            const EmailAddressBox(),
            const PasswordBox(),
            const SizedBox(height: kDefaultHeightSize),
            ElevatedButton(
              child: const Text('登入'),
              onPressed: () => context
                  .read<SignInFormCubit>()
                  .signInWithEmailAndPasswordPressed(),
            ),
            if (state.isSubmitting) ...const [
              Text('登入中'),
              SizedBox(height: 12.0),
              LinearProgressIndicator()
            ]
          ],
        );
      },
    );
  }
}
