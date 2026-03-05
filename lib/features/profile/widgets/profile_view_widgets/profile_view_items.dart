import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/profile/controllers/profile_controller.dart';
import 'package:zb_dezign/features/profile/widgets/profile_view_widgets/theme_mode_switch_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class ProfileViewItems extends StatelessWidget {
  const ProfileViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    ProfileController profileController = Get.find();
    return Column(
      children: List.generate(profileController.profileList.length, (index) {
        final item = profileController.profileList[index];
        return GestureDetector(
          onTap: (){
            if(item['route']!=null){
              Get.toNamed(item['route']);
            }
          },
          child: SharedContainer(
            margin: EdgeInsets.only(
              bottom: profileController.profileList.length - 1 == index ? 0 : 8.h,
            ),
            padding: EdgeInsets.all(8.r),
            radius: 12.r,
            child: Row(
              children: [
                Container(
                  height: 44.h,
                  width: 44.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    gradient: isDark
                        ? AppColors.primaryGradient
                        : AppColors.darkPrimaryGradient.withOpacity(0.2),
                  ),
          
                  child: Center(
                    child: Image.asset(
                      item['icon'],
                      height: 24.h,
                      width: 24.w,
                      color:isDark? Color(0xFFBBD2F5):null,
                    ),
                  ),
                ),
          
                SizedBox(width: 8.w),
                CustomPrimaryText(
                  text: item['title'],
                  fontSize: 16.sp,
                  color: isDark ? AppColors.whiteColor : AppColors.darkColor,
                ),
                if (item['title'] == 'Switch Mode' ||
                    item['title'] == 'Notifications')
                  Spacer(),
                if (item['title'] == 'Notifications')
                  Container(
                    height: 24.h,
                    width: 24.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      gradient: AppColors.darkPrimaryGradient.withOpacity(isDark?1.0:0.5),
                    ),
                    child: Center(
                      child: CustomPrimaryText(
                        text: '3',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: isDark ? AppColors.whiteColor : Color(0xFF002256),
                      ),
                    ),
                  ),
                  if (item['title'] == 'Switch Mode')ThemeModeSwitchButton(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
