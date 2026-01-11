import 'package:cat_breeds/i18n/translations.g.dart';
import 'package:cat_breeds/lib.dart';
import 'package:cat_breeds_ui/cat_breeds_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CatBreedDetailScreen extends StatelessWidget {
  const CatBreedDetailScreen({super.key, required this.breed});
  final CatBreed breed;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return CBBaseScreen(
      appBar: CBAppBar(
        title: breed.name,
        textAlign: TextAlign.start,
        onBack: () => context.pop(),
      ),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: CatImageHeader(
              breed: breed,
              height: screenHeight * 0.5,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: edgeInsetsH20.add(edgeInsetsV24),
              decoration: const BoxDecoration(
                color: Palette.scaffoldBackground,
                borderRadius: borderRadiusVT24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CBIcon(
                        icon: CatBreedIcons.paw_print,
                        color: Palette.blue,
                        fontWeight: AppFontWeight.medium,
                      ),
                      space10,
                      Expanded(
                        child: Text(
                          breed.origin,
                          style: context.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Palette.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  gap12,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CBIcon(
                        icon: CatBreedIcons.cat_body,
                        color: Palette.green,
                        fontWeight: AppFontWeight.medium,
                      ),
                      space10,
                      Expanded(
                        child: Text(
                          breed.temperament,
                          style: context.textTheme.bodyLarge?.copyWith(
                            fontSize: 15,
                            color: Palette.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  gap12,
                  Row(
                    children: [
                      const CBIcon(
                        icon: CatBreedIcons.heart_plus,
                        color: Palette.red,
                        fontWeight: AppFontWeight.medium,
                      ),
                      space10,
                      Text(
                        texts.home.years(value: breed.lifeSpan),
                        style: context.textTheme.bodyLarge?.copyWith(
                          fontSize: 15,
                          color: Palette.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  gap16,
                  Text(
                    texts.home.description,
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Palette.textPrimary,
                    ),
                  ),
                  gap8,
                  Text(
                    breed.description,
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontSize: 15,
                      color: Palette.textSecondary,
                    ),
                  ),
                  gap12,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
