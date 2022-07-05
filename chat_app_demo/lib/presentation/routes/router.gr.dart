// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i10;

import '../../domain/auth/user.dart' as _i11;
import '../chat/chat_page.dart' as _i4;
import '../home/home.dart' as _i3;
import '../register/register_page.dart' as _i9;
import '../setting/setting_page.dart' as _i7;
import '../sign_in/sign_in_page.dart' as _i8;
import '../splash/splash_page.dart' as _i2;
import '../user_profile/user_profile_edit_page.dart' as _i6;
import '../user_profile/user_profile_page.dart' as _i5;

class RootRouter extends _i1.RootStackRouter {
  RootRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    EmptyRouterRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.EmptyRouterPage());
    },
    SplashRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SplashPage());
    },
    AuthRouter.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.EmptyRouterPage());
    },
    HomeRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomePage());
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.ChatPage(key: args.key, otherUser: args.otherUser));
    },
    UserProfileRoute.name: (routeData) {
      final args = routeData.argsAs<UserProfileRouteArgs>();
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.UserProfilePage(key: args.key, user: args.user));
    },
    UserProfileEditRoute.name: (routeData) {
      final args = routeData.argsAs<UserProfileEditRouteArgs>();
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.UserProfileEditPage(
              key: args.key,
              editItemTitle: args.editItemTitle,
              itemString: args.itemString,
              textFormFieldWidget: args.textFormFieldWidget));
    },
    SettingRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.SettingPage());
    },
    SignInRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.SignInPage());
    },
    RegisterRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.RegisterPage());
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(EmptyRouterRoute.name, path: '/', children: [
          _i1.RouteConfig(SplashRoute.name,
              path: '', parent: EmptyRouterRoute.name),
          _i1.RouteConfig(AuthRouter.name,
              path: 'auth',
              parent: EmptyRouterRoute.name,
              children: [
                _i1.RouteConfig(SignInRoute.name,
                    path: '', parent: AuthRouter.name),
                _i1.RouteConfig(RegisterRoute.name,
                    path: 'register', parent: AuthRouter.name)
              ]),
          _i1.RouteConfig(HomeRoute.name,
              path: 'home', parent: EmptyRouterRoute.name),
          _i1.RouteConfig(ChatRoute.name,
              path: 'chat', parent: EmptyRouterRoute.name),
          _i1.RouteConfig(UserProfileRoute.name,
              path: 'profile', parent: EmptyRouterRoute.name),
          _i1.RouteConfig(UserProfileEditRoute.name,
              path: 'edit', parent: EmptyRouterRoute.name),
          _i1.RouteConfig(SettingRoute.name,
              path: 'setting', parent: EmptyRouterRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.EmptyRouterPage]
class EmptyRouterRoute extends _i1.PageRouteInfo<void> {
  const EmptyRouterRoute({List<_i1.PageRouteInfo>? children})
      : super(EmptyRouterRoute.name, path: '/', initialChildren: children);

  static const String name = 'EmptyRouterRoute';
}

/// generated route for
/// [_i2.SplashPage]
class SplashRoute extends _i1.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class AuthRouter extends _i1.PageRouteInfo<void> {
  const AuthRouter({List<_i1.PageRouteInfo>? children})
      : super(AuthRouter.name, path: 'auth', initialChildren: children);

  static const String name = 'AuthRouter';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i1.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.ChatPage]
class ChatRoute extends _i1.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({_i10.Key? key, required _i11.User otherUser})
      : super(ChatRoute.name,
            path: 'chat', args: ChatRouteArgs(key: key, otherUser: otherUser));

  static const String name = 'ChatRoute';
}

class ChatRouteArgs {
  const ChatRouteArgs({this.key, required this.otherUser});

  final _i10.Key? key;

  final _i11.User otherUser;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, otherUser: $otherUser}';
  }
}

/// generated route for
/// [_i5.UserProfilePage]
class UserProfileRoute extends _i1.PageRouteInfo<UserProfileRouteArgs> {
  UserProfileRoute({_i10.Key? key, required _i11.User user})
      : super(UserProfileRoute.name,
            path: 'profile', args: UserProfileRouteArgs(key: key, user: user));

  static const String name = 'UserProfileRoute';
}

class UserProfileRouteArgs {
  const UserProfileRouteArgs({this.key, required this.user});

  final _i10.Key? key;

  final _i11.User user;

  @override
  String toString() {
    return 'UserProfileRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i6.UserProfileEditPage]
class UserProfileEditRoute extends _i1.PageRouteInfo<UserProfileEditRouteArgs> {
  UserProfileEditRoute(
      {_i10.Key? key,
      required String editItemTitle,
      required String itemString,
      required _i10.Widget textFormFieldWidget})
      : super(UserProfileEditRoute.name,
            path: 'edit',
            args: UserProfileEditRouteArgs(
                key: key,
                editItemTitle: editItemTitle,
                itemString: itemString,
                textFormFieldWidget: textFormFieldWidget));

  static const String name = 'UserProfileEditRoute';
}

class UserProfileEditRouteArgs {
  const UserProfileEditRouteArgs(
      {this.key,
      required this.editItemTitle,
      required this.itemString,
      required this.textFormFieldWidget});

  final _i10.Key? key;

  final String editItemTitle;

  final String itemString;

  final _i10.Widget textFormFieldWidget;

  @override
  String toString() {
    return 'UserProfileEditRouteArgs{key: $key, editItemTitle: $editItemTitle, itemString: $itemString, textFormFieldWidget: $textFormFieldWidget}';
  }
}

/// generated route for
/// [_i7.SettingPage]
class SettingRoute extends _i1.PageRouteInfo<void> {
  const SettingRoute() : super(SettingRoute.name, path: 'setting');

  static const String name = 'SettingRoute';
}

/// generated route for
/// [_i8.SignInPage]
class SignInRoute extends _i1.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i9.RegisterPage]
class RegisterRoute extends _i1.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: 'register');

  static const String name = 'RegisterRoute';
}
