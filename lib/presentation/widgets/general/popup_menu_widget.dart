import 'package:flutter/material.dart';

import '../../../core/extensions/number_extension.dart';
import '../../../core/themes/app_theme.dart';
import '../../constants/constants.dart';
import '../../constants/gap_constant.dart';

class PopupMenuWidget<T> extends StatefulWidget {
  const PopupMenuWidget({
    super.key,
    required this.items,
    this.onSelected,
    this.hintText,
  });

  final List<T> items;
  final void Function(T?)? onSelected;
  final String? hintText;

  @override
  State<PopupMenuWidget<T>> createState() => _PopupMenuWidgetState<T>();
}

class _PopupMenuWidgetState<T> extends State<PopupMenuWidget<T>> {
  T? selected;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.1,
      color: AppTheme.currentThemeOf(context).gray50,
      shape: RoundedRectangleBorder(
        borderRadius: Constants.iconBackgroundBorderRadius.allRadius,
        side: BorderSide(
          color: AppTheme.currentThemeOf(context).gray200,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          dropdownColor: AppTheme.currentThemeOf(context).gray50,
          padding: GapConstants.small.horizontalPadding,
          value: selected,
          hint: widget.hintText != null ? Text(widget.hintText!) : null,
          items: widget.items
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(e is BaseEnum
                        ? (e as BaseEnum).toValue(context)
                        : e.toString()),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() => selected = value);
            widget.onSelected?.call(value);
          },
        ),
      ),
    );
  }
}
