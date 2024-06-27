import 'package:assesment_task/core/animations/fade_in_animation.dart';
import 'package:assesment_task/core/animations/sliding_animation.dart';
import 'package:assesment_task/core/animations/zoom_animation.dart';
import 'package:assesment_task/core/constants/assets.dart';
import 'package:assesment_task/core/widgets/network_image.dart';
import 'package:assesment_task/core/widgets/svg_asset.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return ColoredBox(
      color: theme.scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SlideAnimation(
              beginOffset: const Offset(0.2, 0.0),
              child: FadeInAnimation(
                child: Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgAssets(Assets.location, color: textTheme.bodyLarge?.color),
                      const SizedBox(width: 10.0),
                      Flexible(
                        child: Text(
                          'Karachi, Pakistan',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 6.0),
                    ],
                  ),
                ),
              ),
            ),
            ZoomInAnimation(
              child: AppNetworkImage(
                fit: BoxFit.cover,
                height: 40.0,
                width: 40.0,
                borderRadius: BorderRadius.circular(50.0),
                placeholder: (_, __) => CircleAvatar(
                  backgroundColor: theme.primaryColor.withOpacity(0.3),
                  child: SvgAssets(
                    Assets.person,
                    color: theme.primaryColor,
                  ),
                ),
                imageUrl: '',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
