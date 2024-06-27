import 'package:assesment_task/core/constants/app_colors.dart';
import 'package:assesment_task/core/constants/strings.dart';
import 'package:assesment_task/core/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class NoDesignView extends StatelessWidget {
  const NoDesignView({super.key});

  @override
  Widget build(BuildContext context) {
    final textThem = Theme.of(context).textTheme;
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: context.height,
        color: AppColors.whiteColor,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Strings.noDesign,
                  style: textThem.bodyLarge?.copyWith(
                    color: AppColors.grulloColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  Strings.noDesignDescription,
                  textAlign: TextAlign.center,
                  style: textThem.bodyLarge?.copyWith(
                    color: AppColors.grulloColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
