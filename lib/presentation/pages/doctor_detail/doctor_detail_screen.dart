import 'package:flutter/material.dart';

import '../../../core/extensions/number_extension.dart';
import '../../../core/themes/app_theme.dart';
import '../../../domain/doctor/doctor_entity.dart';
import '../../constants/gap_constant.dart';
import '../../constants/medical_type.dart';
import 'widgets/doctor_bio.dart';
import 'widgets/doctor_info.dart';
import 'widgets/doctor_work_location.dart';
import 'widgets/make_appointment_card.dart';

class DoctorDetailScreen extends StatelessWidget {
  const DoctorDetailScreen({super.key, this.medicalType, this.doctorEntity});

  final MedicalType? medicalType;
  final DoctorEntity? doctorEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.currentThemeOf(context).gray50,
      appBar: AppBar(
        title: Text(medicalType?.toTitle(context) ?? ''),
      ),
      bottomNavigationBar: MakeAppointmentCard(doctorEntity: doctorEntity,),
      body: CustomScrollView(
        slivers: [
          if (doctorEntity != null)
            SliverToBoxAdapter(
                child: DoctorInfo(
              doctorEntity: doctorEntity!,
            )),
          SliverPadding(
            padding: GapConstants.smallest.verticalPadding,
            sliver: SliverToBoxAdapter(
              child: DoctorBio(
                bio:
                    'Dr. ${doctorEntity?.name} specialist in ${medicalType?.toTitle(context)} and work in RS. Hermina Malang. It is a long established fact that a reader will be distracted by the readable content.',
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
