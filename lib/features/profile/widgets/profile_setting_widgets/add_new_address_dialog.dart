import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/profile/widgets/profile_setting_widgets/add_new_address_dialog_fields.dart';
import 'package:zb_dezign/shared/widgets/custom_divider.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class AddNewAddressDialog extends StatelessWidget {
  const AddNewAddressDialog({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Dialog(
      alignment: Alignment.center,
      child: SharedContainer(
        padding: EdgeInsets.all(20.r),
        width: MediaQuery.widthOf(context),
        height: 805.h,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 28,
            color: AppColors.shadowColor.withValues(alpha: 0.1),
          ),
        ],
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomPrimaryText(
                      text: 'Add New Address',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? AppColors.whiteColor
                          : AppColors.darkTextColor,
                    ),
                    SizedBox(height: 4.h),
                    CustomPrimaryText(
                      text: 'Manage your delivery and billing locations',
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: isDark
                          ? AppColors.primaryBorderColor
                          : AppColors.greyTextColor,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    IconsPath.close,
                    height: 20.h,
                    width: 20.w,
                    color: isDark ? AppColors.whiteColor : Color(0xFF1C1B1F),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h,),
            CustomDivider(),
            SizedBox(height: 16.h,),
            AddNewAddressDialogFields()
          ],
        ),
      ),
    );
  }
}
