// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';

abstract class Constants {
  static const double borderRadius = 12;
  static const double iconBackgroundBorderRadius = 8;
  static const double borderWidth = 1;
  static const double fieldHeight = 48;
  static const double zero = 0;
  static const double iconDefaultSize = 24;
  static const double iconSmallSize = 12;
  static const double iconMediumSize = 16;
  static const double virusCardHeight = 120;
  static const double popupCardHeight = 32;
}

abstract class BaseEnum {
  String toValue(BuildContext context);
}
