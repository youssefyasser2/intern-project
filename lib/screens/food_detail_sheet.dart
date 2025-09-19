import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrifit/models/ingredient.dart';
import 'package:nutrifit/widgets/sheets/food/food_sheet_header.dart';
import 'package:nutrifit/widgets/sheets/food/quantity_input_section.dart';
import 'package:nutrifit/widgets/sheets/food/macros_display_section.dart';
import 'package:nutrifit/widgets/sheets/food/add_button_section.dart';

class FoodDetailSheet extends ConsumerStatefulWidget {
  final Ingredient ingredient;

  const FoodDetailSheet({Key? key, required this.ingredient}) : super(key: key);

  @override
  _FoodDetailSheetState createState() => _FoodDetailSheetState();
}

class _FoodDetailSheetState extends ConsumerState<FoodDetailSheet> {
  String quantity = '100';
  final TextEditingController _quantityController = TextEditingController(text: '100');

  @override
  void initState() {
    super.initState();
    _quantityController.text = quantity;
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double qty = double.tryParse(quantity) ?? 100.0;
    int totalCaloriesInt = (widget.ingredient.per100g.kcal * qty / 100).round();
    double totalProtein = widget.ingredient.per100g.protein * qty / 100;
    double totalFats = widget.ingredient.per100g.fat * qty / 100;
    double totalCarbs = widget.ingredient.per100g.carbs * qty / 100;

    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 8),
            width: 32,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              child: Column(
                children: [
                  FoodSheetHeader(
                    foodName: widget.ingredient.name,
                    calories: '${widget.ingredient.per100g.kcal.toInt()} kcal / 100g',
                    imageUrl: widget.ingredient.imageUrl,
                  ),
                  const SizedBox(height: 32),
                  QuantityInputSection(
                    controller: _quantityController,
                    onChanged: (value) => setState(() => quantity = value),
                  ),
                  const SizedBox(height: 32),
                  MacrosDisplaySection(
                    calories: totalCaloriesInt,
                    protein: totalProtein,
                    fats: totalFats,
                    carbs: totalCarbs,
                    servingSize: qty,
                  ),
                ],
              ),
            ),
          ),
          AddButtonSection(
            foodName: widget.ingredient.name,
            protein: totalProtein,
            fats: totalFats,
            carbs: totalCarbs,
            calories: totalCaloriesInt,
            onAddPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}