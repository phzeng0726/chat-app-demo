import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app_demo/presentation/core/widgets/translation_helper.dart';
import '../../../application/auth/register_form/register_form_cubit.dart';
import '../../../constants.dart';
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
                FlushbarHelper.createError(
                    message: failure.map(
                  serverError: (_) => tr(context, "auth.authError.serverError"),
                  unexpected: (_) => tr(context, "auth.authError.unexpected"),
                  insufficientPermission: (_) =>
                      tr(context, "auth.authError.insufficientPermission"),
                  invalidEmailAndPassword: (_) => tr(context,
                      "auth.authError.invalidEmailAndPassword"), // 只有sign_in才有這個
                  emailAddressAlreadyInUse: (_) => tr(context,
                      "auth.authError.emailAddressAlreadyInUse"), // 只有register才有這個
                  invalidEmail: (_) => tr(
                      context, "auth.authError.invalidEmail"), // 只有register才有這個
                  weakPassword: (_) => tr(
                      context, "auth.authError.weakPassword"), // 只有register才有這個
                )).show(context);
              },
              (_) {
                return showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(tr(context, "auth.register.dialogTitle")),
                    content: Text(tr(context, "auth.register.dialogContent")),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          getIt<RootRouter>().pushNamed('/auth');
                        },
                        child:
                            Text(tr(context, "auth.register.dialogButtonText")),
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
        return Expanded(
          child: ListView(
            children: [
              const EmailAddressBox(),
              const PasswordBox(),
              const SizedBox(
                height: kDefaultHeightSize,
              ),
              ElevatedButton(
                child: Text(tr(context, "auth.register.title")),
                onPressed: () {
                  context
                      .read<RegisterFormCubit>()
                      .registerWithEmailAndPasswordPressed();
                },
              ),
              const SizedBox(
                height: kDefaultHeightSize,
              ),
              if (state.isSubmitting) ...[
                Center(
                  child: Text(
                    tr(context, "auth.register.submitting"),
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
