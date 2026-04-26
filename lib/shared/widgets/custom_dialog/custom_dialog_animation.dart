import 'package:flutter/material.dart';
import 'package:zb_dezign/core/constant/colors.dart';

class CustomDialogAnimation {
  void showAnimatedDialog({
    required BuildContext context,
    required Widget dialog,
    required bool isDark,
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Dialog",
      barrierColor: isDark
          ? AppColors.darkColor.withValues(alpha: 0.5)
          : AppColors.whiteColor.withValues(alpha: 0.5),
      transitionDuration: const Duration(milliseconds: 300),

      pageBuilder: (context, animation, secondaryAnimation) {
        return dialog;
      },

      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
          reverseCurve: Curves.easeInCubic,
        );

        return FadeTransition(
          opacity: curved,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.1), // from bottom
              end: Offset.zero,
            ).animate(curved),
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.9, end: 1).animate(curved),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
