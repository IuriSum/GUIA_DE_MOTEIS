import 'package:flutter/material.dart';

class AppColors {
  // Background Color
  static const Color backgroundColor = Color(0xFFFFFFFF); // White

  // Header/Footer Colors
  static const Color headerFooterColor1 = Color(0xFF1A1A1A); // Dark Gray
  static const Color headerFooterColor2 = Color(0xFF000000); // Black

  // Accent Colors
  static const Color accentColor1 = Color(0xFFFFA500); // Orange
  static const Color accentColor2 = Color(0xFFFF0000); // Red

  // Text Colors
  static const Color primaryTextColor = Color(0xFF333333); // Dark Gray
  static const Color secondaryTextColor = Color(0xFF666666); // Medium Gray

  // Link Color
  static const Color linkColor = Color(0xFF0000FF); // Blue

  // Method to return all colors as a list
  static List<Color> getAllColors() {
    return [
      backgroundColor,
      headerFooterColor1,
      headerFooterColor2,
      accentColor1,
      accentColor2,
      primaryTextColor,
      secondaryTextColor,
      linkColor,
    ];
  }
}