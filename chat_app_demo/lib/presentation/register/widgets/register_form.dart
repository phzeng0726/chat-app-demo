import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../../../../domain/core/logger.dart';
import '../../../application/auth/register_form/register_form_cubit.dart';
import '../../../injection.dart';
import '../../routes/router.gr.dart';
import 'email_address_box.dart';
import 'password_box.dart';

// TODO: [雙語]
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
                  serverError: (_) => FlutterI18n.translate(
                      context, "login.authError.serverError"),
                  unexpected: (_) => FlutterI18n.translate(
                      context, "login.authError.unexpected"),
                  insufficientPermission: (_) => FlutterI18n.translate(
                      context, "login.authError.insufficientPermission"),
                  invalidEmailAndPassword: (_) => FlutterI18n.translate(context,
                      "login.authError.invalidEmailAndPassword"), // 只有sign_in才有這個
                  emailAddressAlreadyInUse: (_) => FlutterI18n.translate(
                      context,
                      "login.authError.emailAddressAlreadyInUse"), // 只有register才有這個
                  invalidEmail: (_) => FlutterI18n.translate(context,
                      "login.authError.invalidEmail"), // 只有register才有這個
                  weakPassword: (_) => FlutterI18n.translate(context,
                      "login.authError.weakPassword"), // 只有register才有這個
                )).show(context);
              },
              (_) {
                return showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("恭喜！"),
                    content: const Text("您已成功註冊用戶"),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          getIt<RootRouter>().pushNamed('/auth');
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
