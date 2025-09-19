import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrifit/providers/nutrition_provider.dart';
import 'package:nutrifit/widgets/header/app_header.dart';
import 'package:nutrifit/widgets/macros/progress_summary_card.dart';
import 'package:nutrifit/widgets/navigation/category_tab_row.dart';
import 'package:nutrifit/widgets/food/horizontal_food_list.dart';
import 'package:nutrifit/constants.dart';
import 'package:nutrifit/screens/mediterranean_sheet.dart';
import 'package:nutrifit/providers/ingredients_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nutritionState = ref.watch(nutritionProvider); 
    final ingredientsAsync = ref.watch(ingredientsProvider);

    void _openMediterraneanSheet() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => FractionallySizedBox(
          heightFactor: 0.85,
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            child: const MediterraneanSheet(),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFE3E3E3),
      body: Column(
        children: [
          AppHeader(onSettingsPressed: () {}),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.medium),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProgressSummaryCard(
                      nutritionState: nutritionState, 
                      onMorePressed: _openMediterraneanSheet,
                    ),
                    const SizedBox(height: 20),
                    const CategoryTabRow(),
                    const SizedBox(height: 20),
                    ingredientsAsync.when(
                      data: (ingredients) => HorizontalFoodList(
                        ingredients: ingredients,
                        context: context,
                      ),
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (err, stack) => Center(child: Text('Error: $err')),
                    ),
                    const SizedBox(height: 30),
                    _buildDoneButton(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoneButton(BuildContext context) {
    return Center(
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
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Coming Soon"),
                content: const Text("Not available yet"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("OK"),
                  ),
                ],
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
            elevation: 0,
          ),
          child: const Text(
            'More ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}