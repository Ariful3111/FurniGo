import 'package:flutter/material.dart';
import 'package:zb_dezign/features/ai/widgets/ai_header.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';

class AiInteriorDesignView extends StatelessWidget {
  const AiInteriorDesignView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          AiHeader()
        ],
      ),
    );
  }
}