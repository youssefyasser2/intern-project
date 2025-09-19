import 'package:flutter/material.dart';

class AppColors {
  static const Color backgroundColor = Color(0xFFF8F9FA);
  static const Color headerColor = Color(0xFF4CAF50);
  static const Color profileBg = Color(0xFFFFFFFF);
  static const Color searchIconColor = Color(0xFF9E9E9E);
  static const Color searchTextColor = Color(0xFF9E9E9E);
  static const Color primaryColor = Color(0xFF4CAF50);
  
  static const Color proteinColor = Color(0xFFFF6B6B);
  static const Color fatColor = Color(0xFFFFD166);
  static const Color carbColor = Color(0xFF06D6A0);
  
  static List<Color?> foodCardColors = [
    Color(0xFFFF6B6B),
    Color(0xFFFFD166),
    Color(0xFF06D6A0),
    Color(0xFF118AB2),
  ];
}

class AppSpacing {
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
}

class AppShadows {
  static List<BoxShadow> get defaultShadow => [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: Offset(0, 4),
        ),
      ];
  
  static List<BoxShadow> get strongShadow => [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 15,
          offset: Offset(0, 6),
        ),
      ];
}

List<BoxShadow> get defaultShadow {
  return [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 10,
      offset: Offset(0, 4),
    ),
  ];
}