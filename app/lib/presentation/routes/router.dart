import 'package:auto_route/auto_route.dart';

import '../chat/chat_page.dart';
import '../home/home.dart';
import '../register/register_page.dart';
import '../setting/setting_page.dart';
import '../setting/widgets/introduction_page.dart';
import '../setting/widgets/langrage_select_page.dart';
import '../sign_in/sign_in_page.dart';
import '../splash/splash_page.dart';
import '../user_profile/user_profile_edit_page.dart';
import '../user_profile/user_profile_page.dart';

// https://www.youtube.com/watch?v=9oH42_Axr3Q
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route', // NOTE: 將前者取代為後者，ex: HomePage => HomeRoute
  routes: <AutoRoute>[
    AutoRoute(
      page: EmptyRouterPage,
      path: '/',
      // initial: true,
      children: [
        AutoRoute(page: SplashPage, path: '', initial: true),
        AutoRoute(
          page: EmptyRouterPage,
          path: 'auth',
          name: 'AuthRouter',
          children: [
            AutoRoute(page: SignInPage, path: ''),
            AutoRoute(page: RegisterPage, path: 'register'),
          ],
        ),

        AutoRoute(page: HomePage, path: 'home'),
        AutoRoute(page: ChatPage, path: 'chat'),
        AutoRoute(page: UserProfilePage, path: 'profile'),
        AutoRoute(page: UserProfileEditPage, path: 'edit'),
        AutoRoute(page: SettingPage, path: 'setting'),
        AutoRoute(page: LangrageSelectPage, path: 'langrage-select'),
        AutoRoute(page: IntroductionPage, path: 'introduction'),
        
      ],
    ),
  ],
)
class $RootRouter {}
