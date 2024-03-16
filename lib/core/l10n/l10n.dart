import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class L10n {
  L10n._(this.context) : translate = AppLocalizations.of(context)!;

  factory L10n.of(BuildContext context) => L10n._(context);

  final BuildContext context;
  final AppLocalizations translate;

  static final List<Locale> locales = <Locale>[
    const Locale('en', 'US'),
  ];

  static bool updateLocale(BuildContext context, Locale locale) {
    if (!locales.contains(locale)) {
      return false;
    }

    return true;
  }
}
