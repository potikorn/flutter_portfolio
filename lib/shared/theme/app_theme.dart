import 'package:flutter/material.dart';

class AppTheme {
  // Primary Colors
  static const Color darkNavy = Color(0xFF000022);
  static const Color navy = Color(0xFF001242);
  static const Color blue = Color(0xFF0094C6);

  // Background Colors
  static const Color backgroundPrimary = Color(0xFFF8F9FC);
  static const Color backgroundSecondary = Color(0xFFFFFFFF);
  static const Color cardBackground = Color(0xFFFFFFFF);

  // Text Colors
  static const Color textPrimary = Color(0xFF001242);
  static const Color textSecondary = Color(0xFF64748B);

  // Border Colors
  static const Color borderColor = Color(0xFFE2E8F0);

  // Accent Colors
  static const Color accentLight = Color(0xFFE6F4F9);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: backgroundPrimary,
      primaryColor: blue,
      colorScheme: const ColorScheme.light(
        primary: blue,
        secondary: navy,
        background: backgroundPrimary,
        surface: cardBackground,
      ),
      cardTheme: CardTheme(
        color: cardBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: borderColor),
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: textPrimary,
          fontSize: 32,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
        ),
        headlineMedium: TextStyle(
          color: textPrimary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
        ),
        titleLarge: TextStyle(
          color: textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5,
        ),
        titleMedium: TextStyle(
          color: textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.25,
        ),
        bodyLarge: TextStyle(
          color: textSecondary,
          fontSize: 16,
          letterSpacing: 0,
        ),
        bodyMedium: TextStyle(
          color: textSecondary,
          fontSize: 14,
          letterSpacing: 0,
        ),
      ),
      iconTheme: const IconThemeData(
        color: blue,
        size: 24,
      ),
      dividerTheme: const DividerThemeData(
        color: borderColor,
        thickness: 1,
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: blue,
        textTheme: ButtonTextTheme.primary,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: navy,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: -0.25,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: blue,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
