import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../application/auth/auth_cubit.dart';
import '../../application/theme/theme_cubit.dart';
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
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(
            getIt<IAuthFacade>(),
          )..authCheckRequested(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            // title: FlutterBlocLocalizations().appTitle,
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
            localizationsDelegates: [
              FlutterI18nDelegate(
                translationLoader: FileTranslationLoader(
                  useCountryCode: true,
                  fallbackFile: 'zh_tw',
                  basePath: 'assets/i18n',
                  forcedLocale: state.currentLang,
                ),
              ),
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
            ],
            supportedLocales: const [Locale('en','US'), Locale('zh', 'TW')],
            // onGenerateRoute: AppRouter.onGenerateRoute,
            // initialRoute: SplashScreen.routeName,
            // builder: ExtendedNavigator.builder(router: app_router.Router()),
            routerDelegate: rootRouter.delegate(),
            routeInformationParser: rootRouter.defaultRouteParser(),
          );
        },
      ),
    );
  }
}
