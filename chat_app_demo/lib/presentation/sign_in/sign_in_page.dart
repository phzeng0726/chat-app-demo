import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app_demo/presentation/core/widgets/translation_helper.dart';
import '../../application/auth/sign_in_form/sign_in_form_cubit.dart';
import '../../constants.dart';
import '../../domain/auth/i_auth_facade.dart';
import '../../injection.dart';
import '../core/widgets/tap_out_dismiss_keyboard.dart';
import 'widgets/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: TapOutDismissKeyboard(
        child: Scaffold(
          appBar: AppBar(
            title: Text(tr(context, "auth.login")),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding * 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                BlocProvider(
                  create: (context) => SignInFormCubit(getIt<IAuthFacade>()),
                  child: const SignInForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
