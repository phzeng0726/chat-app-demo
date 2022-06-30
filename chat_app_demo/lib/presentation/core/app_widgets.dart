import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/auth_cubit.dart';
import '../../domain/auth/i_auth_facade.dart';
import '../../injection.dart';
import '../routes/router.gr.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rootRouter = getIt<RootRouter>();

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(
              getIt<IAuthFacade>(),
            )..authCheckRequested(),
          ),
        ],
        child: MaterialApp.router(
          // title: FlutterBlocLocalizations().appTitle,
          debugShowCheckedModeBanner: false,
          // theme: state.themeData,
          // localizationsDelegates: const [GlobalMaterialLocalizations.delegate],
          supportedLocales: const [Locale('en'), Locale('zh', 'TW')],
          // onGenerateRoute: AppRouter.onGenerateRoute,
          // initialRoute: SplashScreen.routeName,
          // builder: ExtendedNavigator.builder(router: app_router.Router()),
          routerDelegate: rootRouter.delegate(),
          routeInformationParser: rootRouter.defaultRouteParser(),
        ));
  }
}
