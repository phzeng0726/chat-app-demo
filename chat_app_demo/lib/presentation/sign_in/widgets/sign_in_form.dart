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
                FlushbarHelper.createError(
                    message: failure.map(
                  serverError: (_) => FlutterI18n.translate(
                      context, "auth.authError.serverError"),
                  unexpected: (_) => FlutterI18n.translate(
                      context, "auth.authError.unexpected"),
                  insufficientPermission: (_) => FlutterI18n.translate(
                      context, "auth.authError.insufficientPermission"),
                  invalidEmailAndPassword: (_) => FlutterI18n.translate(context,
                      "auth.authError.invalidEmailAndPassword"), // 只有sign_in才有這個
                  emailAddressAlreadyInUse: (_) => FlutterI18n.translate(
                      context,
                      "auth.authError.emailAddressAlreadyInUse"), // 只有register才有這個
                  invalidEmail: (_) => FlutterI18n.translate(
                      context, "auth.authError.invalidEmail"), // 只有register才有這個
                  weakPassword: (_) => FlutterI18n.translate(
                      context, "auth.authError.weakPassword"), // 只有register才有這個
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
        return Expanded(
          child: ListView(
            children: [
              const EmailAddressBox(),
              const PasswordBox(),
              const SizedBox(height: kDefaultHeightSize),
              SizedBox(
                width: double.infinity, // <-- match_parent
                child: ElevatedButton(
                  child: Text(FlutterI18n.translate(context, "auth.login")),
                  onPressed: () => context
                      .read<SignInFormCubit>()
                      .signInWithEmailAndPasswordPressed(),
                ),
              ),
              const SizedBox(
                height: kDefaultHeightSize,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1?.color,
                    ),
                    children: [
                      TextSpan(
                        text: FlutterI18n.translate(
                            context, "auth.notRegistered"),
                      ),
                      const TextSpan(
                        text: "  ",
                      ),
                      TextSpan(
                        text: FlutterI18n.translate(
                            context, "auth.createAnAccount"),
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
              ),
              const SizedBox(
                height: kDefaultHeightSize,
              ),
              if (state.isSubmitting) ...[
                Center(
                  child: Text(
                    FlutterI18n.translate(context, "auth.submitting"),
                  ),
                ),
                const SizedBox(height: kDefaultHeightSize / 2),
                const LinearProgressIndicator()
              ]
            ],
          ),
        );
      },
    );
  }
}
