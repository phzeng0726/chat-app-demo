import 'package:chat_app_demo/application/auth/auth_cubit.dart';
import 'package:chat_app_demo/application/auth/sign_in_form/sign_in_form_cubit.dart';
import 'package:chat_app_demo/constants.dart';
import 'package:chat_app_demo/domain/auth/i_auth_facade.dart';
import 'package:chat_app_demo/injection.dart';
import 'package:chat_app_demo/presentation/sign_in/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInFormCubit(getIt<IAuthFacade>()),
      child: BlocBuilder<AuthCubit, AuthState>(builder: ((context, state) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding * 4,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SignInForm(),
                  ElevatedButton(onPressed: () {}, child: Text('註冊')),
                  if (state.status == const AuthStatus.inProgress()) ...const [
                    Text('登入中'),
                    SizedBox(height: 12.0),
                    LinearProgressIndicator()
                  ]
                ],
              ),
            ),
          ),
        );
      })),
    );
  }
}
