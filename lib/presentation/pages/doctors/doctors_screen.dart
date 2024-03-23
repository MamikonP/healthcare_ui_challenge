import 'package:flutter/material.dart';

import '../../../core/extensions/number_extension.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/themes/app_theme.dart';
import '../../constants/constants.dart';
import '../../constants/doctor_filter_type.dart';
import '../../constants/gap_constant.dart';
import '../../constants/medical_type.dart';
import '../../widgets/widgets.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key, this.medicalType});

  final MedicalType? medicalType;

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
                initialItemCount: 10,
                itemBuilder: (context, index, animation) => ListTile(
                  contentPadding: GapConstants.zero.allPadding,
                  isThreeLine: true,
                  leading: CircleAvatar(
                    child: Text('A'),
                  ),
                  title: Text('Dr. Patricia Ahoy'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ear, Nose & Throat specialist'),
                      Text('IDR. 120.000'),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RotatedBox(
                        quarterTurns: 2,
                        child: Icon(
                          Icons.star,
                          color: AppTheme.currentThemeOf(context).warning400,
                          size: Constants.iconMediumSize,
                        ),
                      ),
                      Text('4.5')
                    ],
                  ),
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
