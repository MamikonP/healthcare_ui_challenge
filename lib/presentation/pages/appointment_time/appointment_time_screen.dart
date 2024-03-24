import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../core/extensions/number_extension.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/themes/app_theme.dart';
import '../../constants/constants.dart';
import '../../constants/gap_constant.dart';
import '../../widgets/widgets.dart';
import 'widgets/appointment_time_confirm_card.dart';

class _AppointmentTimeset extends StatelessWidget {
  const _AppointmentTimeset({required this.header});

  final String header;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: AppTheme.currentThemeOf(context).title3,
        ),
        GapConstants.small.verticalSpace,
        SizedBox(
          height: Constants.timeCardHeight,
          child: HorizontalListViewBuilder(
              itemExtent: Constants.timeCardHeight,
              builder: (context, index) => Card(
                    color: AppTheme.currentThemeOf(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: Constants.borderRadius.allRadius,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Wed'),
                        Text(
                          '$index',
                          style: AppTheme.currentThemeOf(context).title2,
                        ),
                      ],
                    ),
                  ),
              itemCount: 30),
        )
      ],
    );
  }
}

class AppointmentTimeScreen extends StatelessWidget {
  const AppointmentTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).translate.lblMakeAppointment),
      ),
      bottomNavigationBar: const AppointmentTimeConfirmCard(),
      body: Padding(
        padding: GapConstants.medium.horizontalPadding,
        child: Column(
          children: [
            HeaderWidget(
              title: 'Select your visit date & Time',
              description:
                  'You can choose the date and time from the available doctor\'s schedule',
            ),
            GapConstants.medium.verticalSpace,
            _AppointmentTimeset(header: 'Choose Day, Jan 2024'),
            GapConstants.medium.verticalSpace,
            _AppointmentTimeset(header: 'Morning Set'),
            GapConstants.medium.verticalSpace,
            _AppointmentTimeset(header: 'Afternoon Set'),
          ],
        ),
      ),
    );
  }
}
