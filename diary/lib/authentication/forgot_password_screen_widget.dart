import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreenWidget extends StatelessWidget {
  const ForgotPasswordScreenWidget({super.key, required this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    return ForgotPasswordScreen(
      email: email,
      headerMaxExtent: 200,
    );
  }
}
