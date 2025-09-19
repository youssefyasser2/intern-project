import 'package:flutter/material.dart';

class ProgressCircleWidget extends StatelessWidget {
  final double actualValue;     
  final double targetValue;     
  final String label;           
  final Color color;            
  const ProgressCircleWidget({
    Key? key,
    required this.actualValue,
    required this.targetValue,
    required this.label,
    required this.color,
  }) : super(key: key);

  double get _percentage => targetValue == 0 ? 0 : (actualValue / targetValue) * 100;

  String get _percentageDisplay => '${_percentage.round()}%';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 60,
          height: 60,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: (_percentage / 100).clamp(0.0, 1.0), 
                strokeWidth: 4,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
              Text(
                _percentageDisplay,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          '${actualValue.toStringAsFixed(1)} / ${targetValue.toStringAsFixed(0)}',
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey[500],
          ),
        ),
      ],
    );
  }
}
            