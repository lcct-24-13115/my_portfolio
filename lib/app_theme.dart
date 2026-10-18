import 'package:flutter/material.dart';

/// Central place for the app's look and feel.
///
/// Every screen reads colors and text styles from the theme built here,
/// which keeps the color scheme, typography, and spacing consistent in
/// both light and dark mode.
class AppTheme {
  AppTheme._(); // Not meant to be instantiated.

  /// Seed color: Material 3 generates the full matching palette from it.
  static const Color seed = Color(0xFF0B6FA4);

  /// Gradient behind the profile photo. White text stays readable on it
  /// in both light and dark mode.
  static const List<Color> headerGradient = [
    Color(0xFF0B6FA4),
    Color(0xFF083B5A),
  ];

  /// Standard padding used by every tab so layouts line up.
  static const EdgeInsets pagePadding = EdgeInsets.all(16);

  static ThemeData get light => _build(Brightness.light);

  static ThemeData get dark => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final scheme = ColorScheme.fromSeed(
      seedColor: seed,
      brightness: brightness,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      appBarTheme: AppBarTheme(
        backgroundColor: isDark ? scheme.surfaceContainerHigh : scheme.primary,
        foregroundColor: isDark ? scheme.onSurface : Colors.white,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        elevation: 1,
        margin: const EdgeInsets.only(bottom: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: scheme.primaryContainer,
        labelStyle: TextStyle(color: scheme.onPrimaryContainer),
        side: BorderSide.none,
      ),
    );
  }
}
