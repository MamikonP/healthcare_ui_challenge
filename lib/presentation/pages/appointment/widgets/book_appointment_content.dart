import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/dialogs/animated_dialog.dart';
import '../../../../core/extensions/number_extension.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../constants/constants.dart';
import '../../../constants/gap_constant.dart';
import '../../../constants/medical_type.dart';
import '../../../widgets/widgets.dart';

class BookAppointmentContent extends StatefulWidget {
  const BookAppointmentContent({super.key});

  @override
  State<BookAppointmentContent> createState() => _BookAppointmentContentState();
}

class _BookAppointmentContentState extends State<BookAppointmentContent> {
  final medicalTypes = [
    MedicalType.ear,
    MedicalType.psychiatrist,
    MedicalType.dentist,
    MedicalType.dermatoVeneorologis,
  ];

  bool startAnimation = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: GapConstants.medium.topPadding,
          sliver: SliverToBoxAdapter(
            child: HeaderWidget(
              title: 'Medical Specialties',
              description: "Wide selection of doctor's specialties",
              titleStyle: AppTheme.currentThemeOf(context).title3,
              descriptionStyle: AppTheme.currentThemeOf(context)
                  .regular2
                  .copyWith(
                      color: AppTheme.currentThemeOf(context).typography500),
            ),
          ),
        ),
        SliverPadding(
          padding: GapConstants.medium.verticalPadding,
          sliver: SliverToBoxAdapter(
            child: SearchField(
              hintText: L10n.of(context).translate.lblSymptomsAndDiseases,
              onFilter: () {},
            ),
          ),
        ),
        SliverPadding(
          padding: GapConstants.large.verticalPadding,
          sliver: SliverList.builder(
            itemCount: medicalTypes.length,
            itemBuilder: (context, index) => AnimatedContainer(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 500 + (index * 100)),
              transform: Matrix4.translationValues(
                  startAnimation ? 0 : MediaQuery.sizeOf(context).width, 0, 0),
              child: ListTile(
                contentPadding: GapConstants.zero.allPadding,
                leading: IconWithBackground(
                  radius: 100,
                  assetIcon: medicalTypes[index].toIcon(context),
                  padding: GapConstants.small,
                  border: Border.all(
                      color: AppTheme.currentThemeOf(context).primary100),
                  backgroundColor: AppTheme.currentThemeOf(context).primary50,
                ),
                title: Text(medicalTypes[index].toTitle(context)),
                subtitle: Text(medicalTypes[index].toDescription(context)),
                trailing: RotatedBox(
                  quarterTurns: 2,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppTheme.currentThemeOf(context).colorScheme.primary,
                    size: Constants.iconMediumSize,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.doctor,
                      arguments: medicalTypes[index]);
                },
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: TextButton(
            onPressed: () => showAnimatedDialog(
                context, 'Coming soon', 'More coming soon...'),
            child: Row(
              children: [
                Text(
                  'See more',
                  style: AppTheme.currentThemeOf(context).subtitle1.copyWith(
                        color: AppTheme.currentThemeOf(context)
                            .colorScheme
                            .primary,
                      ),
                ),
                GapConstants.medium.horizontalSpace,
                RotatedBox(
                  quarterTurns: 2,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppTheme.currentThemeOf(context).colorScheme.primary,
                    size: Constants.iconMediumSize,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
