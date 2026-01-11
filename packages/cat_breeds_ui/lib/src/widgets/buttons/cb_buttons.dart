import 'package:cat_breeds_ui/cat_breeds_ui.dart';
import 'package:flutter/material.dart';

enum ButtonSize {
  small,
  medium,
  large,
}

extension on ButtonSize {
  double get fontSize {
    switch (this) {
      case ButtonSize.small:
        return 13;
      case ButtonSize.medium:
        return 15;
      case ButtonSize.large:
        return 17;
    }
  }

  double get height {
    switch (this) {
      case ButtonSize.small:
        return 32;
      case ButtonSize.medium:
        return 46;
      case ButtonSize.large:
        return 52;
    }
  }

  EdgeInsets get padding {
    switch (this) {
      case ButtonSize.small:
        return edgeInsetsH4;
      case ButtonSize.medium:
        return edgeInsetsH8;
      case ButtonSize.large:
        return edgeInsetsH10;
    }
  }
}

class CBBaseButton extends StatelessWidget {
  const CBBaseButton({
    super.key,
    this.onPressed,
    this.color,
    this.text,
    this.textColor = Palette.white,
    this.iconColor,
    this.icon,
    this.size = ButtonSize.medium,
    this.centered = true,
    this.textStyle,
    this.padding,
    this.child,
    this.rawSize,
    this.borderRadius = borderRadius10,
  });

  final void Function()? onPressed;
  final Color? color;
  final String? text;
  final Color? textColor;
  final Color? iconColor;
  final IconData? icon;
  final ButtonSize size;
  final bool centered;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final double? rawSize;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    return ClipRRect(
      borderRadius: borderRadius,
      child: SizedBox(
        height: size.height,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            disabledBackgroundColor: Palette.white.withValues(alpha: .1),
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
            padding: padding ?? size.padding,
            side: color != null
                ? BorderSide(
                    color: color!,
                    width: 1.3,
                  )
                : null,
          ),
          onPressed: onPressed,
          child:
              child ??
              Row(
                mainAxisAlignment: centered
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  if (icon != null) ...[
                    CBIcon(
                      icon: icon!,
                      color: iconColor,
                      size: CBIconSize.large,
                      fontWeight: AppFontWeight.medium,
                      rawSize: rawSize,
                    ),
                    if (text != null) space10,
                  ],
                  if (text != null) ...[
                    Text(
                      text!,
                      style:
                          textStyle ??
                          context.textTheme.titleLarge?.copyWith(
                            color: enabled
                                ? textColor
                                : Palette.white.withValues(alpha: .1),
                            fontSize: size.fontSize,
                            fontWeight: AppFontWeight.semiBold,
                          ),
                    ),
                  ],
                ],
              ),
        ),
      ),
    );
  }
}

class CBPrimaryButton extends CBBaseButton {
  const CBPrimaryButton({
    super.key,
    super.onPressed,
    super.text,
    super.icon,
    super.size = ButtonSize.medium,
    super.centered = true,
    super.textStyle,
    super.iconColor = Palette.white,
    super.textColor,
    super.padding,
    super.color = Palette.primary,
    super.child,
    super.borderRadius = borderRadius10,
  });

  @override
  Widget build(BuildContext context) {
    return CBBaseButton(
      centered: centered,
      padding: padding,
      icon: icon,
      size: size,
      text: text,
      onPressed: onPressed,
      textStyle: textStyle,
      textColor: textColor,
      iconColor: iconColor,
      color: color,
      borderRadius: borderRadius,
      child: child,
    );
  }
}

class CBSecondaryButton extends StatelessWidget {
  const CBSecondaryButton({
    super.key,
    this.onPressed,
    this.text,
    this.icon,
    this.size = ButtonSize.medium,
    this.centered = true,
    this.textStyle,
    this.iconColor = Palette.primary,
    this.textColor = Palette.primary,
    this.padding,
    this.borderColor = Palette.primary,
    this.disabledBorderColor,
    this.disabledTextColor,
    this.borderRadius = borderRadius10,
    this.rawSize,
    this.child,
  });

  final void Function()? onPressed;
  final String? text;
  final IconData? icon;
  final ButtonSize size;
  final bool centered;
  final TextStyle? textStyle;
  final Color? iconColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final Color borderColor;
  final Color? disabledBorderColor;
  final Color? disabledTextColor;
  final BorderRadiusGeometry borderRadius;
  final double? rawSize;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;

    return ClipRRect(
      borderRadius: borderRadius,
      child: SizedBox(
        height: size.height,
        child: OutlinedButton(
          style:
              OutlinedButton.styleFrom(
                padding: padding ?? size.padding,
                side: BorderSide(
                  color: enabled
                      ? borderColor
                      : (disabledBorderColor ??
                            borderColor.withValues(alpha: 0.3)),
                  width: 1.3,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadius,
                ),
              ).copyWith(
                overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(WidgetState.pressed)) {
                    return borderColor.withValues(alpha: 0.1);
                  }
                  return null;
                }),
              ),
          onPressed: onPressed,
          child:
              child ??
              Row(
                mainAxisAlignment: centered
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  if (icon != null) ...[
                    CBIcon(
                      icon: icon!,
                      color: iconColor,
                      size: CBIconSize.large,
                      fontWeight: AppFontWeight.medium,
                      rawSize: rawSize,
                    ),
                    if (text != null) space10,
                  ],
                  if (text != null)
                    Text(
                      text!,
                      style:
                          textStyle ??
                          context.textTheme.titleLarge?.copyWith(
                            color: enabled
                                ? textColor
                                : (disabledTextColor ??
                                      textColor?.withValues(alpha: 0.3)),
                            fontSize: size.fontSize,
                            fontWeight: AppFontWeight.semiBold,
                          ),
                    ),
                ],
              ),
        ),
      ),
    );
  }
}
