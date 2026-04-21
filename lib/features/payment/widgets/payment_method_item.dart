import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

import '../../../core/constant/icons_path.dart';

class PaymentMethodItem extends StatelessWidget {
  final Map<String, dynamic> card;
  const PaymentMethodItem({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      padding: EdgeInsets.all(12.w),
      border: Border.all(color: AppColors.buttonBorderColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                card["icon"],
                height: 30.h,
                width: 48.w,
                fit: BoxFit.contain,
              ),
              SizedBox(width: 16.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomPrimaryText(
                        text: "${card["type"]} ${card["number"]}",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.titleColor,
                      ),
                      SizedBox(width: 10.w),
                      if (card["isDefault"])
                        SharedContainer(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 6.h,
                          ),
                          radius: 100.r,
                          border: Border.all(
                            color: AppColors.buttonBorderColor,
                          ),
                          child: CustomPrimaryText(
                            text: "Default",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: isDark
                                ? AppColors.whiteColor
                                : AppColors.titleColor,
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  CustomPrimaryText(
                    text: "Expires ${card["expiry"]}",
                    fontSize: 14.sp,
                    color: isDark
                        ? AppColors.primaryBorderColor
                        : AppColors.secondaryTextColor,
                  ),
                ],
              ),
            ],
          ),
          if (!card["isDefault"])
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: CustomPrimaryText(
                  text: "Set default",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppColors.whiteColor : AppColors.labelColor,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          SizedBox(width: 14.w),
          Image.asset(IconsPath.paymentDelete, height: 20.h, width: 20.w),
        ],
      ),
    );
  }
}
