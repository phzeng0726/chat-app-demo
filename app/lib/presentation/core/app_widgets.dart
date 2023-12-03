import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../application/auth/auth_cubit.dart';
import '../../application/home/home_cubit.dart';
import '../../application/theme/theme_cubit.dart';
import '../../application/user_profile_edit/user_profile_edit_cubit.dart';
import '../../constants.dart';
import '../../domain/auth/i_auth_facade.dart';
import '../../domain/home/i_home_repository.dart';
import '../../injection.dart';
import '../routes/router.gr.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rootRouter = getIt<RootRouter>();

    // 會同時出現在好幾個 page 的 provider 放這
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
        BlocProvider(
          create: (context) => UserProfileEditCubit(
            getIt<IHomeRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => HomeCubit(
            getIt<IHomeRepository>(),
          ),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
            localizationsDelegates: [
              FlutterI18nDelegate(
                translationLoader: FileTranslationLoader(
                  useCountryCode: true,
                  fallbackFile: localeMapList.first['id'],
                  basePath: 'assets/i18n',
                  forcedLocale: state.currentLang,
                ),
              ),
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
            ],
            supportedLocales: localeMapList.map((map) => map['locale']),
            routerDelegate: rootRouter.delegate(),
            routeInformationParser: rootRouter.defaultRouteParser(),
          );
        },
      ),
    );
  }
}
