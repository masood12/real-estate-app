import 'dart:math';

import 'package:flutter/material.dart';

extension BuildContextEntension on BuildContext {
  /// Size getters
  Size get size => MediaQuery.of(this).size;

  bool get isMobile => MediaQuery.of(this).size.width <= 500.0;

  bool get isTablet =>
      MediaQuery.of(this).size.width < 1024.0 && MediaQuery.of(this).size.width >= 650.0;

  bool get isSmallTablet =>
      MediaQuery.of(this).size.width < 650.0 && MediaQuery.of(this).size.width > 500.0;

  bool get isDesktop => MediaQuery.of(this).size.width >= 1024.0;

  bool get isSmall =>
      MediaQuery.of(this).size.width < 850.0 && MediaQuery.of(this).size.width >= 560.0;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  double get paddingTop => MediaQuery.of(this).padding.top;

  double get statusBarHeight => MediaQuery.of(this).padding.top;

  /// colors getters
  ThemeData get theme => Theme.of(this);

  IconThemeData get iconTheme => Theme.of(this).iconTheme;

  Brightness get brightness => Theme.of(this).brightness;

  ColorScheme get seedColor => Theme.of(this).colorScheme;

  Color get primary => Theme.of(this).colorScheme.primary;

  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;

  Color get primaryContainer => Theme.of(this).colorScheme.primaryContainer;

  Color get onPrimaryContainer => Theme.of(this).colorScheme.onPrimaryContainer;

  Color get secondary => Theme.of(this).colorScheme.secondary;

  Color get onSecondary => Theme.of(this).colorScheme.onSecondary;

  Color get secondaryContainer => Theme.of(this).colorScheme.secondaryContainer;

  Color get onSecondaryContainer => Theme.of(this).colorScheme.onSecondaryContainer;

  Color get surface => Theme.of(this).colorScheme.surface;

  Color get onSurface => Theme.of(this).colorScheme.onSurface;

  Color get error => Theme.of(this).colorScheme.error;

  Color get onError => Theme.of(this).colorScheme.onError;

  Color get errorContainer => Theme.of(this).colorScheme.errorContainer;

  Color get onErrorContainer => Theme.of(this).colorScheme.onErrorContainer;

  Color get shadow => Theme.of(this).colorScheme.shadow;

  Color get background => Theme.of(this).colorScheme.background;

  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;

  Color get cardColor => Theme.of(this).cardColor;

  AppBarTheme get appBarTheme => Theme.of(this).appBarTheme;

  Color get appBarColor => Theme.of(this).appBarTheme.backgroundColor!;

  Color get iconColor => Theme.of(this).iconTheme.color!;

  TextStyle get titleMedium => Theme.of(this).textTheme.titleMedium!;
}
