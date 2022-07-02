import 'package:auto_route/auto_route.dart';
import 'package:chat_app_demo/presentation/chat/chat_page.dart';
import 'package:chat_app_demo/presentation/register/register_page.dart';
import 'package:chat_app_demo/presentation/sign_in/sign_in_page.dart';
import '../home/home.dart';
import '../splash/splash_page.dart';

// https://www.youtube.com/watch?v=9oH42_Axr3Q
// TODO: 記得修改path
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

        // AutoRoute(page: UnauthHomePage, path: 'unauth-home', initial: true),
        // AutoRoute(page: SignInPage, path: 'sign-in'),
        // AutoRoute(page: RegisterPage, path: 'sign-up'),
        // AutoRoute(
        //   page: HomePage,
        //   path: 'home',
        //   initial: true,
        //   children: [
        //     AutoRoute(
        //       page: EmptyRouterPage,
        //       name: 'CompanyInfoRouter',
        //       path: 'company-info',
        //       children: [
        //         AutoRoute(
        //           page: CompanyInfoPage,
        //           path: ':companyId',
        //         ),
        //         AutoRoute(
        //           page: CompanyInfoEditPage,
        //           path: 'edit/:companyId',
        //         ),
        //       ],
        //     ),
        //     AutoRoute(
        //       page: EmptyRouterPage,
        //       name: 'JobOpeningOrTenderRouter',
        //       path: 'job-opening-or-tender',
        //       children: [
        //         AutoRoute(
        //           page: JobOpeningOrTenderPage,
        //           path: ':companyId',
        //         ),
        //         AutoRoute(
        //           page: JobOpeningFormPage,
        //           path: 'job-opening-edit/:companyId',
        //         ),
        //         AutoRoute(
        //           page: TenderFormPage,
        //           path: 'tender-edit/:companyId',
        //         ),
        //       ],
        //     ),
        //     AutoRoute(
        //       page: EmptyRouterPage,
        //       name: 'JobApplyOrTenderApplyRouter',
        //       path: 'job-apply-or-tender-apply',
        //       children: [
        //         AutoRoute(
        //           page: JobApplyOrTenderApplyPage,
        //           path: ':jobId',
        //         ),
        //         // AutoRoute(
        //         //   page: JobOpeningFormPage,
        //         //   path: 'job-opening-edit/:companyId',
        //         // ),
        //         // AutoRoute(
        //         //   page: TenderFormPage,
        //         //   path: 'tender-edit/:companyId',
        //         // ),
        //       ],
        //     ),
        //     // AutoRoute(page: JobOpeningOrTenderPage, path: 'job-opening'),
        //     // AutoRoute(page: JobOpeningFormPage, path: 'job-opening-form'),
        //     AutoRoute(page: EmployeeSearchPage, path: 'employee-search'),
      ],
    ),
  ],
)
class $RootRouter {}
// TODO: