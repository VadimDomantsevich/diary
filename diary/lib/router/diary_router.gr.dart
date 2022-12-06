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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../authentication/forgot_password_screen_widget.dart' as _i2;
import '../authentication/profile_screen_widget.dart' as _i4;
import '../authentication/sign_in_screen_widget.dart' as _i1;
import '../home/cell_edit_screen_widget.dart' as _i6;
import '../home/home_screen_widget.dart' as _i3;
import '../home/pluto_grid.dart' as _i5;
import '../model/diary_cell.dart' as _i9;

class DiaryRouter extends _i7.RootStackRouter {
  DiaryRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SignInScreenWidgetRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SignInScreenWidget(),
      );
    },
    ForgotPasswordScreenWidgetRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordScreenWidgetRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.ForgotPasswordScreenWidget(
          key: args.key,
          email: args.email,
        ),
      );
    },
    HomeScreenWidgetRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreenWidget(),
      );
    },
    ProfileScreenWidgetRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ProfileScreenWidget(),
      );
    },
    PlutoGridExamplePageRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.PlutoGridExamplePage(),
      );
    },
    CellEditScreenWidgetRoute.name: (routeData) {
      final args = routeData.argsAs<CellEditScreenWidgetRouteArgs>();
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.CellEditScreenWidget(
          key: args.key,
          diaryCell: args.diaryCell,
        ),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          SignInScreenWidgetRoute.name,
          path: '/',
        ),
        _i7.RouteConfig(
          ForgotPasswordScreenWidgetRoute.name,
          path: '/forgot-password-screen-widget',
        ),
        _i7.RouteConfig(
          HomeScreenWidgetRoute.name,
          path: '/home-screen-widget',
        ),
        _i7.RouteConfig(
          ProfileScreenWidgetRoute.name,
          path: '/profile-screen-widget',
        ),
        _i7.RouteConfig(
          PlutoGridExamplePageRoute.name,
          path: '/pluto-grid-example-page',
        ),
        _i7.RouteConfig(
          CellEditScreenWidgetRoute.name,
          path: '/cell-edit-screen-widget',
        ),
      ];
}

/// generated route for
/// [_i1.SignInScreenWidget]
class SignInScreenWidgetRoute extends _i7.PageRouteInfo<void> {
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
    extends _i7.PageRouteInfo<ForgotPasswordScreenWidgetRouteArgs> {
  ForgotPasswordScreenWidgetRoute({
    _i8.Key? key,
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

  final _i8.Key? key;

  final String? email;

  @override
  String toString() {
    return 'ForgotPasswordScreenWidgetRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i3.HomeScreenWidget]
class HomeScreenWidgetRoute extends _i7.PageRouteInfo<void> {
  const HomeScreenWidgetRoute()
      : super(
          HomeScreenWidgetRoute.name,
          path: '/home-screen-widget',
        );

  static const String name = 'HomeScreenWidgetRoute';
}

/// generated route for
/// [_i4.ProfileScreenWidget]
class ProfileScreenWidgetRoute extends _i7.PageRouteInfo<void> {
  const ProfileScreenWidgetRoute()
      : super(
          ProfileScreenWidgetRoute.name,
          path: '/profile-screen-widget',
        );

  static const String name = 'ProfileScreenWidgetRoute';
}

/// generated route for
/// [_i5.PlutoGridExamplePage]
class PlutoGridExamplePageRoute extends _i7.PageRouteInfo<void> {
  const PlutoGridExamplePageRoute()
      : super(
          PlutoGridExamplePageRoute.name,
          path: '/pluto-grid-example-page',
        );

  static const String name = 'PlutoGridExamplePageRoute';
}

/// generated route for
/// [_i6.CellEditScreenWidget]
class CellEditScreenWidgetRoute
    extends _i7.PageRouteInfo<CellEditScreenWidgetRouteArgs> {
  CellEditScreenWidgetRoute({
    _i8.Key? key,
    required _i9.DiaryCell diaryCell,
  }) : super(
          CellEditScreenWidgetRoute.name,
          path: '/cell-edit-screen-widget',
          args: CellEditScreenWidgetRouteArgs(
            key: key,
            diaryCell: diaryCell,
          ),
        );

  static const String name = 'CellEditScreenWidgetRoute';
}

class CellEditScreenWidgetRouteArgs {
  const CellEditScreenWidgetRouteArgs({
    this.key,
    required this.diaryCell,
  });

  final _i8.Key? key;

  final _i9.DiaryCell diaryCell;

  @override
  String toString() {
    return 'CellEditScreenWidgetRouteArgs{key: $key, diaryCell: $diaryCell}';
  }
}
