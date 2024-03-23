import 'package:flutter/material.dart';

import '../../core/themes/app_theme.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Coming Soon',
        style: AppTheme.currentThemeOf(context).title1,
      ),
    );
  }
}
