import 'package:flutter/material.dart';

import '../../core/l10n/l10n.dart';
import 'constants.dart';

enum DoctorAvailability implements BaseEnum {
  availableToday,
  availableTomorrow;

  @override
  String toValue(BuildContext context) => switch (this) {
        availableToday => L10n.of(context).translate.lblAvailableToday,
        availableTomorrow => L10n.of(context).translate.lblAvailableTomorrow,
      };
}

enum DoctorGender implements BaseEnum {
  male,
  female;

  @override
  String toValue(BuildContext context) => switch (this) {
        male => L10n.of(context).translate.lblMale,
        female => L10n.of(context).translate.lblFemale,
      };
}

enum DoctorPrice implements BaseEnum {
  usd,
  euro;

  @override
  String toValue(BuildContext context) => switch (this) {
        usd => 'USD',
        euro => 'EUR',
      };
}
