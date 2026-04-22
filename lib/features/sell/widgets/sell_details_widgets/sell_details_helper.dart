import 'package:flutter/material.dart' hide StepState;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/sell/controller/sell_details_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

const Color _kDoneColor    = Color(0xFF21D19F);   // teal  — completed step
const Color _kCurrentColor = Color(0xFF1E1B4B);   // deep navy — active step
const Color _kFutureColor  = Color(0xFFE8E8E8);   // light gray — not yet reached
const Color _kDoneLine     = Color(0xFF21D19F);   // teal connector
const Color _kPendingLine  = Color(0xFFCDCDCD);   // gray connector

class SellDetailsHelper {

  Widget indicator(StepState state, int index) {
    final Color bg;
    final Widget inner;

    switch (state) {
      case StepState.done:
        bg = _kDoneColor;
        inner = Image.asset(
          IconsPath.mark,
          height: 22.h,
          width: 22.w,
          color: Colors.white,
        );
        break;

      case StepState.current:
        bg = _kCurrentColor;
        inner = CustomPrimaryText(
          text: '${index + 1}',
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        );
        break;

      case StepState.future:
        bg = _kFutureColor;
        inner = CustomPrimaryText(
          text: '${index + 1}',
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.labelColor,
        );
        break;
    }

    return Container(
      width: 44.w,
      height: 44.w,
      decoration: BoxDecoration(shape: BoxShape.circle, color: bg),
      child: Center(child: inner),
    );
  }

  Color lineColor(StepState state) =>
      state == StepState.done ? _kDoneLine : _kPendingLine;
}