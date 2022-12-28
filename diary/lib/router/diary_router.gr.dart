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
import '../diary_cell_edit_screen/bloc_cell_edit_screen_widget.dart' as _i5;
import '../home/bloc_datagrid_sample.dart' as _i7;
import '../home/datagrid_sample.dart' as _i6;
import '../home/home_screen_widget.dart' as _i3;
import '../model/diary_cell.dart' as _i10;
import '../model/diary_list.dart' as _i11;

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
    BlocCellEditScreenWidgetRoute.name: (routeData) {
      final args = routeData.argsAs<BlocCellEditScreenWidgetRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.BlocCellEditScreenWidget(
          key: args.key,
          diaryCell: args.diaryCell,
          diaryList: args.diaryList,
        ),
      );
    },
    DataGridSampleRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.DataGridSample(),
      );
    },
    BlocDataGridSampleRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.BlocDataGridSample(),
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
          BlocCellEditScreenWidgetRoute.name,
          path: '/bloc-cell-edit-screen-widget',
        ),
        _i8.RouteConfig(
          DataGridSampleRoute.name,
          path: '/data-grid-sample',
        ),
        _i8.RouteConfig(
          BlocDataGridSampleRoute.name,
          path: '/bloc-data-grid-sample',
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
/// [_i5.BlocCellEditScreenWidget]
class BlocCellEditScreenWidgetRoute
    extends _i8.PageRouteInfo<BlocCellEditScreenWidgetRouteArgs> {
  BlocCellEditScreenWidgetRoute({
    _i9.Key? key,
    required _i10.DiaryCell diaryCell,
    required _i11.DiaryList diaryList,
  }) : super(
          BlocCellEditScreenWidgetRoute.name,
          path: '/bloc-cell-edit-screen-widget',
          args: BlocCellEditScreenWidgetRouteArgs(
            key: key,
            diaryCell: diaryCell,
            diaryList: diaryList,
          ),
        );

  static const String name = 'BlocCellEditScreenWidgetRoute';
}

class BlocCellEditScreenWidgetRouteArgs {
  const BlocCellEditScreenWidgetRouteArgs({
    this.key,
    required this.diaryCell,
    required this.diaryList,
  });

  final _i9.Key? key;

  final _i10.DiaryCell diaryCell;

  final _i11.DiaryList diaryList;

  @override
  String toString() {
    return 'BlocCellEditScreenWidgetRouteArgs{key: $key, diaryCell: $diaryCell, diaryList: $diaryList}';
  }
}

/// generated route for
/// [_i6.DataGridSample]
class DataGridSampleRoute extends _i8.PageRouteInfo<void> {
  const DataGridSampleRoute()
      : super(
          DataGridSampleRoute.name,
          path: '/data-grid-sample',
        );

  static const String name = 'DataGridSampleRoute';
}

/// generated route for
/// [_i7.BlocDataGridSample]
class BlocDataGridSampleRoute extends _i8.PageRouteInfo<void> {
  const BlocDataGridSampleRoute()
      : super(
          BlocDataGridSampleRoute.name,
          path: '/bloc-data-grid-sample',
        );

  static const String name = 'BlocDataGridSampleRoute';
}
