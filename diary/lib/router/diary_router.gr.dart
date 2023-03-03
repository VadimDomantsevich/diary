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
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../authentication/forgot_password_screen_widget.dart' as _i2;
import '../authentication/profile_screen_widget.dart' as _i4;
import '../authentication/sign_in_screen_widget.dart' as _i1;
import '../home/bloc_datagrid_sample.dart' as _i6;
import '../home/datagrid_sample.dart' as _i5;
import '../home/edit_panel/edit_list/add_column_screen_widget.dart' as _i7;
import '../home/home_screen_widget.dart' as _i3;

class DiaryRouter extends _i8.RootStackRouter {
  DiaryRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SignInScreenWidgetRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SignInScreenWidget(),
      );
    },
    ForgotPasswordScreenWidgetRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordScreenWidgetRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.ForgotPasswordScreenWidget(
          key: args.key,
          email: args.email,
        ),
      );
    },
    HomeScreenWidgetRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreenWidget(),
      );
    },
    ProfileScreenWidgetRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ProfileScreenWidget(),
      );
    },
    DataGridSampleRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.DataGridSample(),
      );
    },
    BlocDataGridSampleRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.BlocDataGridSample(),
      );
    },
    AddColumnScreenWidgetRoute.name: (routeData) {
      final args = routeData.argsAs<AddColumnScreenWidgetRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.AddColumnScreenWidget(
          key: args.key,
          title: args.title,
          hintText: args.hintText,
          onPressedSubmitButton: args.onPressedSubmitButton,
          onPressedUp: args.onPressedUp,
          onPressedDown: args.onPressedDown,
          textWidget: args.textWidget,
          columnsCount: args.columnsCount,
        ),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          SignInScreenWidgetRoute.name,
          path: '/',
        ),
        _i8.RouteConfig(
          ForgotPasswordScreenWidgetRoute.name,
          path: '/forgot-password-screen-widget',
        ),
        _i8.RouteConfig(
          HomeScreenWidgetRoute.name,
          path: '/home-screen-widget',
        ),
        _i8.RouteConfig(
          ProfileScreenWidgetRoute.name,
          path: '/profile-screen-widget',
        ),
        _i8.RouteConfig(
          DataGridSampleRoute.name,
          path: '/data-grid-sample',
        ),
        _i8.RouteConfig(
          BlocDataGridSampleRoute.name,
          path: '/bloc-data-grid-sample',
        ),
        _i8.RouteConfig(
          AddColumnScreenWidgetRoute.name,
          path: '/add-column-screen-widget',
        ),
      ];
}

/// generated route for
/// [_i1.SignInScreenWidget]
class SignInScreenWidgetRoute extends _i8.PageRouteInfo<void> {
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
    extends _i8.PageRouteInfo<ForgotPasswordScreenWidgetRouteArgs> {
  ForgotPasswordScreenWidgetRoute({
    _i9.Key? key,
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

  final _i9.Key? key;

  final String? email;

  @override
  String toString() {
    return 'ForgotPasswordScreenWidgetRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i3.HomeScreenWidget]
class HomeScreenWidgetRoute extends _i8.PageRouteInfo<void> {
  const HomeScreenWidgetRoute()
      : super(
          HomeScreenWidgetRoute.name,
          path: '/home-screen-widget',
        );

  static const String name = 'HomeScreenWidgetRoute';
}

/// generated route for
/// [_i4.ProfileScreenWidget]
class ProfileScreenWidgetRoute extends _i8.PageRouteInfo<void> {
  const ProfileScreenWidgetRoute()
      : super(
          ProfileScreenWidgetRoute.name,
          path: '/profile-screen-widget',
        );

  static const String name = 'ProfileScreenWidgetRoute';
}

/// generated route for
/// [_i5.DataGridSample]
class DataGridSampleRoute extends _i8.PageRouteInfo<void> {
  const DataGridSampleRoute()
      : super(
          DataGridSampleRoute.name,
          path: '/data-grid-sample',
        );

  static const String name = 'DataGridSampleRoute';
}

/// generated route for
/// [_i6.BlocDataGridSample]
class BlocDataGridSampleRoute extends _i8.PageRouteInfo<void> {
  const BlocDataGridSampleRoute()
      : super(
          BlocDataGridSampleRoute.name,
          path: '/bloc-data-grid-sample',
        );

  static const String name = 'BlocDataGridSampleRoute';
}

/// generated route for
/// [_i7.AddColumnScreenWidget]
class AddColumnScreenWidgetRoute
    extends _i8.PageRouteInfo<AddColumnScreenWidgetRouteArgs> {
  AddColumnScreenWidgetRoute({
    _i9.Key? key,
    required String title,
    required String hintText,
    required dynamic Function(
      String,
      int,
    )
        onPressedSubmitButton,
    required void Function() onPressedUp,
    required void Function() onPressedDown,
    required _i9.Widget textWidget,
    required int columnsCount,
  }) : super(
          AddColumnScreenWidgetRoute.name,
          path: '/add-column-screen-widget',
          args: AddColumnScreenWidgetRouteArgs(
            key: key,
            title: title,
            hintText: hintText,
            onPressedSubmitButton: onPressedSubmitButton,
            onPressedUp: onPressedUp,
            onPressedDown: onPressedDown,
            textWidget: textWidget,
            columnsCount: columnsCount,
          ),
        );

  static const String name = 'AddColumnScreenWidgetRoute';
}

class AddColumnScreenWidgetRouteArgs {
  const AddColumnScreenWidgetRouteArgs({
    this.key,
    required this.title,
    required this.hintText,
    required this.onPressedSubmitButton,
    required this.onPressedUp,
    required this.onPressedDown,
    required this.textWidget,
    required this.columnsCount,
  });

  final _i9.Key? key;

  final String title;

  final String hintText;

  final dynamic Function(
    String,
    int,
  ) onPressedSubmitButton;

  final void Function() onPressedUp;

  final void Function() onPressedDown;

  final _i9.Widget textWidget;

  final int columnsCount;

  @override
  String toString() {
    return 'AddColumnScreenWidgetRouteArgs{key: $key, title: $title, hintText: $hintText, onPressedSubmitButton: $onPressedSubmitButton, onPressedUp: $onPressedUp, onPressedDown: $onPressedDown, textWidget: $textWidget, columnsCount: $columnsCount}';
  }
}
