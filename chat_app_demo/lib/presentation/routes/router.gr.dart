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
import 'package:flutter/material.dart' as _i7;

import '../chat/chat_page.dart' as _i6;
import '../home/home.dart' as _i5;
import '../register/register_page.dart' as _i4;
import '../sign_in/sign_in_page.dart' as _i3;
import '../splash/splash_page.dart' as _i2;

class RootRouter extends _i1.RootStackRouter {
  RootRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
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
    SignInRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SignInPage());
    },
    RegisterRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.RegisterPage());
    },
    HomeRoute.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.HomePage());
    },
    ChatRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRouteArgs>();
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.ChatPage(key: args.key, toUserId: args.toUserId));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(EmptyRouterRoute.name, path: '/', children: [
          _i1.RouteConfig(SplashRoute.name,
              path: '', parent: EmptyRouterRoute.name),
          _i1.RouteConfig(SignInRoute.name,
              path: 'sign-in', parent: EmptyRouterRoute.name),
          _i1.RouteConfig(RegisterRoute.name,
              path: 'register', parent: EmptyRouterRoute.name),
          _i1.RouteConfig(HomeRoute.name,
              path: 'home', parent: EmptyRouterRoute.name),
          _i1.RouteConfig(ChatRoute.name,
              path: 'chat', parent: EmptyRouterRoute.name)
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
/// [_i3.SignInPage]
class SignInRoute extends _i1.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: 'sign-in');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i4.RegisterPage]
class RegisterRoute extends _i1.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: 'register');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i1.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i6.ChatPage]
class ChatRoute extends _i1.PageRouteInfo<ChatRouteArgs> {
  ChatRoute({_i7.Key? key, required String toUserId})
      : super(ChatRoute.name,
            path: 'chat', args: ChatRouteArgs(key: key, toUserId: toUserId));

  static const String name = 'ChatRoute';
}

class ChatRouteArgs {
  const ChatRouteArgs({this.key, required this.toUserId});

  final _i7.Key? key;

  final String toUserId;

  @override
  String toString() {
    return 'ChatRouteArgs{key: $key, toUserId: $toUserId}';
  }
}
