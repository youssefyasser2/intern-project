import 'package:flutter/material.dart';
import '../constants.dart';

class CategoryTabWidget extends StatelessWidget {
  final String title;
  final bool isActive;

  const CategoryTabWidget({Key? key, required this.title, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isActive ? AppColors.primaryColor : Colors.grey[300]!,
            width: isActive ? 2.0 : 1.0,
          ),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isActive ? AppColors.primaryColor : Colors.grey[600],
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}