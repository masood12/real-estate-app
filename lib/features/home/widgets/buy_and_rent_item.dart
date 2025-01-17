import 'package:assesment_task/core/animations/fade_in_animation.dart';
import 'package:assesment_task/core/animations/incremental_animation.dart';
import 'package:assesment_task/core/animations/sliding_animation.dart';
import 'package:assesment_task/core/constants/app_colors.dart';
import 'package:assesment_task/core/constants/strings.dart';
import 'package:assesment_task/core/extensions/build_context_extension.dart';
import 'package:assesment_task/core/extensions/widget_extension.dart';
import 'package:flutter/material.dart';

class BuyAndRentItem extends StatelessWidget {
  final int buyValue;
  final int rentValue;

  const BuyAndRentItem({
    super.key,
    this.buyValue = 1032,
    this.rentValue = 1920,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final titleMediumColor = context.titleMedium.color;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FadeInAnimation(
            duration: const Duration(seconds: 1),
            child: SlideAnimation(
              beginOffset: const Offset(-1.0, 0.0),
              child: Container(
                height: context.width * 0.42,
                width: context.width * 0.42,
                decoration: BoxDecoration(
                    color: context.primary,
                    borderRadius: BorderRadius.circular(context.width * .5)),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Strings.buy,
                      style: textTheme.bodyMedium?.copyWith(
                        color: titleMediumColor,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    IncrementalAnimation(
                      value: buyValue,
                      style: textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 42.0,
                      ),
                    ),
                    Text(Strings.offers,
                        style: textTheme.bodyMedium?.copyWith(
                          color: titleMediumColor,
                        )),
                  ],
                ),
              ).center(),
            ),
          ),
          const SizedBox(width: 16.0),
          FadeInAnimation(
            duration: const Duration(seconds: 1),
            child: SlideAnimation(
              beginOffset: const Offset(1.0, 0.0),
              child: Container(
                height: context.width * 0.42,
                width: context.width * 0.42,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(Strings.rent, style: textTheme.bodySmall),
                    const SizedBox(
                      height: 20,
                    ),
                    IncrementalAnimation(
                      value: rentValue,
                      style: textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 42.0,
                      ),
                    ),
                    Text(
                      Strings.offers,
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
              ).center(),
            ),
          ),
        ],
      ),
    );
  }
}
