import 'package:flutter/material.dart';

import '../../../core/assets_text.dart';
import '../../../core/extensions/number_extension.dart';
import '../../../core/themes/app_theme.dart';
import '../../constants/gap_constant.dart';
import '../widgets.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    this.onChanged,
    this.onFilter,
    this.hintText = '',
  });

  final void Function(String?)? onChanged;
  final VoidCallback? onFilter;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFieldWidget(
            hintText: hintText,
            padding: GapConstants.small.horizontalPadding,
            maxLines: 1,
            onChanged: onChanged,
            prefixIcon: Padding(
              padding: GapConstants.small.horizontalPadding,
              child: AssetImageWidget.svg(imageName: AssetsText.icSearch),
            ),
          ),
        ),
        if (onFilter != null) ...[
          GapConstants.medium.horizontalSpace,
          IconWithBackground(
            assetIcon: AssetsText.icFilter,
            padding: GapConstants.smaller + GapConstants.small,
            backgroundColor: AppTheme.currentThemeOf(context).primary50,
            onTap: onFilter,
          )
        ]
      ],
    );
  }
}
