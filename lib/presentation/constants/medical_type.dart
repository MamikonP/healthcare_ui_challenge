import 'package:flutter/material.dart';

import '../../core/assets_text.dart';
import '../../core/l10n/l10n.dart';

enum MedicalType {
  ear,
  psychiatrist,
  dentist,
  dermatoVeneorologis;

  String toTitle(BuildContext context) => switch (this) {
        ear => L10n.of(context).translate.lblEar,
        psychiatrist => L10n.of(context).translate.lblPsychiatrist,
        dentist => L10n.of(context).translate.lblDentist,
        dermatoVeneorologis =>
          L10n.of(context).translate.lblDermatoVeneorologis,
      };

  String toDescription(BuildContext context) => switch (this) {
        ear ||
        psychiatrist ||
        dentist ||
        dermatoVeneorologis =>
          L10n.of(context).translate.lblMedicalSpecialtiesDescription,
      };

  String toIcon(BuildContext context) => switch (this) {
        ear => AssetsText.imgEar,
        psychiatrist => AssetsText.imgBrain,
        dentist => AssetsText.imgTooth,
        dermatoVeneorologis => AssetsText.imgPinchedFinger,
      };
}
