import 'dart:ui';

import 'package:assesment_task/core/animations/fade_in_animation.dart';
import 'package:assesment_task/core/animations/sliding_animation.dart';
import 'package:assesment_task/core/constants/app_colors.dart';
import 'package:assesment_task/core/constants/strings.dart';
import 'package:assesment_task/core/extensions/widget_extension.dart';
import 'package:assesment_task/core/widgets/app_scaffold.dart';
import 'package:assesment_task/features/home/widgets/buy_and_rent_item.dart';
import 'package:assesment_task/features/home/widgets/home_app_bar.dart';
import 'package:assesment_task/features/home/widgets/listing_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textThem = Theme.of(context).textTheme;
    return AppScaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 450.0,
            pinned: false,
            elevation: 0.0,
            title: const HomeAppBar(),
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 70),
                  SlideAnimation(
                    beginOffset: const Offset(0.2, 0.0),
                    child: FadeInAnimation(
                      child: Text.rich(
                        TextSpan(
                          text: 'Hi, Masood',
                          style: textThem.bodyLarge
                              ?.copyWith(fontSize: 24.0, fontWeight: FontWeight.normal),
                          children: [
                            const TextSpan(text: '\n'),
                            TextSpan(
                              text: Strings.letsSelectYourPerfectPlace,
                              style: textThem.headlineLarge?.copyWith(fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ).paddingAll(16.0),
                    ),
                  ),
                  const BuyAndRentItem(),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SlideAnimation(
              beginOffset: const Offset(0.0, 1.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: const ListingItems(),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 72.0)),
        ],
      ).safeArea(),
    );
  }
}
