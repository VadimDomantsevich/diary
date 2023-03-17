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
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../authentication/forgot_password_screen_widget.dart' as _i2;
import '../authentication/profile_screen_widget.dart' as _i4;
import '../authentication/sign_in_screen_widget.dart' as _i1;
import '../home/bloc_datagrid_sample.dart' as _i6;
import '../home/bloc_home_widget.dart' as _i3;
import '../home/bloc_list_themes_widget.dart' as _i8;
import '../home/bloc_provider_datagrid_view_mode.dart' as _i9;
import '../home/datagrid_sample.dart' as _i5;
import '../home/edit_panel/edit_list/add_column_screen_widget.dart' as _i7;
import '../home/take_theme_alert_dialog_widget.dart' as _i10;
import '../model/diary_list.dart' as _i13;
import '../model/list_theme.dart' as _i14;

class DiaryRouter extends _i11.RootStackRouter {
  DiaryRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    SignInScreenWidgetRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SignInScreenWidget(),
      );
    },
    ForgotPasswordScreenWidgetRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordScreenWidgetRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.ForgotPasswordScreenWidget(
          key: args.key,
          email: args.email,
        ),
      );
    },
    BlocHomeWidgetRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.BlocHomeWidget(),
      );
    },
    ProfileScreenWidgetRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ProfileScreenWidget(),
      );
    },
    DataGridSampleRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.DataGridSample(),
      );
    },
    BlocDataGridSampleRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.BlocDataGridSample(),
      );
    },
    AddColumnScreenWidgetRoute.name: (routeData) {
      final args = routeData.argsAs<AddColumnScreenWidgetRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
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
          diaryList: args.diaryList,
        ),
      );
    },
    BlocListThemesWidgetRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.BlocListThemesWidget(),
      );
    },
    BlocProviderDataGridViewModeRoute.name: (routeData) {
      final args = routeData.argsAs<BlocProviderDataGridViewModeRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.BlocProviderDataGridViewMode(
          key: args.key,
          listTheme: args.listTheme,
        ),
      );
    },
    TakeThemeAlertDialogWidgetRoute.name: (routeData) {
      final args = routeData.argsAs<TakeThemeAlertDialogWidgetRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.TakeThemeAlertDialogWidget(
          key: args.key,
          listTheme: args.listTheme,
          onPressedSubmitButton: args.onPressedSubmitButton,
        ),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          SignInScreenWidgetRoute.name,
          path: '/',
        ),
        _i11.RouteConfig(
          ForgotPasswordScreenWidgetRoute.name,
          path: '/forgot-password-screen-widget',
        ),
        _i11.RouteConfig(
          BlocHomeWidgetRoute.name,
          path: '/bloc-home-widget',
        ),
        _i11.RouteConfig(
          ProfileScreenWidgetRoute.name,
          path: '/profile-screen-widget',
        ),
        _i11.RouteConfig(
          DataGridSampleRoute.name,
          path: '/data-grid-sample',
        ),
        _i11.RouteConfig(
          BlocDataGridSampleRoute.name,
          path: '/bloc-data-grid-sample',
        ),
        _i11.RouteConfig(
          AddColumnScreenWidgetRoute.name,
          path: '/add-column-screen-widget',
        ),
        _i11.RouteConfig(
          BlocListThemesWidgetRoute.name,
          path: '/bloc-list-themes-widget',
        ),
        _i11.RouteConfig(
          BlocProviderDataGridViewModeRoute.name,
          path: '/bloc-provider-data-grid-view-mode',
        ),
        _i11.RouteConfig(
          TakeThemeAlertDialogWidgetRoute.name,
          path: '/take-theme-alert-dialog-widget',
        ),
      ];
}

