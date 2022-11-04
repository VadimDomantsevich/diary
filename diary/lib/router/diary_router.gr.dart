// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../authentication/forgot_password_screen_widget.dart' as _i2;
import '../authentication/profile_screen_widget.dart' as _i4;
import '../authentication/sign_in_screen_widget.dart' as _i1;
import '../home/home_screen_widget.dart' as _i3;

class DiaryRouter extends _i5.RootStackRouter {
  DiaryRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SignInScreenWidgetRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SignInScreenWidget(),
      );
    },
    ForgotPasswordScreenWidgetRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordScreenWidgetRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.ForgotPasswordScreenWidget(
          key: args.key,
          email: args.email,
        ),
      );
    },
    HomeScreenWidgetRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreenWidget(),
      );
    },
    ProfileScreenWidgetRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ProfileScreenWidget(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          SignInScreenWidgetRoute.name,
          path: '/',
        ),
        _i5.RouteConfig(
          ForgotPasswordScreenWidgetRoute.name,
          path: '/forgot-password-screen-widget',
        ),
        _i5.RouteConfig(
          HomeScreenWidgetRoute.name,
          path: '/home-screen-widget',
        ),
        _i5.RouteConfig(
          ProfileScreenWidgetRoute.name,
          path: '/profile-screen-widget',
        ),
      ];
}

/// generated route for
/// [_i1.SignInScreenWidget]
class SignInScreenWidgetRoute extends _i5.PageRouteInfo<void> {
  const SignInScreenWidgetRoute()
      : super(
          SignInScreenWidgetRoute.name,
          path: '/',
        );

  static const String name = 'SignInScreenWidgetRoute';
}

/// generated route for
/// [_i2.ForgotPasswordScreenWidget]
class ForgotPasswordScreenWidgetRoute
    extends _i5.PageRouteInfo<ForgotPasswordScreenWidgetRouteArgs> {
  ForgotPasswordScreenWidgetRoute({
    _i6.Key? key,
    required String? email,
  }) : super(
          ForgotPasswordScreenWidgetRoute.name,
          path: '/forgot-password-screen-widget',
          args: ForgotPasswordScreenWidgetRouteArgs(
            key: key,
            email: email,
          ),
        );

  static const String name = 'ForgotPasswordScreenWidgetRoute';
}

class ForgotPasswordScreenWidgetRouteArgs {
  const ForgotPasswordScreenWidgetRouteArgs({
    this.key,
    required this.email,
  });

  final _i6.Key? key;

  final String? email;

  @override
  String toString() {
    return 'ForgotPasswordScreenWidgetRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i3.HomeScreenWidget]
class HomeScreenWidgetRoute extends _i5.PageRouteInfo<void> {
  const HomeScreenWidgetRoute()
      : super(
          HomeScreenWidgetRoute.name,
          path: '/home-screen-widget',
        );

  static const String name = 'HomeScreenWidgetRoute';
}

/// generated route for
/// [_i4.ProfileScreenWidget]
class ProfileScreenWidgetRoute extends _i5.PageRouteInfo<void> {
  const ProfileScreenWidgetRoute()
      : super(
          ProfileScreenWidgetRoute.name,
          path: '/profile-screen-widget',
        );

  static const String name = 'ProfileScreenWidgetRoute';
}
