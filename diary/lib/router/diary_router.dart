import 'package:auto_route/annotations.dart';
import 'package:diary/authentication/forgot_password_screen_widget.dart';
import 'package:diary/authentication/profile_screen_widget.dart';
import 'package:diary/authentication/sign_in_screen_widget.dart';
import 'package:diary/home_screen/bloc_widgets/bloc_datagrid_sample.dart';
import 'package:diary/home_screen/bloc_widgets/bloc_home_widget.dart';
import 'package:diary/home_screen/bloc_widgets/bloc_list_themes_widget.dart';
import 'package:diary/home_screen/bloc_widgets/bloc_provider_datagrid_view_mode.dart';
import 'package:diary/home_screen/edit_panel/edit_list/widgets/add_column_screen_widget.dart';
import 'package:diary/home_screen/widgets/datagrid_sample.dart';
import 'package:diary/home_screen/widgets/take_theme_alert_dialog_widget.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      page: SignInScreenWidget,
      initial: true,
    ),
    AutoRoute(
      page: ForgotPasswordScreenWidget,
    ),
    AutoRoute(
      page: BlocHomeWidget,
    ),
    AutoRoute(
      page: ProfileScreenWidget,
    ),
    AutoRoute(
      page: DataGridSample,
    ),
    AutoRoute(
      page: BlocDataGridSample,
    ),
    AutoRoute(
      page: AddColumnScreenWidget,
    ),
    AutoRoute(
      page: BlocListThemesWidget,
    ),
    AutoRoute(
      page: BlocProviderDataGridViewMode,
    ),
    AutoRoute(
      page: TakeThemeAlertDialogWidget,
    ),
  ],
)
class $DiaryRouter {}
