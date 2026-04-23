import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/features/ai/widgets/ai_view_widgets/ai_dropdown_credit.dart';

class AiUserImageOverlay extends StatelessWidget {
  final Size screenSize;
  final LayerLink layerLink;
  final VoidCallback onDismiss;

  const AiUserImageOverlay({super.key, 
    required this.screenSize,
    required this.layerLink,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onDismiss,
          child: SizedBox(
            width: screenSize.width,
            height: screenSize.height,
            child: ColoredBox(color: Colors.transparent),
          ),
        ),
        Positioned(
          width: 300.w,
          child: CompositedTransformFollower(
            link: layerLink,
            offset: Offset(-120, 50.h),
            showWhenUnlinked: false,
            child: AiDropdownCredit(),
          ),
        ),
      ],
    );
  }
}
