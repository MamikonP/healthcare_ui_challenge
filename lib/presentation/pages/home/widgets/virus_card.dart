import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/assets_text.dart';
import '../../../../core/extensions/number_extension.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../constants/constants.dart';
import '../../../constants/gap_constant.dart';
import '../../../widgets/widgets.dart';

class VirusCard extends StatelessWidget {
  const VirusCard(this.color, {super.key});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: Constants.borderRadius.allRadius),
      child: Stack(
        children: [
          Positioned(
            left: GapConstants.medium,
            top: 0,
            bottom: 0,
            right:
                (MediaQuery.sizeOf(context).width - GapConstants.largest) / 2,
            child: Center(
              child: HeaderWidget(
                title: L10n.of(context).translate.lblCoronavirusCardTitle,
                description:
                    L10n.of(context).translate.lblCoronavirusCardDescription,
                titleStyle: AppTheme.currentThemeOf(context)
                    .subtitle1
                    .copyWith(color: AppTheme.currentThemeOf(context).white),
                descriptionStyle: AppTheme.currentThemeOf(context)
                    .regular2
                    .copyWith(color: AppTheme.currentThemeOf(context).white),
                overflow: TextOverflow.clip,
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: ClipRRect(
                borderRadius: Constants.borderRadius.bottomRightRadius.copyWith(
                    topRight: const Radius.circular(Constants.borderRadius)),
                child: AssetImageWidget.png(imageName: AssetsText.imgVirus)),
          )
        ],
      ),
    );
  }
}
