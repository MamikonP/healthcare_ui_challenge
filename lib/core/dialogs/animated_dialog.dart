import 'package:flutter/material.dart';

import '../../presentation/constants/gap_constant.dart';
import '../extensions/number_extension.dart';

void showAnimatedDialog(
        BuildContext context, String title, String description) =>
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (_, __, ___) => Container(),
      transitionDuration: const Duration(milliseconds: 400),
      transitionBuilder: (context, animation, secondaryAnimation, child) =>
          ScaleTransition(
        scale: Tween<double>(begin: 0.5, end: 1).animate(animation),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0.5, end: 1).animate(animation),
          child: AlertDialog(
            title: Text(title),
            content: Text(description),
            shape: OutlineInputBorder(
              borderRadius: GapConstants.medium.allRadius,
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
