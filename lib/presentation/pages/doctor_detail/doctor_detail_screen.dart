import 'package:flutter/material.dart';

import '../../../core/extensions/number_extension.dart';
import '../../../core/themes/app_theme.dart';
import '../../constants/gap_constant.dart';
import '../../constants/medical_type.dart';
import '../../widgets/general/user_list_tile.dart';
import '../../widgets/widgets.dart';
import 'widgets/doctor_bio.dart';
import 'widgets/doctor_info.dart';
import 'widgets/doctor_overview.dart';
import 'widgets/doctor_work_location.dart';
import 'widgets/make_appointment_card.dart';

class DoctorDetailScreen extends StatelessWidget {
  const DoctorDetailScreen({super.key, this.medicalType});

  final MedicalType? medicalType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.currentThemeOf(context).gray50,
      appBar: AppBar(
        title: Text(medicalType?.toTitle(context) ?? ''),
      ),
      bottomNavigationBar: MakeAppointmentCard(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: DoctorInfo()),
          SliverPadding(
            padding: GapConstants.smallest.verticalPadding,
            sliver: SliverToBoxAdapter(
              child: DoctorBio(
                bio:
                    'Dr. Patricia Ahoy specialist in Ear, Nose & Throat, and work in RS. Hermina Malang. It is a long established fact that a reader will be distracted by the readable content.',
              ),
            ),
          ),
          SliverPadding(
            padding: GapConstants.smallest.verticalPadding,
            sliver: SliverToBoxAdapter(
              child: DoctorWorkLocation(
                location:
                    'Jl. Tangkuban Perahu No.31-33, Kauman, Kec. Klojen, Kota Malang, Jawa Timur 65119',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
