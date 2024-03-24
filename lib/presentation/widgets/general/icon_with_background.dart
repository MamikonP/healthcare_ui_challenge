import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/extensions/number_extension.dart';
import '../../constants/constants.dart';
import '../widgets.dart';

class IconWithBackground extends StatefulWidget {
  const IconWithBackground({
    required this.assetIcon,
    this.onTap,
    this.padding,
    this.backgroundColor,
    this.iconColor,
    this.border,
    this.animation = false,
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
  final bool animation;

  @override
  State<IconWithBackground> createState() => _IconWithBackgroundState();
}

class _IconWithBackgroundState extends State<IconWithBackground>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat();
    _animation = Tween<double>(end: 2.0, begin: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animation.removeListener(() {});
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: widget.padding?.allPadding,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: widget.radius.allRadius,
          border: widget.border,
        ),
        child: !widget.animation
            ? _buildIcon()
            : Transform(
                alignment: FractionalOffset.center,
                transform: Matrix4.identity()
                  ..setEntry(2, 1, 0.0015)
                  ..rotateY(pi * _animation.value),
                child: _animation.value <= 0.5
                    ? _buildIcon()
                    : Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(pi * 2),
                        child: _buildIcon()),
              ),
      ),
    );
  }

  Widget _buildIcon() => widget.assetIcon.split('.')[1] == 'svg'
      ? AssetImageWidget.svg(
          imageName: widget.assetIcon,
          color: widget.iconColor,
        )
      : AssetImageWidget.png(imageName: widget.assetIcon);
}
