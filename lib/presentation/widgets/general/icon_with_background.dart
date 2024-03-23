import 'package:flutter/material.dart';

import '../../../core/extensions/number_extension.dart';
import '../../constants/constants.dart';
import '../widgets.dart';

class IconWithBackground extends StatelessWidget {
  const IconWithBackground({
    required this.assetIcon,
    this.onTap,
    this.padding,
    this.backgroundColor,
    this.iconColor,
    this.border,
    this.radius = Constants.iconBackgroundBorderRadius,
    super.key,
  });

  final String assetIcon;
  final VoidCallback? onTap;
  final double? padding;
  final double radius;
  final Color? backgroundColor;
  final Color? iconColor;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding?.allPadding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: radius.allRadius,
          border: border,
        ),
        child: assetIcon.split('.')[1] == 'svg'
            ? AssetImageWidget.svg(
                imageName: assetIcon,
                color: iconColor,
              )
            : AssetImageWidget.png(imageName: assetIcon),
      ),
    );
  }
}
