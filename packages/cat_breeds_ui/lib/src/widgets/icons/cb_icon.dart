import 'package:cat_breeds_ui/cat_breeds_ui.dart';
import 'package:flutter/material.dart';

enum CBIconSize {
  small(12),
  medium(16),
  large(20),
  xLarge(22),
  bigger(24),
  massive(28),
  hyper(36);

  const CBIconSize(this.size);
  final double size;
}

class CBIcon extends StatelessWidget {
  const CBIcon({
    required this.icon,
    super.key,
    this.rawSize,
    this.size = CBIconSize.bigger,
    this.color,
    this.fontWeight = AppFontWeight.semiBold,
    this.alignment = Alignment.center,
    this.padding = edgeInsetsZero,
    this.width,
  });

  final IconData icon;
  final Color? color;
  final double? rawSize;
  final CBIconSize size;
  final FontWeight fontWeight;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry padding;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: padding,
        child: Align(
          alignment: alignment,
          child: Text(
            String.fromCharCode(icon.codePoint),
            style: TextStyle(
              color: color ?? context.theme.iconTheme.color,
              inherit: false,
              fontSize: rawSize ?? size.size,
              fontWeight: fontWeight,
              fontFamily: FontFamily.catBreed,
              package: CatBreedsUI.package,
            ),
          ),
        ),
      ),
    );
  }
}
