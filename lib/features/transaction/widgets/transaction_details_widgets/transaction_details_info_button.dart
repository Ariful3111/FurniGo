import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';

class TransactionDetailsInfoButton extends StatelessWidget {
  const TransactionDetailsInfoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 52.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomPrimaryButton(
              text: 'Print',
              onPressed: () {},
              backgroundColor: AppColors.acceptButtonColor,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: CustomPrimaryButton(text: 'Download', onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
