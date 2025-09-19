import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/ingredient.dart';
import 'dart:convert';

final ingredientsProvider = FutureProvider<List<Ingredient>>((ref) async {
  final String response = await rootBundle.loadString('assets/intern-case-1.json');
  final data = jsonDecode(response) as Map<String, dynamic>;
  final List<dynamic> ingredientsJson = data['ingredients'];
  return ingredientsJson.map((json) => Ingredient.fromJson(json)).toList();
});