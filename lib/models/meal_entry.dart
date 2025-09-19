class MealEntry {
  final String ingredientId;
  final String name;
  final double grams;
  final double protein;
  final double carbs;
  final double fat;
  final int calories;

  MealEntry({
    required this.ingredientId,
    required this.name,
    required this.grams,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.calories,
  });

  Map<String, dynamic> toJson() {
    return {
      'ingredientId': ingredientId,
      'name': name,
      'grams': grams,
      'protein': protein,
      'carbs': carbs,
      'fat': fat,
      'calories': calories,
    };
  }

  factory MealEntry.fromJson(Map<String, dynamic> json) {
    return MealEntry(
      ingredientId: json['ingredientId'],
      name: json['name'],
      grams: (json['grams'] as num).toDouble(),
      protein: (json['protein'] as num).toDouble(),
      carbs: (json['carbs'] as num).toDouble(),
      fat: (json['fat'] as num).toDouble(),
      calories: (json['calories'] as num).toInt(),
    );
  }
}