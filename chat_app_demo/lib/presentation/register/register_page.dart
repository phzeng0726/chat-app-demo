import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

import '../../application/auth/auth_cubit.dart';
import '../../application/auth/register_form/register_form_cubit.dart';
import '../../constants.dart';
import '../../domain/auth/i_auth_facade.dart';
import '../../injection.dart';
import '../core/widgets/tap_out_dismiss_keyboard.dart';
import 'widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterFormCubit(getIt<IAuthFacade>()),
      child: BlocBuilder<AuthCubit, AuthState>(builder: ((context, state) {
        return TapOutDismissKeyboard(
          child: Scaffold(
            appBar: AppBar(
              title:
                  Text(FlutterI18n.translate(context, "auth.register.title")),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding * 4,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  RegisterForm(),
                ],
              ),
            ),
          ),
        );
      })),
    );
  }
}
