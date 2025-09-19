import 'package:flutter/material.dart';
import 'package:nutrifit/providers/nutrition_provider.dart';
import 'package:nutrifit/widgets/macros/macro_card.dart';

class MacroGridSection extends StatelessWidget {
  final NutritionState nutrition;

  const MacroGridSection({
    Key? key,
    required this.nutrition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double proteinPercentage = (nutrition.proteinConsumed / nutrition.proteinGoal) * 100;
    double fatPercentage = (nutrition.fatConsumed / nutrition.fatGoal) * 100;
    double carbsPercentage = (nutrition.carbsConsumed / nutrition.carbsGoal) * 100;
    double fiberPercentage = (nutrition.fiberConsumed / nutrition.fiberGoal) * 100;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: MacroCardWidget(
                title: 'Protein',
                value: '${nutrition.proteinConsumed.toStringAsFixed(1)}g',
                percentage: '${proteinPercentage.round()}%',
                textColor: const Color(0xFF0F9B29),
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: MacroCardWidget(
                title: 'Carbs',
                value: '${nutrition.carbsConsumed.toStringAsFixed(1)}g',
                percentage: '${carbsPercentage.round()}%',
                color: const Color(0xFF0F9B29),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: MacroCardWidget(
                title: 'Fat',
                value: '${nutrition.fatConsumed.toStringAsFixed(1)}g',
                percentage: '${fatPercentage.round()}%',
                color: const Color(0xFF0F9B29),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: MacroCardWidget(
                title: 'Fiber',
                value: '${nutrition.fiberConsumed.toStringAsFixed(1)}g',
                percentage: '${fiberPercentage.round()}%',
                textColor: const Color(0xFF0F9B29),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}