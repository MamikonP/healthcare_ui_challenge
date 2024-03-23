import 'package:flutter/material.dart';

import '../../../../core/assets_text.dart';
import '../../../../core/extensions/number_extension.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../constants/gap_constant.dart';
import '../../../widgets/widgets.dart';

class MakeAppointmentCard extends StatelessWidget {
  const MakeAppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.currentThemeOf(context).colorScheme.background,
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: GapConstants.zero.allRadius),
      child: Padding(
        padding: GapConstants.large.allPadding,
        child: Row(
          children: [
            Flexible(
              child: LoadingButton(
                text: L10n.of(context).translate.btnMakeAppointment,
                onStopLoading: () => ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Made'))),
                onTap: () async {
                  await Future.delayed(const Duration(seconds: 3));
                },
              ),
            ),
            GapConstants.medium.horizontalSpace,
            IconWithBackground(
              assetIcon: AssetsText.icChat,
              padding: GapConstants.smaller + GapConstants.small,
              backgroundColor: AppTheme.currentThemeOf(context).gray50,
              border:
                  Border.all(color: AppTheme.currentThemeOf(context).gray200),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
