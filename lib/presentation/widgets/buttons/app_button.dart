import 'package:flutter/material.dart';

import '../../../core/extensions/number_extension.dart';
import '../../constants/gap_constant.dart';
import '../widgets.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.child,
    this.spans,
    this.textStyle,
    this.backgroundColor,
    this.busyBackgroundColor,
    this.disabled = false,
    this.busy = false,
    this.onTap,
    this.onLongPress,
    this.height,
    this.width,
    this.radius = 3,
    this.padding,
    this.trailingIcon,
    this.shouldValidate = false,
    this.border,
    this.contentAlignment = Alignment.center,
    this.disabledColor,
    this.leadingIcon,
    this.boxShadow,
  }) : super(key: key);

  final Widget? child;
  final List<InlineSpan>? spans;
  final TextStyle? textStyle;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final Color? backgroundColor;
  final Color? disabledColor;
  final Color? busyBackgroundColor;
  final bool disabled;
  final bool busy;
  final bool shouldValidate;
  final double? height;
  final double? width;
  final double radius;
  final EdgeInsets? padding;
  final Widget? trailingIcon;
  final Widget? leadingIcon;
  final Border? border;
  final Alignment contentAlignment;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: shouldValidate
          ? onLongClick
          : !disabled
              ? onLongClick
              : null,
      onTap: shouldValidate
          ? onClick
          : !disabled
              ? onClick
              : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: !disabled
              ? backgroundColor
              : disabledColor ?? backgroundColor?.withOpacity(0.7),
          borderRadius: radius.allRadius,
          border: border,
          boxShadow: boxShadow,
        ),
        padding: padding ?? GapConstants.large.allPadding,
        alignment: contentAlignment,
        child: !busy
            ? child
            : Column(
                children: <Widget>[
                  BusyIndicator(
                    valueColor: busyBackgroundColor ??
                        Theme.of(context).colorScheme.onPrimary,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    width: 25,
                    height: 25,
                  ),
                ],
              ),
      ),
    );
  }

  void onClick() {
    if (!busy) {
      onTap?.call();
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  void onLongClick() {
    if (!busy) {
      onLongPress?.call();
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
