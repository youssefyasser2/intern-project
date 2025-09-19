import 'package:flutter/material.dart';

class DoneButton extends StatelessWidget {
  final VoidCallback onPressed;

  const DoneButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(0, 150, 140, 140),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
            elevation: 0,
          ),
          child: const Text(
            'Done',
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