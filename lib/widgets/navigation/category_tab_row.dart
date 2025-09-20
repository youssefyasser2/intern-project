import 'package:flutter/material.dart';
import 'package:nutrifit/widgets/category_tab.dart';

class CategoryTabRow extends StatelessWidget {
  const CategoryTabRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CategoryTabWidget(title: 'Foods', isActive: true),
        const SizedBox(width: 20),
        const CategoryTabWidget(title: 'Drinks', isActive: false),
        const SizedBox(width: 20),
        const CategoryTabWidget(title: 'Snacks', isActive: false),
        const SizedBox(width: 20),
        const CategoryTabWidget(title: 'Sauce', isActive: false),
      ],
    );
  }
}