import 'package:cat_breeds_ui/cat_breeds_ui.dart';
import 'package:flutter/material.dart';

class CatBreedCardShimmer extends StatelessWidget {
  const CatBreedCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: edgeInsetsH12.add(edgeInsetsV8),
      padding: edgeInsets12,
      decoration: BoxDecoration(
        color: Palette.surface.withOpacity(0.6),
        borderRadius: borderRadius16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CBBaseShimmer(
            child: Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                color: Palette.neutral200,
                borderRadius: borderRadius12,
              ),
            ),
          ),
          space12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gap6,
                CBBaseShimmer(
                  child: Container(
                    width: double.infinity,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: Palette.neutral200,
                      borderRadius: borderRadius6,
                    ),
                  ),
                ),
                gap12,
                CBBaseShimmer(
                  child: Container(
                    width: 100,
                    height: 14,
                    decoration: const BoxDecoration(
                      color: Palette.neutral100,
                      borderRadius: borderRadius6,
                    ),
                  ),
                ),
                gap6,
                CBBaseShimmer(
                  child: Container(
                    width: double.infinity,
                    height: 14,
                    decoration: const BoxDecoration(
                      color: Palette.neutral100,
                      borderRadius: borderRadius6,
                    ),
                  ),
                ),
                gap4,
                CBBaseShimmer(
                  child: Container(
                    width: 150,
                    height: 14,
                    decoration: const BoxDecoration(
                      color: Palette.neutral100,
                      borderRadius: borderRadius6,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
