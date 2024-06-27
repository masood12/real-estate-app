import 'dart:ui';

import 'package:assesment_task/core/constants/app_colors.dart';
import 'package:assesment_task/core/cubit/helper.dart';
import 'package:assesment_task/features/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        fontFamily: GoogleFonts.raleway().fontFamily,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          primary: AppColors.primaryColor,
          onPrimary: Colors.white,
          secondary: const Color(0xff2B2B2B),
          onSecondary: Colors.white,
        ),
        textTheme: const TextTheme(
          bodySmall: TextStyle(color: AppColors.grulloColor, fontSize: 12),
          bodyMedium: TextStyle(color: AppColors.grulloColor, fontSize: 14),
          bodyLarge: TextStyle(color: AppColors.grulloColor, fontSize: 16),
        ),
        useMaterial3: false,
      ),
      home: BlocProvider(
        create: (context) => Handler<int>(2),
        child: const MainScreen(),
      ),
    );
  }
}
