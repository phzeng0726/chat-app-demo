import 'package:auto_route/auto_route.dart';
import 'package:chat_app_demo/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/auth_cubit.dart';
import '../routes/router.gr.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (p, c) =>
          p.status != c.status && c.status != const AuthStatus.inProgress(),
      listener: (context, state) {
        state.status.map(
          initial: (_) {},
          inProgress: (_) {},
          authenticated: (_) => getIt<RootRouter>().pushNamed('/home'),
          unauthenticated: (_) => getIt<RootRouter>().pushNamed('/auth'),
        );
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
