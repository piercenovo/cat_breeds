import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_breeds/lib.dart';
import 'package:cat_breeds_ui/cat_breeds_ui.dart';
import 'package:flutter/material.dart';

class CatImageHeader extends SliverPersistentHeaderDelegate {
  CatImageHeader({required this.breed, required this.height});
  final CatBreed breed;
  final double height;

  @override
  double get minExtent => height;
  @override
  double get maxExtent => height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Hero(
      tag: 'cat-${breed.id}',
      child: ClipRRect(
        borderRadius: borderRadiusVB16,
        child: CachedNetworkImage(
          imageUrl: breed.imageUrl,
          width: double.infinity,
          height: height,
          fit: BoxFit.cover,
          placeholder: (context, url) => const ColoredBox(
            color: Palette.neutral50,
            child: Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
          errorWidget: (context, url, error) => const ColoredBox(
            color: Palette.neutral100,
            child: Icon(
              Icons.pets,
              size: 80,
              color: Palette.neutral400,
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
