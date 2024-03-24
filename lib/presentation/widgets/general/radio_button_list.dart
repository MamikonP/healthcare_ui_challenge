import 'package:flutter/material.dart';

import '../../../core/themes/app_theme.dart';
import '../../constants/payment_method.dart';

class RadioButtonList<T> extends StatefulWidget {
  const RadioButtonList({
    required this.values,
    required this.onChanged,
    super.key,
  });

  final List<T> values;
  final void Function(T?) onChanged;

  @override
  State<RadioButtonList<T>> createState() => _RadioButtonListState<T>();
}

class _RadioButtonListState<T> extends State<RadioButtonList<T>> {
  T? groupValue;

  @override
  void initState() {
    super.initState();
    groupValue = widget.values.firstOrNull;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.values
          .map(
            (value) => Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        value is PaymentMethod
                            ? (value as PaymentMethod).toTitle(context)
                            : value.toString(),
                        style: AppTheme.currentThemeOf(context).subtitle1,
                      ),
                    ),
                    Radio<T>(
                      value: value,
                      groupValue: groupValue,
                      onChanged: (value) {
                        widget.onChanged(value);
                        setState(() {
                          groupValue = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
