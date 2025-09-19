
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrifit/providers/nutrition_provider.dart';

class AddButtonSection extends ConsumerWidget {
  final String foodName;
  final double protein;
  final double fats;
  final double carbs;
  final int calories;
  final VoidCallback onAddPressed;

  const AddButtonSection({
    Key? key,
    required this.foodName,
    required this.protein,
    required this.fats,
    required this.carbs,
    required this.calories,
    required this.onAddPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Container(
            width: 266,
            height: 49,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color.fromARGB(255, 93, 201, 97), Color.fromARGB(255, 56, 105, 75)],
                stops: [0.2, 1],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(13),
            ),
            child: ElevatedButton(
              onPressed: () {
                ref.read(nutritionProvider.notifier).addFood(
                      protein,
                      fats,
                      carbs,
                      calories,
                      0.0, // fiber
                    );

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Row(
                      children: [
                        const Icon(Icons.check_circle, color: Colors.white, size: 20),
                        const SizedBox(width: 12),
                        Text(
                          '$foodName added successfully',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    backgroundColor: const Color(0xFF4CAF50),
                    duration: const Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.all(16),
                  ),
                );
                onAddPressed();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(0, 150, 140, 140),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
                elevation: 0,
              ),
              child: const Text(
                'Add to Meal',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}