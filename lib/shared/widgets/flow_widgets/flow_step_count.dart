import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class FlowStepCount extends StatelessWidget {
  final String currentPage;
  final String totalPage;
  const FlowStepCount({
    super.key,
    required this.currentPage,
    required this.totalPage,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPrimaryText(
      text: 'Step $currentPage of $totalPage',
      color: AppColors.greyColor,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    );
  }
}
