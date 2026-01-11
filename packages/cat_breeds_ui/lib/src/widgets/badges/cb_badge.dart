import 'package:cat_breeds_ui/cat_breeds_ui.dart';
import 'package:flutter/material.dart';

enum BadgeSize {
  small,
  medium,
  large,
  massive,
}

extension on BadgeSize {
  double get fontSize {
    switch (this) {
      case BadgeSize.small:
        return 12;
      case BadgeSize.medium:
        return 12.5;
      case BadgeSize.large:
        return 13;
      case BadgeSize.massive:
        return 14;
    }
  }

  EdgeInsets get paddingHorizontal {
    switch (this) {
      case BadgeSize.small:
        return edgeInsetsH4;
      case BadgeSize.medium:
        return edgeInsetsH6;
      case BadgeSize.large:
        return edgeInsetsH8;
      case BadgeSize.massive:
        return edgeInsetsH10;
    }
  }

  EdgeInsets get paddingVertical {
    switch (this) {
      case BadgeSize.small:
        return edgeInsetsV0;
      case BadgeSize.medium:
        return edgeInsetsV1;
      case BadgeSize.large:
        return edgeInsetsV2;
      case BadgeSize.massive:
        return edgeInsetsV4;
    }
  }
}

class CBBadge extends StatelessWidget {
  const CBBadge({
    required this.color,
    required this.mensaje,
    this.borderRadius = borderRadius8,
    this.size = BadgeSize.large,
    super.key,
  });
  final Color color;
  final String mensaje;
  final BorderRadiusGeometry borderRadius;
  final BadgeSize size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: color,
      ),
      padding: size.paddingHorizontal.add(size.paddingVertical),
      child: Text(
        mensaje,
        style: context.textTheme.titleSmall?.copyWith(
          color: Palette.white,
          fontSize: size.fontSize,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
