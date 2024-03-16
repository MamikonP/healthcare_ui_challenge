import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/router/app_router.dart';
import 'core/router/app_routes.dart';
import 'core/themes/app_theme.dart';

void main() {
  runApp(MaterialApp(
    onGenerateRoute: AppRouter.onGenerateRoute,
    theme: AppThemeData().darkTheme,
    darkTheme: AppThemeData().darkTheme,
    debugShowCheckedModeBanner: false,
    initialRoute: AppRoutes.root,
    localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
    ],
  ));
}
