import 'package:flutter/material.dart';

import '../../../core/extensions/number_extension.dart';
import '../../../core/themes/app_theme.dart';
import '../../constants/gap_constant.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.title,
    required this.description,
    this.titleStyle,
    this.overflow,
    this.descriptionStyle,
  });

  final String title;
  final String description;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: titleStyle ?? AppTheme.currentThemeOf(context).title1,
          overflow: overflow ?? TextOverflow.visible,
        ),
        GapConstants.small.verticalSpace,
        Text(
          description,
          style: descriptionStyle ?? AppTheme.currentThemeOf(context).regular1,
          overflow: overflow ?? TextOverflow.visible,
        ),
      ],
    );
  }
}
