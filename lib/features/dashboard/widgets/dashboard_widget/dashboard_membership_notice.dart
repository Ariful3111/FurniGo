import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/dashboard/widgets/dashboard_widget/dashboard_card.dart';
import 'package:zb_dezign/features/dashboard/widgets/dashboard_widget/dashboard_property_header.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class DashboardMembershipNotice extends StatelessWidget {
  const DashboardMembershipNotice({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLastIndex = false;
        bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SharedContainer(
      padding: EdgeInsets.all(16.r),
      child: Column(
        children: [
          DashboardPropertyHeader(title: 'Membership Notice', onTap: () {}),
          SizedBox(height: 16.h),
          DashboardCard(
            title: 'Membership Renewal',
            sub:
                'Renew your membership to avoid service interruption and keep enjoying member benefits.',
            time: 'Oct 15, 2025 - 11:30 pm',
            icon: IconsPath.notification,
            isLastIndex: isLastIndex,
            button: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomPrimaryButton(
                  backgroundColor: AppColors.whiteColor,
                  height: 36.h,
                  border: Border.all(width: 1.r,color: isDark?AppColors.darkBorderColor:Color(0xFFEBEDF0)),
                  width: 100.w,
                  textColor: AppColors.labelColor,
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                  text: 'View Detail',
                  fontSize: 12.sp,
                  onPressed: () {},
                ),
                SizedBox(width: 8.w,),
                CustomPrimaryButton(
                  height: 36.h,
                  width: 90.w,
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                  text: 'Pay Now',
                  fontSize: 12.sp,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
