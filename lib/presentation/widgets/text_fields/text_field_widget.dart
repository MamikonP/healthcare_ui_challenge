import 'package:flutter/material.dart';

import '../../../core/assets_text.dart';
import '../../../core/extensions/number_extension.dart';
import '../../../core/themes/app_theme.dart';
import '../../constants/constants.dart';
import '../../constants/gap_constant.dart';
import '../widgets.dart';
import 'text_field_decoration.dart';

enum TextFieldType { outline, inline }

class _PasswordIcon extends StatelessWidget {
  const _PasswordIcon(this.updatePasswordVisibility, this.obscure);

  final VoidCallback updatePasswordVisibility;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: GapConstants.medium.rightPadding,
      child: InkWell(
        onTap: updatePasswordVisibility,
        child: !obscure
            ? RotatedBox(
                quarterTurns: 2,
                child: AssetImageWidget.svg(imageName: AssetsText.icEye))
            : AssetImageWidget.svg(imageName: AssetsText.icEye),
      ),
    );
  }
}

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(
      {super.key,
      this.title,
      this.labelText,
      this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.suffixIconPadding,
      this.prefixIconPadding,
      this.onChanged,
      this.controller,
      this.textInputAction = TextInputAction.done,
      this.textInputType = TextInputType.text,
      this.capitalization = TextCapitalization.none,
      this.maxLines,
      this.minLines = 1,
      this.maxLength,
      this.padding,
      this.textStyle,
      this.focusNode,
      this.enabled = true,
      this.obscureText = false,
      this.borderRadius = Constants.borderRadius,
      this.borderWidth = Constants.borderWidth,
      this.textFieldType = TextFieldType.outline,
      this.filledColor})
      : validator = null,
        formFieldKey = null;

  const TextFieldWidget.formField(
      {super.key,
      this.title,
      this.labelText,
      this.hintText,
      this.suffixIcon,
      this.prefixIcon,
      this.suffixIconPadding,
      this.prefixIconPadding,
      this.onChanged,
      this.controller,
      this.textInputAction = TextInputAction.done,
      this.textInputType = TextInputType.text,
      this.capitalization = TextCapitalization.none,
      this.maxLines,
      this.maxLength,
      this.minLines = 1,
      this.validator,
      this.formFieldKey,
      this.padding,
      this.textStyle,
      this.focusNode,
      this.enabled = true,
      this.obscureText = false,
      this.borderRadius = Constants.borderRadius,
      this.borderWidth = Constants.borderWidth,
      this.textFieldType = TextFieldType.outline,
      this.filledColor});

  final String? title;
  final String? labelText;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final EdgeInsets? suffixIconPadding;
  final EdgeInsets? prefixIconPadding;
  final void Function(String?)? onChanged;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final TextCapitalization capitalization;
  final TextInputType? textInputType;
  final int? maxLines;
  final int? maxLength;
  final int minLines;
  final String? Function(String?)? validator;
  final GlobalKey<FormFieldState<dynamic>>? formFieldKey;
  final EdgeInsets? padding;
  final bool enabled;
  final TextStyle? textStyle;
  final FocusNode? focusNode;
  final double borderRadius;
  final double borderWidth;
  final Color? filledColor;
  final TextFieldType textFieldType;
  final bool obscureText;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController _controller;
  bool obscure = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          Text(
            widget.title!,
            style: AppTheme.currentThemeOf(context).regular1,
          ),
          GapConstants.small.verticalSpace
        ],
        if (widget.validator != null)
          TextFormField(
              maxLength: widget.maxLength,
              enabled: widget.enabled,
              obscureText: obscure,
              key: widget.formFieldKey,
              focusNode: widget.focusNode,
              onChanged: widget.onChanged,
              textInputAction: widget.textInputAction,
              controller: _controller,
              maxLines: widget.maxLines,
              keyboardType: widget.textInputType,
              textAlignVertical: TextAlignVertical.center,
              decoration: _decoration,
              textCapitalization: widget.capitalization,
              validator: widget.validator)
        else
          TextField(
            maxLength: widget.maxLength,
            enabled: widget.enabled,
            obscureText: obscure,
            focusNode: widget.focusNode,
            onChanged: widget.onChanged,
            textInputAction: widget.textInputAction,
            controller: _controller,
            maxLines: widget.obscureText ? 1 : widget.maxLines,
            minLines: widget.minLines,
            keyboardType: widget.textInputType,
            textAlignVertical: TextAlignVertical.center,
            style: widget.textStyle ??
                (widget.labelText == null ? null : const TextStyle(height: 1)),
            textCapitalization: widget.capitalization,
            decoration: _decoration,
          ),
      ],
    );
  }

  InputDecoration get _decoration => switch (widget.textFieldType) {
        TextFieldType.inline => InlineDecoration.of(context).copyWith(
            filled: widget.filledColor != null,
            fillColor: widget.filledColor,
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.obscureText
                ? _PasswordIcon(updatePasswordVisibility, obscure)
                : widget.suffixIcon,
            contentPadding: widget.padding,
            suffixIconConstraints: const BoxConstraints(
              minHeight: Constants.iconDefaultSize,
              minWidth: Constants.iconDefaultSize,
            ),
            prefixIconConstraints: const BoxConstraints(
              minHeight: Constants.iconDefaultSize,
              minWidth: Constants.iconDefaultSize,
            ),
          ),
        TextFieldType.outline => OutlineDecoration.of(
            context,
            borderRadius: widget.borderRadius,
            borderWidth: widget.borderWidth,
          ).copyWith(
            filled: widget.filledColor != null,
            fillColor: widget.filledColor,
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.obscureText
                ? _PasswordIcon(updatePasswordVisibility, obscure)
                : widget.suffixIcon,
            contentPadding: widget.padding,
            suffixIconConstraints: const BoxConstraints(
              minHeight: Constants.iconDefaultSize,
              minWidth: Constants.iconDefaultSize,
            ),
            prefixIconConstraints: const BoxConstraints(
              minHeight: Constants.iconDefaultSize,
              minWidth: Constants.iconDefaultSize,
            ),
          )
      };

  void updatePasswordVisibility() => setState(() => obscure = !obscure);
}
