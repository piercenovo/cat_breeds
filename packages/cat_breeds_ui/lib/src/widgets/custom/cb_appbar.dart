import 'package:cat_breeds_ui/cat_breeds_ui.dart';
import 'package:flutter/material.dart';

class CBAppBar extends StatelessWidget {
  const CBAppBar({
    this.title = '',
    this.subTitle,
    super.key,
    this.actions = const [],
    this.button,
    this.onArrowDown,
    this.onBack,
    this.textAlign = TextAlign.center,
    this.withDivider = true,
  });

  final String title;
  final String? subTitle;
  final List<Widget> actions;
  final Widget? button;
  final VoidCallback? onArrowDown;
  final VoidCallback? onBack;
  final TextAlign textAlign;
  final bool withDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: edgeInsetsV4.add(edgeInsetsH4),
          child: Row(
            children: [
              if (onBack != null) ...[
                CBIconButton(
                  iconData: CatBreedIcons.chevron_left,
                  onPressed: onBack!,
                  color: Palette.brandPrimary,
                  fontWeight: AppFontWeight.regular,
                ),
                space4,
              ],
              if (onBack == null) ...[
                const SizedBox(
                  width: 16,
                  height: 48,
                ),
              ],
              Expanded(
                child: Hero(
                  tag: 'header-appbar',
                  child: ColoredBox(
                    color: Palette.transparent,
                    child: RichText(
                      textAlign: textAlign,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: title,
                        style: context.textTheme.displayMedium?.apply(
                          fontSizeDelta: -8,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ...actions,
            ],
          ),
        ),
        ?button,
        if (withDivider) const CBDivider(),
      ],
    );
  }
}
