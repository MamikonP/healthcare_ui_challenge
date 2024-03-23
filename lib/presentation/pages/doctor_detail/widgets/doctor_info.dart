import 'package:flutter/material.dart';

import '../../../../core/assets_text.dart';
import '../../../../core/extensions/number_extension.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../constants/gap_constant.dart';
import '../../../constants/medical_type.dart';
import '../../../widgets/widgets.dart';

class _DoctorInfo extends StatelessWidget {
  const _DoctorInfo({
    required this.assetIcon,
    required this.title,
    required this.subtitle,
  });

  final String assetIcon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          AssetImageWidget.svg(imageName: assetIcon),
          GapConstants.smaller.horizontalSpace,
          Text(
            title,
            style: AppTheme.currentThemeOf(context).regular2.copyWith(
                color: AppTheme.currentThemeOf(context).typography700),
          ),
        ],
      ),
      subtitle: Text(subtitle),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppTheme.currentThemeOf(context).white,
      elevation: 0.05,
      child: Padding(
        padding: GapConstants.medium.allPadding,
        child: Column(
          children: [
            UserListTile(
              name: 'Dr Stone Gaze',
              medicalType: MedicalType.ear,
            ),
            Row(
              children: [
                Expanded(
                  child: _DoctorInfo(
                    assetIcon: AssetsText.icHospital,
                    title: L10n.of(context).translate.lblHospital,
                    subtitle: 'RS. Hermina',
                  ),
                ),
                const Text('|'),
                Expanded(
                  child: _DoctorInfo(
                    assetIcon: AssetsText.icClock,
                    title: L10n.of(context).translate.lblWorkingHour,
                    subtitle: '07.00 - 18.00',
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
