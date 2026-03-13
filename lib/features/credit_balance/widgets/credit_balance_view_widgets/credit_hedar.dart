import 'package:flutter/material.dart';

class CreditHeader extends StatelessWidget {
  const CreditHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Credit Usage",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Track how your credits are consumed over time",
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFF4C4C4C),
              ),
            )
          ],
        ),
        Text(
          "Balance: 1250",
          style: TextStyle(fontSize: 14),
        )
      ],
    );
  }
}
