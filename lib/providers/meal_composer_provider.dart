import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../models/ingredient.dart';
import 'dart:convert';

final ingredientsProvider = FutureProvider<List<Ingredient>>((ref) async {
  final String response = await rootBundle.loadString('assets/intern-case-1.json');
  final data = jsonDecode(response) as Map<String, dynamic>;
  final List<dynamic> ingredientsJson = data['ingredients'];
  return ingredientsJson.map((json) => Ingredient.fromJson(json)).toList();
});

class GramsNotifier extends Notifier<Map<String, double>> {
  @override
  Map<String, double> build() {
    return {};
  }

  void updateGrams(String id, double grams) {
    state = {...state, id: grams};
  }
}

final gramsProvider = NotifierProvider<GramsNotifier, Map<String, double>>(() => GramsNotifier());

final totalMacrosProvider = Provider.family<double, String>((ref, macroType) {
  final ingredients = ref.watch(ingredientsProvider).asData?.value ?? [];
  final grams = ref.watch(gramsProvider);
  return ingredients.fold(0.0, (sum, i) {
    final g = grams[i.id] ?? 0.0;
    switch (macroType) {
      case 'kcal': return sum + (i.per100g.kcal * g / 100);
      case 'protein': return sum + (i.per100g.protein * g / 100);
      case 'carbs': return sum + (i.per100g.carbs * g / 100);
      case 'fat': return sum + (i.per100g.fat * g / 100);
      default: return sum;
    }
  });
});