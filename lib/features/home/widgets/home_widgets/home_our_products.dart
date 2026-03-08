import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/home/controller/home_controller.dart';
import 'package:zb_dezign/features/home/widgets/home_widgets/home_helper.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class HomeOurProducts extends StatelessWidget {
  const HomeOurProducts({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    List title = [
      'Table',
      'Chair',
      'Sofa',
      'Light',
      'Dining',
      'Glass',
      'Freeze',
      'Washing-machine',
      'Woven',
    ];
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          HomeHelper().categoryTitle(
            title: 'Our Products',
            onTap: () {},
            isDark: isDark,
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 45.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Obx(() {
                  final selected = homeController.productIndex.value == index;
                  return GestureDetector(
                    onTap: () {
                      homeController.productIndex.value = index;
                    },
                    child: AnimatedSize( 
                      duration: Duration(milliseconds: 300),
                      child: selected
                          ? Container(
                            margin:EdgeInsets.only(right:8),
                              height: 44.h,
                              padding: EdgeInsets.all(4.r),
                              decoration: BoxDecoration(
                                gradient: AppColors.primaryGradient,
                                borderRadius: BorderRadius.circular(32.r),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 4),
                                    blurRadius: 25,
                                    color: Color(
                                      0xFF8C63DD,
                                    ).withValues(alpha: 0.25),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  item(),
                                  SizedBox(width: 4.w,),
                                  CustomPrimaryText(
                                    text: title[index],
                                    fontSize: 14.sp,
                                    color: AppColors.whiteColor,
                                    textOverflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            )
                          : Padding(
                            padding: EdgeInsets.only(right:8),
                            child: item(),
                          ),
                    ),
                  );
                });
              },
              itemCount: title.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget item() {
    return Container(
      height: 44.h,
      width: 44.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.r),
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 25,
            color: AppColors.darkColor.withValues(alpha: 0.05),
          ),
        ],
      ),
      child: Center(
        child: Image.asset(IconsPath.furniture, height: 32.h, width: 32.w),
      ),
    );
  }
}
