import 'dart:ffi';

import 'package:assesment_task/core/animations/fade_in_animation.dart';
import 'package:assesment_task/core/animations/sliding_animation.dart';
import 'package:assesment_task/core/constants/app_colors.dart';
import 'package:assesment_task/core/constants/assets.dart';
import 'package:assesment_task/core/constants/strings.dart';
import 'package:assesment_task/core/cubit/helper.dart';
import 'package:assesment_task/core/extensions/build_context_extension.dart';
import 'package:assesment_task/core/widgets/nav_bar.dart';
import 'package:assesment_task/core/widgets/no_design_view.dart';
import 'package:assesment_task/features/home/home_screen.dart';
import 'package:assesment_task/features/map/location_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<(String, Widget)> _navbarItems = [];

  @override
  void initState() {
    super.initState();
    _navbarItems.addAll([
      (Assets.searchFilled, const MapScreen()),
      (Assets.message, const HomePage()),
      (Assets.home, const HomePage()),
      (Assets.favourite, const HomePage()),
      (Assets.person, const HomePage()),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final handler = context.read<Handler<int>>();
    return Stack(
      children: [
        BlocBuilder<Handler<int>, int>(
          bloc: handler,
          builder: (context, state) {
            switch (state) {
              case 0:
                return const MapScreen();
              case 1:
                return const NoDesignView();
              case 2:
                return const HomePage();
              case 3:
                return const NoDesignView();
              case 4:
                return const NoDesignView();
              default:
                return const HomePage();
            }
          },
        ),
        Positioned(
          bottom: 20.0,
          right: 0.0,
          left: 0.0,
          child: SlideAnimation(
            playAfter: const Duration(seconds: 5),
            beginOffset: const Offset(0.0, 1.0),
            duration: const Duration(milliseconds: 1000),
            child: FadeInAnimation(
              playAfter: const Duration(seconds: 5),
              duration: const Duration(milliseconds: 1000),
              child: Navbar(
                items: _navbarItems,
                handler: handler,
                initialIndex: 2,
              ),
            ),
          ),
        )
      ],
    );
  }
}
