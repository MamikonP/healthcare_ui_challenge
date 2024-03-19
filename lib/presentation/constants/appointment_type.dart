import 'package:flutter/material.dart';

import '../../core/assets_text.dart';
import '../../core/l10n/l10n.dart';
import '../../core/themes/app_theme.dart';

enum AppointmentType {
  book,
  qr,
  consultation,
  pharmacy;

  Color toBackgroundColor(BuildContext context) => switch (this) {
        book => AppTheme.currentThemeOf(context).primary50,
        qr => AppTheme.currentThemeOf(context).success50,
        consultation => AppTheme.currentThemeOf(context).warning50,
        pharmacy => AppTheme.currentThemeOf(context).danger50,
      };

  Color toIconBackgroundColor(BuildContext context) => switch (this) {
        book => AppTheme.currentThemeOf(context).primary100,
        qr => AppTheme.currentThemeOf(context).success100,
        consultation => AppTheme.currentThemeOf(context).warning200,
        pharmacy => AppTheme.currentThemeOf(context).danger200,
      };

  String toTitle(BuildContext context) => switch (this) {
        book => L10n.of(context).translate.lblBookAnAppointmentTitle,
        qr => L10n.of(context).translate.lblAppointmentWithQRTitle,
        consultation => L10n.of(context).translate.lblRequestConsultationTitle,
        pharmacy => L10n.of(context).translate.lblLocatePharmacyTitle,
      };

  String toDescription(BuildContext context) => switch (this) {
        book => L10n.of(context).translate.lblBookAnAppointmentDescription,
        qr => L10n.of(context).translate.lblAppointmentWithQRDescription,
        consultation =>
          L10n.of(context).translate.lblRequestConsultationDescription,
        pharmacy => L10n.of(context).translate.lblLocatePharmacyDescription,
      };

  String toIcon(BuildContext context) => switch (this) {
        book => AssetsText.icCalendar,
        qr => AssetsText.icScan,
        consultation => AssetsText.icMessageFavorite,
        pharmacy => AssetsText.icBuilding,
      };
}
