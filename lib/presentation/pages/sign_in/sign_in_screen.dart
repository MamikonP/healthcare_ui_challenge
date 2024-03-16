import 'package:flutter/material.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/themes/app_theme.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        L10n.of(context).translate.lblWelcomeBack,
        style: AppTheme.currentThemeOf(context).title1,
      ),
    );
  }
}
