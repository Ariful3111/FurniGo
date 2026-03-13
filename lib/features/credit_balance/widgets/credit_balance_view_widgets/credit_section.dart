import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class CreditSection extends StatelessWidget {
  const CreditSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        SharedContainer(
          radius: 32.r,
          border: Border.all(
            color: isDark ? AppColors.darkBorderColor : AppColors.whiteColor,
            width: 4,
          ),
          gradient: isDark
              ? AppColors.darkAuthBG
              : LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                  colors: [
                    Color(0xFFD3EBFF),
                    Color(0xFFE8F5FF),
                    Colors.white,
                    Colors.white,
                  ],
                ),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor.withValues(alpha: 0.1),
              blurRadius: 41.4,
              offset: const Offset(0, 11.83),
            ),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomPrimaryText(
                text: "Purchase Credits",
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: isDark ? AppColors.whiteColor : AppColors.titleTextColor,
              ),
              SizedBox(height: 4.h),
              CustomPrimaryText(
                text: "Choose a credit pack that fits your design needs",
                fontSize: 14.sp,
                color: isDark
                    ? AppColors.darkPrimaryTextColor
                    : AppColors.secondaryTextColor,
              ),
              SizedBox(height: 24.h),
              Column(
                children: [
                  Row(
                    children: const [
                      Expanded(
                        child: CreditItem(
                          credit: "40 Credit",
                          price: "\$25.00",
                          isSelected: true,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: CreditItem(
                          credit: "80 Credit",
                          price: "\$125.00",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: CreditItem(
                          credit: "120 Credit",
                          price: "\$225.00",
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: CreditItem(
                          credit: "160 Credit",
                          price: "\$325.00",
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12),

                  Row(
                    children: const [
                      Expanded(
                        child: CreditItem(
                          credit: "200 Credit",
                          price: "\$425.00",
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: CreditItem(
                          credit: "250 Credit",
                          price: "\$500.00",
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              CustomPrimaryButton(
                text: "Proceed to Payment",
                backgroundColor: AppColors.primaryColor,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CreditItem extends StatelessWidget {
  final String credit;
  final String price;
  final bool isSelected;
  const CreditItem({
    super.key,
    required this.credit,
    required this.price,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SharedContainer(
      height: 79.h,
      radius: 12.r,
      padding: EdgeInsets.all(12.w),
      color: isSelected
          ? (isDark ? AppColors.darkPendingBGColor : AppColors.pendingBGColor)
          : null,
      border: Border.all(
        color: isSelected
            ? AppColors.primaryColor
            : (isDark
                  ? AppColors.darkBorderColor
                  : AppColors.primaryBorderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.credit_card,
                size: 16,
                color: isDark
                    ? AppColors.darkPrimaryTextColor
                    : AppColors.titleColor,
              ),
              SizedBox(width: 8.w),
              CustomPrimaryText(
                text: credit,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: isDark ? AppColors.whiteColor : AppColors.titleColor,
              ),
            ],
          ),
          Spacer(),
          CustomPrimaryText(
            text: price,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: isDark
                ? AppColors.darkPrimaryTextColor
                : AppColors.titleColor,
          ),
        ],
      ),
    );
  }
}
