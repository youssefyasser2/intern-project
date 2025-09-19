import 'package:flutter_riverpod/flutter_riverpod.dart';

class NutritionState {
  final double proteinConsumed;
  final double fatConsumed;
  final double carbsConsumed;
  final double fiberConsumed;
  final int caloriesConsumed;

  final double proteinGoal;
  final double fatGoal;
  final double carbsGoal;
  final double fiberGoal;
  final int caloriesGoal;

  NutritionState({
    this.proteinConsumed = 0.0,
    this.fatConsumed = 0.0,
    this.carbsConsumed = 0.0,
    this.fiberConsumed = 0.0,
    this.caloriesConsumed = 0,
    this.proteinGoal = 50.0,
    this.fatGoal = 40.0,
    this.carbsGoal = 130.0,
    this.fiberGoal = 25.0,
    this.caloriesGoal = 2000,
  });

  NutritionState copyWith({
    double? proteinConsumed,
    double? fatConsumed,
    double? carbsConsumed,
    double? fiberConsumed,
    int? caloriesConsumed,
  }) {
    return NutritionState(
      proteinConsumed: proteinConsumed ?? this.proteinConsumed,
      fatConsumed: fatConsumed ?? this.fatConsumed,
      carbsConsumed: carbsConsumed ?? this.carbsConsumed,
      fiberConsumed: fiberConsumed ?? this.fiberConsumed,
      caloriesConsumed: caloriesConsumed ?? this.caloriesConsumed,
      proteinGoal: proteinGoal,
      fatGoal: fatGoal,
      carbsGoal: carbsGoal,
      fiberGoal: fiberGoal,
      caloriesGoal: caloriesGoal,
    );
  }
}

final nutritionProvider = StateNotifierProvider<NutritionNotifier, NutritionState>((ref) {
  return NutritionNotifier();
});

class NutritionNotifier extends StateNotifier<NutritionState> {
  NutritionNotifier() : super(NutritionState());

  void addFood(double protein, double fat, double carbs, int calories, double fiber) {
    state = state.copyWith(
      proteinConsumed: state.proteinConsumed + protein,
      fatConsumed: state.fatConsumed + fat,
      carbsConsumed: state.carbsConsumed + carbs,
      fiberConsumed: state.fiberConsumed + fiber,
      caloriesConsumed: state.caloriesConsumed + calories,
    );
  }

  void resetDay() {
    state = state.copyWith(
      proteinConsumed: 0,
      fatConsumed: 0,
      carbsConsumed: 0,
      fiberConsumed: 0,
      caloriesConsumed: 0,
    );
  }
}