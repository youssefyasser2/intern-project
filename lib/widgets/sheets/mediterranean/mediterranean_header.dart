import 'package:flutter/material.dart';

class MediterraneanHeader extends StatelessWidget {
  const MediterraneanHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: 108,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFF000000),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 30),
        const Text(
          'Mediterranean Lifestyle',
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w900,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          'This diet focuses on whole foods, featuring fresh vegetables, quality olive oil, lean fish, nutritious nuts, and whole grains. It offers a balanced and tasty way to eat that supports your goals.',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 55, 54, 54),
            height: 1.5,
          ),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}