import 'package:flutter/material.dart';

import '../../../../core/extensions/number_extension.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../constants/gap_constant.dart';
import '../../../widgets/widgets.dart';

class DoctorWorkLocation extends StatelessWidget {
  const DoctorWorkLocation({super.key, required this.location});

  final String location;

  @override
  Widget build(BuildContext context) => Card(
        color: AppTheme.currentThemeOf(context).white,
        elevation: 0.05,
        child: Padding(
          padding: GapConstants.medium.allPadding,
          child: Column(
            children: [
              HeaderWidget(
                title: 'Work Location',
                description: location,
              ),
            ],
          ),
        ),
      );
}
