import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/auth_cubit.dart';
import '../../application/home/home_cubit.dart';
import '../../application/user_profile_edit/user_profile_edit_cubit.dart';
import '../../injection.dart';
import '../routes/router.gr.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listenWhen: (p, c) =>
              p.status != c.status && c.status != const AuthStatus.inProgress(),
          listener: (context, state) async {
            state.status.map(
              initial: (_) {},
              inProgress: (_) {},
              authenticated: (_) => getIt<RootRouter>().pushNamed('/home'),
              unauthenticated: (_) => getIt<RootRouter>().pushNamed('/auth'),
            );
          },
        ),
        BlocListener<AuthCubit, AuthState>(
          listenWhen: (p, c) =>
              p.user != c.user && c.status == const AuthStatus.authenticated(),
          listener: (context, state) async {
            context.read<HomeCubit>().init(user: state.user);
            context.read<UserProfileEditCubit>().init(user: state.user);
          },
        ),
      ],
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
