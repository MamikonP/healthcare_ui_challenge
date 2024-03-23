import 'package:flutter/material.dart';

import '../../../core/extensions/number_extension.dart';
import '../../constants/appointment_type.dart';
import '../../constants/gap_constant.dart';
import '../coming_soon_screen.dart';
import 'widgets/book_appointment_content.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key, this.appointmentType});

  final AppointmentType? appointmentType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appointmentType?.toTitle(context) ?? ''),
      ),
      body: Padding(
        padding: GapConstants.medium.horizontalPadding,
        child: switch (appointmentType) {
          AppointmentType.book => BookAppointmentContent(),
          AppointmentType.qr => const ComingSoonScreen(),
          AppointmentType.consultation => const ComingSoonScreen(),
          AppointmentType.pharmacy => const ComingSoonScreen(),
          _ => const ComingSoonScreen()
        },
      ),
    );
  }
}
