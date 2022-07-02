import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/auth_cubit.dart';
import '../../application/auth/register_form/register_form_cubit.dart';
import '../../constants.dart';
import '../../domain/auth/i_auth_facade.dart';
import '../../injection.dart';
import 'widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterFormCubit(getIt<IAuthFacade>()),
      child: BlocBuilder<AuthCubit, AuthState>(builder: ((context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('註冊'),
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
        );
      })),
    );
  }
}
