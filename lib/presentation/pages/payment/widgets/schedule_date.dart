import 'package:flutter/material.dart';

import '../../../../core/assets_text.dart';
import '../../../../core/extensions/number_extension.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../constants/appointment_type.dart';
import '../../../constants/gap_constant.dart';
import '../../../widgets/widgets.dart';

class ScheduleDate extends StatelessWidget {
  const ScheduleDate({super.key});

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
                    L10n.of(context).translate.lblScheduledDate,
                    style: AppTheme.currentThemeOf(context).title3,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    children: [
                      AssetImageWidget.svg(
                        imageName: AssetsText.icEdit,
                        color: AppTheme.currentThemeOf(context)
                            .colorScheme
                            .primary,
                      ),
                      GapConstants.medium.horizontalSpace,
                      Text(
                        L10n.of(context).translate.lblEdit,
                        style:
                            AppTheme.currentThemeOf(context).subtitle1.copyWith(
                                  color: AppTheme.currentThemeOf(context)
                                      .colorScheme
                                      .primary,
                                ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            ListTile(
              contentPadding: GapConstants.zero.allPadding,
              leading: IconWithBackground(
                assetIcon: AppointmentType.book.toIcon(context),
                padding: GapConstants.smaller + GapConstants.smallest,
                backgroundColor: AppointmentType.book
                    .toIconBackgroundColor(context)
                    .withOpacity(0.8),
                border: Border.all(
                    color: AppointmentType.book.toIconBackgroundColor(context)),
              ), // TODO: update hardcoded appointment type
              title: Text(
                L10n.of(context).translate.lblAppointmentWithQRDescription,
                style: AppTheme.currentThemeOf(context).regular2.copyWith(
                    color: AppTheme.currentThemeOf(context).typography700),
              ),
              subtitle: Text('Wednesday, 10 Jan 2024, 11:00',
                  style: AppTheme.currentThemeOf(context).subtitle1),
            )
          ],
        ),
      ),
    );
  }
}
