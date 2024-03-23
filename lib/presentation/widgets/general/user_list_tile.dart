import 'package:flutter/material.dart';

import '../../../core/extensions/number_extension.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/themes/app_theme.dart';
import '../../constants/constants.dart';
import '../../constants/gap_constant.dart';
import '../../constants/medical_type.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({
    super.key,
    required this.name,
    required this.medicalType,
    this.stars,
    this.onTap,
  });

  final String name;
  final MedicalType medicalType;
  final double? stars;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: GapConstants.zero.allPadding,
      isThreeLine: true,
      leading: CircleAvatar(
        child: Text(name.substring(0, 1)),
      ),
      title: Text(name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              '${medicalType.toTitle(context)} ${L10n.of(context).translate.lblSpecialist}'),
          Text('IDR. 120.000'),
        ],
      ),
      trailing: stars == null
          ? null
          : Row(
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
                Text(stars!.toString())
              ],
            ),
      onTap: onTap,
    );
  }
}
