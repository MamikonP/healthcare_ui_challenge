import 'package:flutter/material.dart';

import '../../core/assets_text.dart';
import '../../core/l10n/l10n.dart';

enum PaymentMethod {
  credit,
  mandiri,
  bca;

  String toTitle(BuildContext context) => switch (this) {
        credit => L10n.of(context).translate.lblCreditCard,
        mandiri => L10n.of(context).translate.lblMandiri,
        bca => L10n.of(context).translate.lblBCA,
      };

  String toIcon(BuildContext context) => switch (this) {
        credit => AssetsText.imgVisa,
        mandiri => AssetsText.imgMandiri,
        bca => AssetsText.imgBca,
      };
}
