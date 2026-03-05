import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/profile/controllers/profile_setting_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class ProfileSettingAddressList extends StatelessWidget {
  const ProfileSettingAddressList({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    ProfileSettingController profileSettingController = Get.find();
    return Column(
      children: List.generate(profileSettingController.addressList.length, (
        index,
      ) {
        final item = profileSettingController.addressList[index];
        return SharedContainer(
          padding: EdgeInsets.all(16.r),
          radius: 16.r,
          margin: EdgeInsets.only(
            bottom: profileSettingController.addressList.length - 1 == index
                ? 0
                : 12.h,
          ),
          border: Border.all(
            width: 1.2.r,
            color: isDark
                ? AppColors.darkBorderColor
                : AppColors.fieldBorderColorLight,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomPrimaryText(
                          text: item['label'],
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: isDark
                              ? AppColors.whiteColor
                              : AppColors.titleColor,
                        ),
                        if (item['default'] == true)
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 2.h,
                            ),
                            decoration: BoxDecoration(
                              color: isDark
                                  ? AppColors.darkColor
                                  : AppColors.whiteColor,
                              border: Border.all(
                                width: 1.2.r,
                                color: isDark
                                    ? AppColors.darkBorderColor
                                    : AppColors.darkColor.withValues(alpha: 0.08),
                              ),
                            ),
                            child: Center(
                              child: CustomPrimaryText(
                                text: 'Default',
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
                                color: isDark
                                    ? AppColors.whiteColor
                                    : AppColors.darkTextColor,
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    CustomPrimaryText(
                      text: item['address'],
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: isDark
                          ? AppColors.primaryBorderColor
                          : AppColors.secondaryTextColor,
                    textOverflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              if (item['default'] != true)
                TextButton(
                  onPressed: () {},
                  child: CustomPrimaryText(text: 'Set default',color: isDark?AppColors.whiteColor:AppColors.lightGreyColor,fontSize: 12.w,fontWeight: FontWeight.w600,),
                ),
              InkWell(
                onTap: () {},
                child: SizedBox(
                  height: 36.h,
                  width: 40.w,
                  child: Center(
                    child: Image.asset(
                      IconsPath.delete,
                      height: 16.h,
                      width: 16.w,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
