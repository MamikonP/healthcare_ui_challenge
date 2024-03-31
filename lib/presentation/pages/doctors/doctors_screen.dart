import 'package:flutter/material.dart';

import '../../../core/extensions/number_extension.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/router/app_routes.dart';
import '../../../domain/doctor/doctor_entity.dart';
import '../../constants/doctor_filter_type.dart';
import '../../constants/gap_constant.dart';
import '../../constants/medical_type.dart';
import '../../widgets/widgets.dart';

class DoctorsScreen extends StatelessWidget {
  DoctorsScreen({super.key, this.medicalType});

  final MedicalType? medicalType;

  final availableDoctors = [
    DoctorEntity(
        image: 'https://randomuser.me/api/portraits/thumb/men/75.jpg',
        name: 'Jennie Nichols',
        stars: 4.9),
    DoctorEntity(
        image: 'https://randomuser.me/api/portraits/women/43.jpg',
        name: 'Anny Rose',
        stars: 4.6),
    DoctorEntity(
        image: 'https://randomuser.me/api/portraits/women/88.jpg',
        name: 'Windsor Grey',
        stars: 4.5),
    DoctorEntity(
        image: 'https://randomuser.me/api/portraits/women/17.jpg',
        name: 'Jones Noa',
        stars: 3.7),
    DoctorEntity(
        image: 'https://randomuser.me/api/portraits/women/90.jpg',
        name: 'Campbell Mae',
        stars: 3.5),
    DoctorEntity(
        image: 'https://randomuser.me/api/portraits/women/48.jpg',
        name: 'Miller Wren',
        stars: 3.2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(medicalType?.toTitle(context) ?? ''),
      ),
      body: Padding(
        padding: GapConstants.large.horizontalPadding,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: GapConstants.medium.verticalPadding,
              sliver: SliverToBoxAdapter(
                child: SearchField(
                  hintText: L10n.of(context).translate.lblSearchDoctor,
                  onFilter: () {},
                ),
              ),
            ),
            SliverPadding(
              padding: GapConstants.large.verticalPadding,
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        PopupMenuWidget(
                          hintText: L10n.of(context).translate.lblAvailability,
                          items: DoctorAvailability.values,
                        ),
                        PopupMenuWidget(
                          hintText: L10n.of(context).translate.lblGender,
                          items: DoctorGender.values,
                        ),
                        PopupMenuWidget(
                            hintText: L10n.of(context).translate.lblPrice,
                            items: DoctorPrice.values),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: GapConstants.large.verticalPadding,
              sliver: SliverAnimatedList(
                initialItemCount: availableDoctors.length,
                itemBuilder: (context, index, animation) => UserListTile(
                  entity: availableDoctors[index],
                  medicalType: medicalType ?? MedicalType.ear,
                  onTap: () => Navigator.pushNamed(
                      context, AppRoutes.doctorDetail, arguments: {
                    'medicalType': medicalType,
                    'doctor': availableDoctors[index]
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
