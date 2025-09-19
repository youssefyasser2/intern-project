import 'package:flutter/material.dart';
import 'package:nutrifit/providers/nutrition_provider.dart';

class TotalCaloriesCard extends StatelessWidget {
  final NutritionState nutrition;

  const TotalCaloriesCard({
    Key? key,
    required this.nutrition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          const Text(
            'Total Calories',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            '${nutrition.caloriesConsumed} kcal',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF4CAF50)),
          ),
        ],
      ),
    );
  }
}