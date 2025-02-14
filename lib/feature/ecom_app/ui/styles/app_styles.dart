import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle screenTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static const TextStyle itemTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static TextStyle itemSubtitle = TextStyle(
    fontSize: 14,
    color: Colors.grey[600],
  );

  static TextStyle smallText = TextStyle(
    fontSize: 12,
    color: Colors.grey[500],
  );

  static TextStyle buttonText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle buttonSmallText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const Color primaryColor = Color(0xFF2ECC71);
  static const Color secondaryTextColor = Colors.black54;
  static const Color greyTextColor = Color(0xFFAAAAAA);

  static const double defaultPadding = 16.0;
  static const double defaultRadius = 8.0;

  static BoxDecoration cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(defaultRadius),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ],
  );

  static TextStyle get nameStyle => itemTitle;
  static TextStyle get roleStyle => const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: primaryColor,
  );
  static TextStyle get emailStyle => TextStyle(
    fontSize: 16,
    color: greyTextColor,
  );
  static TextStyle get phoneStyle => TextStyle(
    fontSize: 16,
    color: greyTextColor,
  );

  static TextStyle get emptyStateTitle => const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Colors.black54,
  );
  static TextStyle get emptyStateSubtitle => TextStyle(
    fontSize: 16,
    color: Colors.grey[400],
  );
}
