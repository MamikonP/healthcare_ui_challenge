import 'package:flutter/material.dart';

import '../../../../core/extensions/number_extension.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../constants/gap_constant.dart';
import '../../../widgets/widgets.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.currentThemeOf(context).colorScheme.background,
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: GapConstants.zero.allRadius),
      child: Padding(
        padding: GapConstants.large.allPadding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  L10n.of(context).translate.lblTotal,
                  style: AppTheme.currentThemeOf(context).regular2.copyWith(
                      color: AppTheme.currentThemeOf(context).typography700),
                ),
                Text('IDR 200.000',
                    style: AppTheme.currentThemeOf(context).subtitle1),
              ],
            )),
            GapConstants.medium.horizontalSpace,
            Flexible(
              child: LoadingButton(
                text: L10n.of(context).translate.lblPay,
                onStopLoading: () => Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutes.paymentSuccess, (route) => false),
                onTap: () async {
                  await Future.delayed(const Duration(seconds: 3));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
