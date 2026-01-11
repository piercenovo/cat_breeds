// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_breeds/i18n/translations.g.dart';
import 'package:cat_breeds/lib.dart';
import 'package:cat_breeds_ui/cat_breeds_ui.dart';
import 'package:flutter/material.dart';

class CatBreedCard extends StatelessWidget {
  const CatBreedCard({
    required this.breed,
    required this.onTap,
    super.key,
  });

  final CatBreed breed;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final name = (breed.name.isNotEmpty) ? breed.name : texts.home.unknown;
    final origin = (breed.origin.isNotEmpty)
        ? breed.origin
        : texts.home.unknown;
    final temperament = (breed.temperament.isNotEmpty)
        ? breed.temperament
        : texts.home.unknown;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: edgeInsetsH12.add(edgeInsetsV8),
        padding: edgeInsets12,
        decoration: BoxDecoration(
          color: Palette.surface.withOpacity(0.6),
          borderRadius: borderRadius16,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'cat-${breed.id}',
              child: ClipRRect(
                borderRadius: borderRadius12,
                child: CachedNetworkImage(
                  imageUrl: breed.imageUrl,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    width: 120,
                    height: 120,
                    color: Palette.neutral100,
                    child: const Icon(
                      Icons.pets,
                      size: 48,
                      color: Palette.neutral400,
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 120,
                    height: 120,
                    color: Palette.neutral100,
                    child: const Icon(
                      Icons.pets,
                      size: 48,
                      color: Palette.neutral400,
                    ),
                  ),
                ),
              ),
            ),
            space12,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Palette.textPrimary,
                    ),
                  ),
                  gap8,
                  Row(
                    children: [
                      const CBIcon(
                        icon: CatBreedIcons.paw_print,
                        color: Palette.blue,
                        size: CBIconSize.xLarge,
                        fontWeight: AppFontWeight.regular,
                      ),
                      space6,
                      Expanded(
                        child: Text(
                          origin,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: Palette.textSecondary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  gap4,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CBIcon(
                        icon: CatBreedIcons.cat_body,
                        color: Palette.green,
                        size: CBIconSize.xLarge,
                        fontWeight: AppFontWeight.regular,
                      ),
                      space6,
                      Expanded(
                        child: Text(
                          temperament,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: Palette.textSecondary,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
