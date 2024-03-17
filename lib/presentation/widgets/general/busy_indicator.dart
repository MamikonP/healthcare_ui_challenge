import 'package:flutter/material.dart';
import '../../constants/constants.dart';

enum BusyIndicatorType { lottie, circular, linear }

class BusyIndicator extends StatelessWidget {
  const BusyIndicator({
    Key? key,
    this.height = 45.0,
    this.width = 45.0,
    this.strokeWidth = 2,
    this.value,
    required this.valueColor,
    required this.backgroundColor,
  })  : duration = Duration.zero,
        indicatorType = BusyIndicatorType.circular,
        super(key: key);

  const BusyIndicator.lottie({super.key})
      : height = 100,
        width = 100,
        strokeWidth = 0,
        valueColor = Colors.transparent,
        backgroundColor = Colors.transparent,
        duration = Duration.zero,
        indicatorType = BusyIndicatorType.lottie,
        value = null;

  const BusyIndicator.linear({
    required this.valueColor,
    required this.backgroundColor,
    super.key,
  })  : height = 100,
        width = 100,
        strokeWidth = 0,
        duration = Duration.zero,
        indicatorType = BusyIndicatorType.linear,
        value = null;

  final double height;
  final double width;
  final double? value;
  final double strokeWidth;
  final Color valueColor;
  final Color backgroundColor;
  final Duration duration;
  final BusyIndicatorType indicatorType;

  @override
  Widget build(BuildContext context) {
    return switch (indicatorType) {
      BusyIndicatorType.lottie => Center(
          child:
              Wrap(children: <Widget>[SizedBox(width: width, height: height)]),
        ),
      BusyIndicatorType.circular => SizedBox(
          height: height,
          width: width,
          child: CircularProgressIndicator(
              value: value,
              backgroundColor: backgroundColor,
              valueColor: AlwaysStoppedAnimation<Color>(valueColor),
              strokeWidth: strokeWidth)),
      BusyIndicatorType.linear => LinearProgressIndicator(
          backgroundColor: backgroundColor,
          borderRadius: BorderRadius.circular(Constants.borderRadius),
          valueColor: AlwaysStoppedAnimation<Color>(valueColor),
        )
    };
  }
}
