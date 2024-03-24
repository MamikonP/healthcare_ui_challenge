import 'package:flutter/material.dart';

import '../../../core/extensions/number_extension.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/themes/app_theme.dart';
import '../../constants/gap_constant.dart';
import '../../constants/payment_method.dart';
import '../widgets.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.currentThemeOf(context).white,
      elevation: 0.05,
      child: Padding(
        padding: GapConstants.medium.allPadding,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    L10n.of(context).translate.lblSelectPaymentMethod,
                    style: AppTheme.currentThemeOf(context).title3,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    L10n.of(context).translate.lblSeeAll,
                    style: AppTheme.currentThemeOf(context).subtitle1.copyWith(
                          color: AppTheme.currentThemeOf(context)
                              .colorScheme
                              .primary,
                        ),
                  ),
                )
              ],
            ),
            RadioButtonList(
              values: PaymentMethod.values,
              onChanged: (method) {},
            )
          ],
        ),
      ),
    );
  }
}
