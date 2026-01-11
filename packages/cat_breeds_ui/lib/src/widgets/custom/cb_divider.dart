import 'package:cat_breeds_ui/cat_breeds_ui.dart';
import 'package:flutter/material.dart';

class CBDivider extends StatelessWidget {
  const CBDivider({super.key, this.useHero = true});
  final bool useHero;

  @override
  Widget build(BuildContext context) {
    final divider = SizedBox(
      width: double.infinity,
      height: 1,
      child: ColoredBox(
        color: context.theme.colorScheme.tertiary.withValues(alpha: .05),
      ),
    );
    if (useHero) {
      return Hero(
        tag: 'cb-divider',
        child: divider,
      );
    }
    return divider;
  }
}