/// generated route for
/// [_i1.SignInScreenWidget]
class SignInScreenWidgetRoute extends _i11.PageRouteInfo<void> {
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
    extends _i11.PageRouteInfo<ForgotPasswordScreenWidgetRouteArgs> {
  ForgotPasswordScreenWidgetRoute({
    _i12.Key? key,
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

  final _i12.Key? key;

  final String? email;

  @override
  String toString() {
    return 'ForgotPasswordScreenWidgetRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i3.BlocHomeWidget]
class BlocHomeWidgetRoute extends _i11.PageRouteInfo<void> {
  const BlocHomeWidgetRoute()
      : super(
          BlocHomeWidgetRoute.name,
          path: '/bloc-home-widget',
        );

  static const String name = 'BlocHomeWidgetRoute';
}

/// generated route for
/// [_i4.ProfileScreenWidget]
class ProfileScreenWidgetRoute extends _i11.PageRouteInfo<void> {
  const ProfileScreenWidgetRoute()
      : super(
          ProfileScreenWidgetRoute.name,
          path: '/profile-screen-widget',
        );

  static const String name = 'ProfileScreenWidgetRoute';
}

/// generated route for
/// [_i5.DataGridSample]
class DataGridSampleRoute extends _i11.PageRouteInfo<void> {
  const DataGridSampleRoute()
      : super(
          DataGridSampleRoute.name,
          path: '/data-grid-sample',
        );

  static const String name = 'DataGridSampleRoute';
}

/// generated route for
/// [_i6.BlocDataGridSample]
class BlocDataGridSampleRoute extends _i11.PageRouteInfo<void> {
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
    extends _i11.PageRouteInfo<AddColumnScreenWidgetRouteArgs> {
  AddColumnScreenWidgetRoute({
    _i12.Key? key,
    required String title,
    required String hintText,
    required dynamic Function(
      String,
      int,
    )
        onPressedSubmitButton,
    required void Function() onPressedUp,
    required void Function() onPressedDown,
    required _i12.Widget textWidget,
    required int columnsCount,
    required _i13.DiaryList diaryList,
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
            diaryList: diaryList,
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
    required this.diaryList,
  });

  final _i12.Key? key;

  final String title;

  final String hintText;

  final dynamic Function(
    String,
    int,
  ) onPressedSubmitButton;

  final void Function() onPressedUp;

  final void Function() onPressedDown;

  final _i12.Widget textWidget;

  final int columnsCount;

  final _i13.DiaryList diaryList;

  @override
  String toString() {
    return 'AddColumnScreenWidgetRouteArgs{key: $key, title: $title, hintText: $hintText, onPressedSubmitButton: $onPressedSubmitButton, onPressedUp: $onPressedUp, onPressedDown: $onPressedDown, textWidget: $textWidget, columnsCount: $columnsCount, diaryList: $diaryList}';
  }
}

/// generated route for
/// [_i8.BlocListThemesWidget]
class BlocListThemesWidgetRoute extends _i11.PageRouteInfo<void> {
  const BlocListThemesWidgetRoute()
      : super(
          BlocListThemesWidgetRoute.name,
          path: '/bloc-list-themes-widget',
        );

  static const String name = 'BlocListThemesWidgetRoute';
}

/// generated route for
/// [_i9.BlocProviderDataGridViewMode]
class BlocProviderDataGridViewModeRoute
    extends _i11.PageRouteInfo<BlocProviderDataGridViewModeRouteArgs> {
  BlocProviderDataGridViewModeRoute({
    _i12.Key? key,
    required _i14.ListTheme listTheme,
  }) : super(
          BlocProviderDataGridViewModeRoute.name,
          path: '/bloc-provider-data-grid-view-mode',
          args: BlocProviderDataGridViewModeRouteArgs(
            key: key,
            listTheme: listTheme,
          ),
        );

  static const String name = 'BlocProviderDataGridViewModeRoute';
}

class BlocProviderDataGridViewModeRouteArgs {
  const BlocProviderDataGridViewModeRouteArgs({
    this.key,
    required this.listTheme,
  });

  final _i12.Key? key;

  final _i14.ListTheme listTheme;

  @override
  String toString() {
    return 'BlocProviderDataGridViewModeRouteArgs{key: $key, listTheme: $listTheme}';
  }
}

/// generated route for
/// [_i10.TakeThemeAlertDialogWidget]
class TakeThemeAlertDialogWidgetRoute
    extends _i11.PageRouteInfo<TakeThemeAlertDialogWidgetRouteArgs> {
  TakeThemeAlertDialogWidgetRoute({
    _i12.Key? key,
    required _i14.ListTheme listTheme,
    required dynamic Function(_i14.ListTheme) onPressedSubmitButton,
  }) : super(
          TakeThemeAlertDialogWidgetRoute.name,
          path: '/take-theme-alert-dialog-widget',
          args: TakeThemeAlertDialogWidgetRouteArgs(
            key: key,
            listTheme: listTheme,
            onPressedSubmitButton: onPressedSubmitButton,
          ),
        );

  static const String name = 'TakeThemeAlertDialogWidgetRoute';
}

class TakeThemeAlertDialogWidgetRouteArgs {
  const TakeThemeAlertDialogWidgetRouteArgs({
    this.key,
    required this.listTheme,
    required this.onPressedSubmitButton,
  });

  final _i12.Key? key;

  final _i14.ListTheme listTheme;

  final dynamic Function(_i14.ListTheme) onPressedSubmitButton;

  @override
  String toString() {
    return 'TakeThemeAlertDialogWidgetRouteArgs{key: $key, listTheme: $listTheme, onPressedSubmitButton: $onPressedSubmitButton}';
  }
}
