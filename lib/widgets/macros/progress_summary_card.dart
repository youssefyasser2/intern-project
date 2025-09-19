import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrifit/providers/nutrition_provider.dart';
import 'package:nutrifit/constants.dart';
import 'package:nutrifit/widgets/macros/progress_circle.dart';

class ProgressSummaryCard extends ConsumerWidget {
  final NutritionState nutritionState; 
  final VoidCallback onMorePressed;

  const ProgressSummaryCard({
    Key? key,
    required this.nutritionState,
    required this.onMorePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.medium),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: AppShadows.defaultShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Today\'s Progress',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
              ),
              TextButton(
                onPressed: onMorePressed,
                child: const Text(
                  'View more',
                  style: TextStyle(fontSize: 14, color: AppColors.primaryColor, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildContent(nutritionState), 
        ],
      ),
    );
  }

  Widget _buildContent(NutritionState nutrition) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Calories', style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              Text('${nutrition.caloriesConsumed}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text('${nutrition.caloriesGoal} goal', style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
        Row(
          children: [
            ProgressCircleWidget(
              actualValue: nutrition.proteinConsumed,
              targetValue: nutrition.proteinGoal,
              label: 'Protein',
              color: AppColors.proteinColor,
            ),
            const SizedBox(width: 20),
            ProgressCircleWidget(
              actualValue: nutrition.fatConsumed,
              targetValue: nutrition.fatGoal,
              label: 'Fat',
              color: AppColors.fatColor,
            ),
            const SizedBox(width: 20),
            ProgressCircleWidget(
              actualValue: nutrition.carbsConsumed,
              targetValue: nutrition.carbsGoal,
              label: 'Carbs',
              color: AppColors.carbColor,
            ),
          ],
        ),
      ],
    );
  }
}