import 'package:cat_breeds_ui/cat_breeds_ui.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CBBaseShimmer extends StatelessWidget {
  const CBBaseShimmer({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final firstColour = isDark
        ? Palette.neutral600
        : Palette.neutral200.withValues(alpha: .9);
    final secondColour = isDark
        ? Palette.neutral600.withValues(alpha: .9)
        : Palette.neutral100.withValues(alpha: .8);

    return Shimmer(
      period: duration1800ms,
      gradient: LinearGradient(
        colors: [
          firstColour,
          secondColour,
        ],
      ),
      child: child,
    );
  }
}
