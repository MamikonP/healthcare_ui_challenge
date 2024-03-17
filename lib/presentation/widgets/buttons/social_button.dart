import 'package:flutter/material.dart';

import '../../../core/assets_text.dart';
import '../../../core/extensions/number_extension.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/themes/app_theme.dart';
import '../../constants/constants.dart';
import '../../constants/gap_constant.dart';
import '../widgets.dart';

enum SocialButtonType {
  google(AssetsText.icGoogle),
  apple(AssetsText.icApple);

  const SocialButtonType(this.icon);

  final String icon;

  String text(BuildContext context) => switch (this) {
        google => L10n.of(context).translate.btnSignInWithGoogle,
        apple => L10n.of(context).translate.btnSignInWithApple,
      };

  Color backgroundColor(BuildContext context) => switch (this) {
        google => AppTheme.currentThemeOf(context).colorScheme.background,
        apple => AppTheme.currentThemeOf(context).colorScheme.primary,
      };

  Color foregroundColor(BuildContext context) => switch (this) {
        google => AppTheme.currentThemeOf(context).colorScheme.primary,
        apple => AppTheme.currentThemeOf(context).colorScheme.onPrimary,
      };
}

class SocialButton extends StatelessWidget {
  const SocialButton._(SocialButtonType type) : buttonType = type;

  factory SocialButton.google() =>
      const SocialButton._(SocialButtonType.google);

  factory SocialButton.apple() => const SocialButton._(SocialButtonType.apple);

  final SocialButtonType buttonType;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      backgroundColor: buttonType.backgroundColor(context),
      padding: (GapConstants.medium - GapConstants.smaller).allPadding,
      radius: Constants.borderRadius,
      border: buttonType == SocialButtonType.google
          ? Border.all(color: AppTheme.currentThemeOf(context).gray400)
          : null,
      boxShadow: [
        BoxShadow(
          color: AppTheme.currentThemeOf(context).gray500.withAlpha(30),
          blurRadius: 15,
          spreadRadius: 5,
        )
      ],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AssetImageWidget.svg(imageName: buttonType.icon),
          (GapConstants.medium - GapConstants.smaller).horizontalSpace,
          Text(buttonType.text(context),
              style: AppTheme.currentThemeOf(context)
                  .subtitle1
                  .copyWith(color: buttonType.foregroundColor(context)))
        ],
      ),
    );
  }
}
