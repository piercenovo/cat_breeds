// ignore_for_file: must_be_immutable

import 'package:cat_breeds_ui/cat_breeds_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CBTextField extends StatefulWidget {
  CBTextField({
    required this.controller,
    super.key,
    this.labelText,
    this.onChanged,
    this.hintText,
    this.onTap,
    this.prefixIcon,
    this.minLines,
    this.maxLines,
    this.lines,
    this.formatters = const [],
    this.maxLength,
    this.focusNode,
    this.optionalText,
    this.validator,
    this.autovalidateMode,
    this.borderSide = const BorderSide(color: Palette.neutral400, width: 1.2),
    this.textAlign = TextAlign.start,
    this.verticalPadding = 8,
    this.textStyle,
    this.obscureText = false,
    this.hasError = false,
    this.readOnly = false,
    this.initialValue,
    this.error,
    this.autofocus = false,
    this.enable = true,
    this.hintTextColor,
    this.onTooltip,
    this.onSubmitted,
    this.textInputAction,
    this.suffixIcon,
    this.keyboardType,
    this.isDense = false,
    this.autocorrect = true,
    this.padding = edgeInsetsZero,
  });

  CBTextField.password({
    required this.labelText,
    required this.controller,
    super.key,
    this.onChanged,
    this.hintText,
    this.onTap,
    this.prefixIcon,
    this.minLines,
    this.maxLines,
    this.lines,
    this.formatters = const [],
    this.maxLength,
    this.focusNode,
    this.optionalText,
    this.validator,
    this.autovalidateMode,
    this.borderSide = const BorderSide(color: Palette.neutral400, width: 1.2),
    this.textAlign = TextAlign.start,
    this.verticalPadding = 8,
    this.textStyle,
    this.hasError = false,
    this.readOnly = false,
    this.initialValue,
    this.error,
    this.autofocus = false,
    this.enable = true,
    this.hintTextColor,
    this.onTooltip,
    this.onSubmitted,
    this.textInputAction,
    this.keyboardType,
    this.isDense = false,
    this.autocorrect = true,
    this.padding = edgeInsetsZero,
  }) : obscureText = true,
       suffixIcon = null;

  final ValueChanged<String>? onChanged;
  final String? hintText;
  final String? labelText;
  final TextEditingController controller;
  final void Function()? onTap;
  final IconData? prefixIcon;
  final int? minLines;
  final int? maxLines;
  final int? lines;
  final List<TextInputFormatter> formatters;
  final int? maxLength;
  final FocusNode? focusNode;
  final String? optionalText;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final BorderSide borderSide;
  final TextAlign textAlign;
  final double verticalPadding;
  final TextStyle? textStyle;
  final bool obscureText;
  final bool hasError;
  final bool readOnly;
  String? initialValue;
  final Widget? error;
  final bool autofocus;
  final bool enable;
  final Color? hintTextColor;
  final VoidCallback? onTooltip;
  final ValueChanged<String>? onSubmitted;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool isDense;
  final bool autocorrect;
  final EdgeInsetsGeometry padding;

  @override
  State<CBTextField> createState() => _CBTextFieldState();
}

class _CBTextFieldState extends State<CBTextField> {
  late final FocusNode focusNode = widget.focusNode ?? FocusNode();
  late final obscureText = ValueNotifier<bool>(widget.obscureText);

  @override
  void dispose() {
    focusNode.dispose();
    obscureText.dispose();
    super.dispose();
  }

  OutlineInputBorder _inputBorder({
    Color? color,
    BorderSide? borderSide,
  }) {
    return OutlineInputBorder(
      borderRadius: borderRadius12,
      borderSide:
          borderSide ??
          BorderSide(
            color: color ?? Palette.neutral600,
            width: 1.2,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final prefixIcon = widget.prefixIcon;
    final suffixIcon = widget.suffixIcon;

    return ValueListenableBuilder(
      valueListenable: obscureText,
      builder: (_, value, _) => TextFormField(
        onTap: widget.onTap,
        autofocus: widget.autofocus,
        autocorrect: widget.autocorrect,
        initialValue: widget.initialValue,
        readOnly: widget.readOnly,
        onFieldSubmitted: widget.onSubmitted,
        obscuringCharacter: '*',
        obscureText: value,
        onChanged: widget.onChanged,
        focusNode: widget.focusNode ?? focusNode,
        controller: widget.controller,
        validator: widget.validator,
        enabled: widget.enable,
        keyboardType: widget.keyboardType,
        autovalidateMode: widget.autovalidateMode,
        textInputAction: widget.textInputAction,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 6,
          ),
          prefixIcon: prefixIcon == null
              ? null
              : CBIcon(
                  width: 30,
                  icon: prefixIcon,
                  fontWeight: AppFontWeight.regular,
                  color: Palette.brandPrimary,
                ),
          fillColor: widget.enable
              ? Palette.white
              : Palette.neutral200.withValues(alpha: 0.6),
          border: _inputBorder(borderSide: widget.borderSide),
          enabledBorder: _inputBorder(borderSide: widget.borderSide),
          focusedBorder: _inputBorder(color: Palette.primary),
          errorStyle: context.textTheme.bodySmall?.copyWith(
            color: Palette.red,
            height: 0.4,
          ),
          errorBorder: _inputBorder(color: Palette.red),
          labelText: widget.labelText,
          labelStyle: context.textTheme.bodyLarge,
          focusedErrorBorder: _inputBorder(color: Palette.red),
          suffixIcon: suffixIcon,
        ),
        textAlign: widget.textAlign,
        minLines: widget.lines ?? widget.minLines,
        maxLines: !widget.obscureText ? 1 : widget.lines ?? widget.maxLines,
        inputFormatters: [
          ...widget.formatters,
          LengthLimitingTextInputFormatter(widget.maxLength),
        ],
        style: widget.textStyle ?? context.textTheme.titleMedium,
      ),
    );
  }
}
