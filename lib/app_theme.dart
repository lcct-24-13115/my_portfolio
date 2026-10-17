import 'package:flutter/material.dart';

/// Central place for the app's look and feel.
///
/// Every screen reads colors and text styles from the theme built here,
/// which keeps the color scheme, typography, and spacing consistent.
class AppTheme {
  AppTheme._(); // Not meant to be instantiated.

  /// Seed color: Material 3 generates the full matching palette from it.
  static const Color seed = Color(0xFF0B6FA4);

  /// Standard padding used by every tab so layouts line up.
  static const EdgeInsets pagePadding = EdgeInsets.all(16);

  static ThemeData get light {
    final scheme = ColorScheme.fromSeed(seedColor: seed);
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.primary,
        foregroundColor: Colors.white,
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
