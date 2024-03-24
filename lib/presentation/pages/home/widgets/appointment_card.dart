import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/extensions/number_extension.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../constants/appointment_type.dart';
import '../../../constants/gap_constant.dart';
import '../../../widgets/widgets.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    super.key,
    required this.appointmentType,
    required this.onCardTap,
  });

  final AppointmentType appointmentType;
  final void Function(AppointmentType) onCardTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onCardTap(appointmentType),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius:
                (GapConstants.smaller + GapConstants.small).allRadius),
        elevation: 0.1,
        color: appointmentType.toBackgroundColor(context),
        child: Padding(
          padding: GapConstants.small.allPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconWithBackground(
                  animation: true,
                  assetIcon: appointmentType.toIcon(context),
                  padding: GapConstants.smaller + GapConstants.smallest,
                  backgroundColor: appointmentType
                      .toIconBackgroundColor(context)
                      .withOpacity(0.8),
                  border: Border.all(
                      color: appointmentType.toIconBackgroundColor(context)),
                ),
              ),
              Expanded(
                child: Center(
                  child: HeaderWidget(
                    title: appointmentType.toTitle(context),
                    description: appointmentType.toDescription(context),
                    titleStyle: AppTheme.currentThemeOf(context).title3,
                    descriptionStyle: AppTheme.currentThemeOf(context)
                        .regular2
                        .copyWith(
                            color:
                                AppTheme.currentThemeOf(context).typography500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
