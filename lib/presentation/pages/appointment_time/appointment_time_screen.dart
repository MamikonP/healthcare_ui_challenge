import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../../core/extensions/number_extension.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/themes/app_theme.dart';
import '../../../domain/doctor/doctor_entity.dart';
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

class AppointmentTimeScreen extends StatefulWidget {
  const AppointmentTimeScreen(this.doctorEntity, {super.key});

  final DoctorEntity? doctorEntity;

  @override
  State<AppointmentTimeScreen> createState() => _AppointmentTimeScreenState();
}

class _AppointmentTimeScreenState extends State<AppointmentTimeScreen> {
  String? timeFormat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.of(context).translate.lblMakeAppointment),
      ),
      bottomNavigationBar: AppointmentTimeConfirmCard(
        doctorEntity: widget.doctorEntity,
      ),
      body: Padding(
        padding: GapConstants.medium.horizontalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeaderWidget(
              title: 'Select your visit date & Time',
              description:
                  'You can choose the date and time from the available doctor\'s schedule',
            ),
            GapConstants.medium.verticalSpace,
            TextFieldWidget(
              readOnly: true,
              textFieldType: TextFieldType.inline,
              hintText: timeFormat ?? '',
              prefixIcon: IconButton(
                onPressed: () async {
                  final dateTime = await showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate:
                          DateTime.now().add(const Duration(days: 999999)));
                  if (dateTime != null) {
                    final format = DateFormat('yyyy/MM/dd').format(dateTime);
                    final timeOfDay = await showTimePicker(
                        context: context, initialTime: TimeOfDay.now());
                    timeFormat = '$format ${timeOfDay?.format(context)}';
                  }
                  setState(() {});
                },
                icon: const Icon(Icons.date_range),
              ),
            )
          ],
        ),
      ),
    );
  }
}
