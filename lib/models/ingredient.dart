import 'package:flutter/material.dart';

class Per100g {
  final double kcal;
  final double protein;
  final double carbs;
  final double fat;

  Per100g({required this.kcal, required this.protein, required this.carbs, required this.fat});

  factory Per100g.fromJson(Map<String, dynamic> json) {
    return Per100g(
      kcal: (json['kcal'] as num).toDouble(),
      protein: (json['protein'] as num).toDouble(),
      carbs: (json['carbs'] as num).toDouble(),
      fat: (json['fat'] as num).toDouble(),
    );
  }
}

class Ingredient {
  final String id;
  final String name;
  final Per100g per100g;
  final String imageUrl;
  final Color? color;

  Ingredient({
    required this.id,
    required this.name,
    required this.per100g,
    required this.imageUrl,
    this.color,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    final colorHex = json['color'] as String?;
    return Ingredient(
      id: json['id'] as String,
      name: json['name'] as String,
      per100g: Per100g.fromJson(json['per100g'] as Map<String, dynamic>),
      imageUrl: json['imageUrl'] as String,
      color: colorHex != null ? Color(int.parse('FF${colorHex.substring(1)}', radix: 16)) : null,
    );
  }
}