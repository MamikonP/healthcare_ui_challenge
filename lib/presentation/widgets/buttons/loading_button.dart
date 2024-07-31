// ignore_for_file: avoid_dynamic_calls

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_btn/loading_btn.dart';

import '../../../core/extensions/number_extension.dart';
import '../../../core/themes/app_theme.dart';
import '../../constants/constants.dart';
import '../../constants/gap_constant.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    required this.text,
    required this.onTap,
    this.onStopLoading,
    super.key,
  });

  final String text;
  final FutureOr<void> Function() onTap;
  final FutureOr<void> Function()? onStopLoading;

  @override
  Widget build(BuildContext context) {
    return LoadingBtn(
      height: Constants.fieldHeight,
      borderRadius: Constants.borderRadius,
      animate: true,
      color: AppTheme.currentThemeOf(context).colorScheme.primary,
      width: MediaQuery.sizeOf(context).width,
      loader: Container(
        padding: GapConstants.small.allPadding,
        width: Constants.fieldHeight,
        height: Constants.fieldHeight,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
              AppTheme.currentThemeOf(context).colorScheme.onPrimary),
        ),
      ),
      child: Text(
        text,
        style: AppTheme.currentThemeOf(context).subtitle1.copyWith(
            color: AppTheme.currentThemeOf(context).colorScheme.onPrimary),
      ),
      onTap: (startLoading, stopLoading, btnState) async {
        if (btnState == ButtonState.idle) {
          FocusManager.instance.primaryFocus?.unfocus();
          startLoading();
          await onTap();
          stopLoading();
          await Future<void>.delayed(const Duration(milliseconds: 500))
              .then((value) => onStopLoading?.call());
        }
      },
    );
  }
}
