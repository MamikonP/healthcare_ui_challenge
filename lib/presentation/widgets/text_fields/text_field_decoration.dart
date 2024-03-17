import 'package:flutter/material.dart';

import '../../../core/extensions/number_extension.dart';
import '../../../core/themes/app_theme.dart';
import '../../constants/constants.dart';

class OutlineDecoration extends InputDecoration {
  const OutlineDecoration.of(this.context,
      {this.borderRadius = Constants.borderRadius,
      this.borderWidth = Constants.borderWidth});

  final BuildContext context;
  final double borderRadius;
  final double borderWidth;

  @override
  String? get counterText => '';

  @override
  bool? get alignLabelWithHint => true;

  @override
  TextStyle? get hintStyle => AppTheme.currentThemeOf(context)
      .regular1
      .copyWith(color: AppTheme.currentThemeOf(context).typography500);

  @override
  TextStyle? get labelStyle => AppTheme.currentThemeOf(context).regular1;

  @override
  InputBorder? get enabledBorder => _outlineInputBorder;

  @override
  InputBorder? get border => _outlineInputBorder;

  @override
  InputBorder? get focusedBorder => _outlineInputBorder;

  @override
  TextStyle? get errorStyle => AppTheme.currentThemeOf(context)
      .regular1
      .copyWith(color: AppTheme.currentThemeOf(context).danger500);

  @override
  InputBorder? get errorBorder => OutlineInputBorder(
      borderRadius: borderRadius.allRadius,
      borderSide: BorderSide(
        color: AppTheme.currentThemeOf(context).danger500,
        width: borderWidth,
        style: borderWidth == 0 ? BorderStyle.none : BorderStyle.solid,
      ));

  @override
  InputBorder? get focusedErrorBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        color: AppTheme.currentThemeOf(context).danger500,
        width: borderWidth,
        style: BorderStyle.none,
      ));

  OutlineInputBorder get _outlineInputBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        color: AppTheme.currentThemeOf(context).gray400,
        width: borderWidth,
        style: borderWidth == 0 ? BorderStyle.none : BorderStyle.solid,
      ));
}

class InlineDecoration extends OutlineDecoration {
  const InlineDecoration.of(BuildContext context) : super.of(context);

  @override
  InputBorder? get enabledBorder => InputBorder.none;

  @override
  InputBorder? get border => InputBorder.none;

  @override
  InputBorder? get focusedBorder => InputBorder.none;
}
