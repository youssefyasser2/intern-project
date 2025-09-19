import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrifit/providers/nutrition_provider.dart';
import 'package:nutrifit/widgets/sheets/mediterranean/mediterranean_header.dart';
import 'package:nutrifit/widgets/sheets/mediterranean/macro_grid_section.dart';
import 'package:nutrifit/widgets/sheets/mediterranean/total_calories_card.dart';
import 'package:nutrifit/widgets/sheets/mediterranean/done_button.dart';

class MediterraneanSheet extends ConsumerWidget {
  const MediterraneanSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nutrition = ref.watch(nutritionProvider);

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFE3E3E3),
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MediterraneanHeader(),
            MacroGridSection(nutrition: nutrition),
            const SizedBox(height: 20),
            TotalCaloriesCard(nutrition: nutrition),
            const SizedBox(height: 35),
            DoneButton(onPressed: () => Navigator.pop(context)),
          ],
        ),
      ),
    );
  }
}