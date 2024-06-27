import 'package:assesment_task/core/animations/sliding_animation.dart';
import 'package:assesment_task/core/constants/assets.dart';
import 'package:assesment_task/features/home/widgets/listing_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ListingItems extends StatelessWidget {
  const ListingItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
      beginOffset: const Offset(0.0, 1.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: const [
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: ListingImageView(
                path: Assets.image1,
                address: 'Karachi, Pakistan',
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: ListingImageView(
                path: Assets.image2,
                address: 'Karachi',
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: ListingImageView(
                path: Assets.image3,
                address: 'Pakistan',
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: ListingImageView(
                path: Assets.image4,
                address: 'Isalamabad',
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 2,
              child: ListingImageView(
                path: Assets.image2,
                address: 'Multan',
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 2,
              child: ListingImageView(
                path: Assets.image4,
                address: 'Islamabad',
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: ListingImageView(
                path: Assets.image2,
                address: 'Pakistan',
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: ListingImageView(
                path: Assets.image2,
                address: 'Pakistan',
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: ListingImageView(
                path: Assets.image2,
                address: 'Pakistan',
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 2,
              child: ListingImageView(
                path: Assets.image2,
                address: 'Pakistan',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
