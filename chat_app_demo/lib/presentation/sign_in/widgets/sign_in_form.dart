import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../../../application/auth/auth_cubit.dart';
import '../../../application/auth/sign_in_form/sign_in_form_cubit.dart';
import '../../../constants.dart';
import '../../../domain/core/logger.dart';
import '../../../injection.dart';
import '../../routes/router.gr.dart';
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
                  serverError: (_) => FlutterI18n.translate(
                      context, "login.authError.serverError"),
                  unexpected: (_) => FlutterI18n.translate(
                      context, "login.authError.unexpected"),
                  insufficientPermission: (_) => FlutterI18n.translate(
                      context, "login.authError.insufficientPermission"),
                  invalidEmailAndPassword: (_) => FlutterI18n.translate(
                      context, "login.authError.invalidEmailAndPassword"), // 只有sign_in才有這個
                  emailAddressAlreadyInUse: (_) => FlutterI18n.translate(
                      context, "login.authError.emailAddressAlreadyInUse"), // 只有register才有這個
                  invalidEmail: (_) => FlutterI18n.translate(
                      context, "login.authError.invalidEmail"), // 只有register才有這個
                  weakPassword: (_) => FlutterI18n.translate(
                      context, "login.authError.weakPassword"), // 只有register才有這個
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
            SizedBox(
              width: double.infinity, // <-- match_parent
              child: ElevatedButton(
                child: Text(FlutterI18n.translate(context, "login.login")),
                onPressed: () => context
                    .read<SignInFormCubit>()
                    .signInWithEmailAndPasswordPressed(),
              ),
            ),
            const SizedBox(
              height: kDefaultHeightSize,
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1?.color,
                ),
                children: [
                  TextSpan(
                    text: FlutterI18n.translate(context, "login.notRegistered"),
                  ),
                  const TextSpan(
                    text: "  ",
                  ),
                  TextSpan(
                    text:
                        FlutterI18n.translate(context, "login.createAnAccount"),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        getIt<RootRouter>().push(const RegisterRoute());
                      },
                  ),
                ],
              ),
            ),
            if (state.isSubmitting) ...[
              Text(
                FlutterI18n.translate(context, "login.submitting"),
              ),
              const SizedBox(height: kDefaultHeightSize / 2),
              const LinearProgressIndicator()
            ]
          ],
        );
      },
    );
  }
}
