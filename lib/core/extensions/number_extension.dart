import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension NumberExtension on double {
  EdgeInsets get horizontalPadding => EdgeInsets.symmetric(horizontal: this);
  EdgeInsets get verticalPadding => EdgeInsets.symmetric(vertical: this);
  EdgeInsets get topPadding => EdgeInsets.only(top: this);
  EdgeInsets get bottomPadding => EdgeInsets.only(bottom: this);
  EdgeInsets get rightPadding => EdgeInsets.only(right: this);
  EdgeInsets get leftPadding => EdgeInsets.only(left: this);
  EdgeInsets get allPadding => EdgeInsets.all(this);

  BorderRadius get allRadius => BorderRadius.circular(this);
  BorderRadius get topLeftRadius =>
      BorderRadius.only(topLeft: Radius.circular(this));
  BorderRadius get topRightRadius =>
      BorderRadius.only(topRight: Radius.circular(this));
  BorderRadius get bottomLeftRadius =>
      BorderRadius.only(bottomLeft: Radius.circular(this));
  BorderRadius get bottomRightRadius =>
      BorderRadius.only(bottomRight: Radius.circular(this));

  SizedBox get horizontalSpace => SizedBox(width: this);
  SizedBox get verticalSpace => SizedBox(height: this);
}
