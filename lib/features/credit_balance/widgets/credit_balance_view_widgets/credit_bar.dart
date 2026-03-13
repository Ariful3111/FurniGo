import 'package:flutter/material.dart';

class CreditBar extends StatelessWidget {
  final int value;
  final String month;

  const CreditBar({
    super.key,
    required this.value,
    required this.month,
  });

  @override
  Widget build(BuildContext context) {
    double height = value * 1.2;

    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(fontSize: 10),
        ),
        const SizedBox(height: 6),
        Container(
          width: 20,
          height: height,
          decoration: BoxDecoration(
            color: const Color(0xFFD4D4D4),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          month,
          style: const TextStyle(
            fontSize: 10,
            color: Color(0xFF4C4C4C),
          ),
        )
      ],
    );
  }
}
