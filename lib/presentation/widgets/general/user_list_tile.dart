import 'package:flutter/material.dart';

import '../../../core/extensions/number_extension.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/themes/app_theme.dart';
import '../../../domain/doctor/doctor_entity.dart';
import '../../constants/constants.dart';
import '../../constants/gap_constant.dart';
import '../../constants/medical_type.dart';

class UserListTile extends StatelessWidget {
  const UserListTile({
    super.key,
    required this.medicalType,
    this.onTap,
    required this.entity,
  });

  final DoctorEntity entity;
  final MedicalType medicalType;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: GapConstants.zero.allPadding,
      isThreeLine: true,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(entity.image),
      ),
      title: Text(
        entity.name,
        style:
            AppTheme.currentThemeOf(context).subtitle1.copyWith(fontSize: 16),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              '${medicalType.toTitle(context)} ${L10n.of(context).translate.lblSpecialist}'),
          Text(
            'IDR. 120.000',
            style: AppTheme.currentThemeOf(context)
                .regular1
                .copyWith(color: AppTheme.currentThemeOf(context).gray500),
          ),
        ],
      ),
      trailing: entity.stars == null
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
                Text(entity.stars!.toString())
              ],
            ),
      onTap: onTap,
    );
  }
}
