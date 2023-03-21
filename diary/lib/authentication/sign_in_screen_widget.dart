import 'package:auto_route/auto_route.dart';
import 'package:diary/authentication/functions.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import '../router/diary_router.gr.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInScreenWidget extends StatelessWidget {
  const SignInScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final providers = [EmailAuthProvider()];

    return SignInScreen(
      providers: providers,
      actions: [
        ForgotPasswordAction(
          ((context, email) {
            context.router.push(
              ForgotPasswordScreenWidgetRoute(email: email),
            );
          }),
        ),
        AuthStateChangeAction(
          ((context, state) {
            if (state is SignedIn || state is UserCreated) {
              var user = (state is SignedIn)
                  ? state.user
                  : (state as UserCreated).credential.user;
              if (user == null) {
                return;
              }
              if (state is UserCreated) {
                addNewUserToFirestore();

                user.updateDisplayName(user.email!.split('@')[0]);
              }
              if (!user.emailVerified) {
                user.sendEmailVerification();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      AppLocalizations.of(context).verifyEmailSnackBarText,
                    ),
                  ),
                );
              }
              context.router.push(
                BlocHomeWidgetRoute(isThemeTaken: false),
              );
            }
          }),
        ),
      ],
    );
  }
}
