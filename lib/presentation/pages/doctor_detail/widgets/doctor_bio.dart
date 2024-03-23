import 'package:flutter/material.dart';

import '../../../../core/extensions/number_extension.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../constants/gap_constant.dart';
import '../../../widgets/widgets.dart';

class DoctorBio extends StatelessWidget {
  const DoctorBio({super.key, required this.bio});

  final String bio;

  @override
  Widget build(BuildContext context) => Card(
        color: AppTheme.currentThemeOf(context).white,
        elevation: 0.05,
        child: Padding(
          padding: GapConstants.medium.allPadding,
          child: HeaderWidget(
            title: 'Biography',
            description: bio,
          ),
        ),
      );
}
