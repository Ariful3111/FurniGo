import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/credit_balance/controller/credit_balance_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class CreditItems extends StatelessWidget {
  const CreditItems({super.key});

  @override
  Widget build(BuildContext context) {
    CreditBalanceController creditBalanceController = Get.find();
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 2.1,
        crossAxisCount: 2,
        crossAxisSpacing: 12.h,
        mainAxisSpacing: 12.w,
      ),
      itemCount: 10,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Obx(() {
          final isSelected =
              creditBalanceController.selectedItem.value == index;
          return GestureDetector(
            onTap: () {
              creditBalanceController.selectedItem.value = index;
            },
            child: SharedContainer(
              radius: 12.r,
              padding: EdgeInsets.all(12.w),
              color: isSelected
                  ? (isDark
                        ? AppColors.darkPendingBGColor
                        : AppColors.darkPendingTextColor)
                  : AppColors.whiteColor,
              border: Border.all(
                width: 1.r,
                color: isSelected ? AppColors.primaryColor : AppColors.primaryBorderColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        IconsPath.credit,
                        height: 16.h,
                        width: 16.w,
                        
                      ),
                      SizedBox(width: 8.w),
                      CustomPrimaryText(
                        text: '40 Credit',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.titleColor,
                      ),
                    ],
                  ),
                  Spacer(),
                  CustomPrimaryText(
                    text: '\$40',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: isDark
                        ? AppColors.darkPrimaryTextColor
                        : AppColors.titleColor,
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
