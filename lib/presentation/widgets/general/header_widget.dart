import 'package:flutter/material.dart';

import '../../../core/extensions/number_extension.dart';
import '../../../core/themes/app_theme.dart';
import '../../constants/gap_constant.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTheme.currentThemeOf(context).title1,
        ),
        GapConstants.small.verticalSpace,
        Text(
          description,
          style: AppTheme.currentThemeOf(context).regular1,
        ),
      ],
    );
  }
}
