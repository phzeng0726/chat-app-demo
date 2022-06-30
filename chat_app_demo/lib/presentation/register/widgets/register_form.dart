import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/core/logger.dart';
import '../../../application/auth/register_form/register_form_cubit.dart';
import '../../../injection.dart';
import '../../routes/router.gr.dart';
import 'email_address_box.dart';
import 'password_box.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterFormCubit, RegisterFormState>(
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
                return showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text("恭喜！"),
                    content: const Text("您已成功註冊用戶"),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () async {
                          getIt<RootRouter>().pop();
                          getIt<RootRouter>().push(const SignInRoute());
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                );
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
            // const CheckPasswordBox(),
            ElevatedButton(
              child: const Text('註冊'),
              onPressed: () {
                context
                    .read<RegisterFormCubit>()
                    .registerWithEmailAndPasswordPressed();
              },
            ),
            if (state.isSubmitting) ...const [
              Text('註冊中'),
              SizedBox(height: 12.0),
              LinearProgressIndicator()
            ]
          ],
        );
      },
    );
  }
}
