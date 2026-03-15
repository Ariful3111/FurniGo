import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/core/constant/images_path.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_product_placement_button.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_product_placement_place.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class HomeProductPlacement extends StatelessWidget {
  const HomeProductPlacement({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      color:isDark?Color(0xFF101010): Color(0xFFF5F5F5),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      radius: 0.r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: 'Product Placement ',
            color: isDark ? AppColors.whiteColor : AppColors.titleColor,
          ),
          SizedBox(height: 16.h),
          SharedContainer(
            padding: EdgeInsets.all(12.r),
            border: Border.all(width: 1.r, color:isDark?AppColors.darkBorderColor: AppColors.borderColor),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.widthOf(context),
                  height: 211.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImagesPath.placement),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 12.w,
                        top: 12.h,
                        child: CustomPrimaryText(
                          text: 'Visualize before you\nrent or buy',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      Positioned(
                        right: 11.w,
                        top: 26.h,
                        child: HomeProductPlacementButton(),
                      ),
                      Positioned(
                        bottom: 12.h,
                        left: 190.w,
                        child: SharedContainer(
                          color: AppColors.whiteColor,
                          width: 110.w,
                          padding: EdgeInsets.symmetric(
                            vertical: 5.66.h,
                            horizontal: 11.32.w,
                          ),
                          radius: 28.3.r,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                IconsPath.scan,
                                height: 9.43.h,
                                width: 9.43.w,
                              ),
                              CustomPrimaryText(
                                text: 'Change Products',
                                color: Color(0xFF62547C),
                                fontSize: 7.55.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                HomeProductPlacementPlace(
                  text: 'Place Your Product',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
