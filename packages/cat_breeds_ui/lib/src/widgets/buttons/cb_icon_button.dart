import 'package:cat_breeds_ui/cat_breeds_ui.dart';
import 'package:flutter/material.dart';

class CBIconButton extends StatelessWidget {
  const CBIconButton({
    required this.onPressed,
    super.key,
    this.icon,
    this.iconData,
    this.rawSize,
    this.size = CBIconSize.bigger,
    this.color,
    this.fontWeight = AppFontWeight.semiBold,
    this.padding = edgeInsetsZero,
    this.width,
  });

  final IconData? iconData;
  final Color? color;
  final double? rawSize;
  final CBIconSize size;
  final FontWeight fontWeight;
  final VoidCallback onPressed;
  final double? width;
  final Widget? icon;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: IconButton(
        onPressed: onPressed,
        splashColor: Palette.transparent,
        splashRadius: 1,
        style: IconButton.styleFrom(splashFactory: NoSplash.splashFactory),
        constraints: const BoxConstraints(maxHeight: 36, maxWidth: 36),
        icon:
            icon ??
            CBIcon(
              icon: iconData!,
              rawSize: rawSize,
              size: size,
              fontWeight: fontWeight,
              color: color ?? context.theme.iconTheme.color,
            ),
      ),
    );
  }
}
