import 'package:assesment_task/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget? body;
  final Widget? drawer;
  final Key? scaffoldKey;
  final PreferredSizeWidget? appBar;

  const AppScaffold({
    super.key,
    this.drawer,
    this.appBar,
    this.body,
    this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(child: ColoredBox(color: Colors.white)),
        const Positioned(child: _BackgroundHome()),
        Positioned.fill(
          child: Scaffold(
            key: scaffoldKey,
            drawer: drawer,
            backgroundColor: Colors.transparent,
            appBar: appBar,
            body: body,
          ),
        ),
      ],
    );
  }
}

class _BackgroundHome extends StatelessWidget {
  const _BackgroundHome();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    const lightPeachColor = AppColors.lightPeach;
    const darkPeachColor = AppColors.darkPeach;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.scaffoldBackgroundColor,
            theme.scaffoldBackgroundColor,
            theme.scaffoldBackgroundColor,
            lightPeachColor,
            lightPeachColor,
            lightPeachColor,
            darkPeachColor.withOpacity(0.5),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
