import 'package:flutter/material.dart';

import '../../../../core/extensions/number_extension.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../constants/gap_constant.dart';

class _PaymentDetail extends StatelessWidget {
  const _PaymentDetail({required this.title, required this.detail});

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: GapConstants.zero.allPadding,
      title: Text(
        title,
        style: AppTheme.currentThemeOf(context)
            .regular1
            .copyWith(color: AppTheme.currentThemeOf(context).typography700),
      ),
      trailing: Text(
        detail,
        style: AppTheme.currentThemeOf(context).subtitle1,
      ),
    );
  }
}

class TotalPaymentCard extends StatelessWidget {
  const TotalPaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.currentThemeOf(context).white,
      elevation: 0.05,
      child: Padding(
        padding: GapConstants.medium.allPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              L10n.of(context).translate.lblTotalPayment,
              style: AppTheme.currentThemeOf(context).title3,
            ),
            _PaymentDetail(
                title: L10n.of(context).translate.lblConsultationFee,
                detail: 'IDR 200.000'),
            _PaymentDetail(
                title: L10n.of(context).translate.lblAdmin, detail: 'Free'),
          ],
        ),
      ),
    );
  }
}
