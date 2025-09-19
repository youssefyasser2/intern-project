import 'package:flutter/material.dart';

class MacroCardWidget extends StatelessWidget {
  final String title;
  final String value;
  final String percentage;
  final Color color;
  final Color? textColor;

  const MacroCardWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.percentage,
    required this.color,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color effectiveTextColor = textColor ?? Colors.white;


//  Clamp percentage value to 100%
    double percentageValue = double.parse(percentage.replaceAll('%', '')).clamp(0.0, 100.0);


    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: effectiveTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: effectiveTextColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 4,
            decoration: BoxDecoration(
              color: effectiveTextColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(2),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: percentageValue / 100,
              child: Container(
                decoration: BoxDecoration(
                  color: effectiveTextColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${percentageValue.round()}%',
            style: TextStyle(
              color: effectiveTextColor,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}