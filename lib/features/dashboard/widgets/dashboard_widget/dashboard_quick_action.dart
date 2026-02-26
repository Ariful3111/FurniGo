import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class DashboardQuickAction extends StatelessWidget {
  const DashboardQuickAction({super.key});

  @override
  Widget build(BuildContext context) {
    List item = [
      {
        'icon': IconsPath.shopProduction,
        'title': 'Shop Products',
        'sub': 'Brand-new pieces with fast delivery and easy setup.',
      },
      {
        'icon': IconsPath.sellFurniture,
        'title': 'Sell Furniture',
        'sub': 'Get a fair offer fast pickup included.',
      },
      {
        'icon': IconsPath.rentProduct,
        'title': 'Rent Products',
        'sub': 'Brand-new pieces with fast delivery and easy setup.',
      },
      {
        'icon': IconsPath.design,
        'title': 'Design My Room',
        'sub': 'Brand-new pieces with fast delivery and easy setup.',
      },
    ];
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(text: 'Quick actions', color:isDark? AppColors.whiteColor:AppColors.titleColor),
          SizedBox(height: 8.h),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 8.h,
              childAspectRatio: 1.2,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: item.length,
            itemBuilder: (context, index) {
              final element = item[index];
              return SharedContainer(
                padding: EdgeInsets.zero,
                color: isDark ? AppColors.darkColor : AppColors.whiteColor,
                radius: 12.r,
                border: Border.all(
                  width: 0.68.r,
                  color: isDark
                      ? AppColors.darkBorderColor
                      : AppColors.buttonBorderColor,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      right: -28,
                      child: Image.asset(
                        IconsPath.quickAction,
                        height: 109.w,
                        width: 90.h,
                        color: AppColors.whiteColor.withValues(alpha: 0.2),
                        colorBlendMode: BlendMode.modulate,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            element['icon'],
                            height: 40.h,
                            width: 40.w,
                          ),
                          SizedBox(height: 12.h),
                          CustomPrimaryText(
                            text: element['title'],
                            fontSize: 14.sp,
                          ),
                          SizedBox(height: 8.h),
                          CustomPrimaryText(
                            text: element['sub'],
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w300,
                            color: isDark
                                ? AppColors.primaryBorderColor
                                : AppColors.greyTextColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
