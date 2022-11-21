import 'package:auto_route/annotations.dart';
import 'package:diary/authentication/forgot_password_screen_widget.dart';
import 'package:diary/authentication/profile_screen_widget.dart';
import 'package:diary/authentication/sign_in_screen_widget.dart';
import 'package:diary/home/home_screen_widget.dart';

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
      page: HomeScreenWidget,
    ),
    AutoRoute(
      page: ProfileScreenWidget,
    ),
  ],
)
class $DiaryRouter {}