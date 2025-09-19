import 'package:flutter/material.dart';
import 'package:nutrifit/models/ingredient.dart';
import 'package:nutrifit/screens/food_detail_sheet.dart';
import 'package:nutrifit/widgets/food/large_food_card.dart';
import 'package:nutrifit/constants.dart';

class HorizontalFoodList extends StatelessWidget {
  final List<Ingredient> ingredients;
  final BuildContext context;

  const HorizontalFoodList({
    Key? key,
    required this.ingredients,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.only(right: 20),
        itemCount: ingredients.length,
        itemBuilder: (context, index) {
          final ingredient = ingredients[index];
          return LargeFoodCardWidget(
            title: ingredient.name,
            calories: '${ingredient.per100g.kcal.toInt()} kcal / 100g',
            imageUrl: ingredient.imageUrl,
            color: ingredient.color ?? AppColors.foodCardColors[index % AppColors.foodCardColors.length],
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => FractionallySizedBox(
                  heightFactor: 0.9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                    child: FoodDetailSheet(
                      ingredient: ingredient,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}