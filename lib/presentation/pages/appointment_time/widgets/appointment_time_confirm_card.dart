import 'package:flutter/material.dart';

import '../../../../core/extensions/number_extension.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../constants/gap_constant.dart';
import '../../../widgets/widgets.dart';

class AppointmentTimeConfirmCard extends StatelessWidget {
  const AppointmentTimeConfirmCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.currentThemeOf(context).colorScheme.background,
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: GapConstants.zero.allRadius),
      child: Padding(
        padding: GapConstants.large.allPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: LoadingButton(
                text: L10n.of(context).translate.btnConfirm,
                onStopLoading: () =>
                    Navigator.pushNamed(context, AppRoutes.payment),
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
