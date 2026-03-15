import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/dashboard/widgets/order_details_widgets/order_details_status.dart';
import 'package:zb_dezign/features/dashboard/widgets/order_details_widgets/order_details_info.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      child: ListView(
        children: [
          CustomAppbar(
            title: 'Orders',
            onDrawerTap: () {
              Navigator.pop(context);
            },
            icon: IconsPath.back,
          ),
          SizedBox(height: 12.h),
          SharedContainer(
            radius: 12.r,
            padding: EdgeInsets.all(12.r),
            child: CustomPrimaryText(
              text: 'Order Details',
              color: isDark ? AppColors.whiteColor : AppColors.titleColor,
            ),
          ),
          SizedBox(height: 16.h,),
          OrderDetailsInfo(),
          SizedBox(height: 16.h,),
          OrderDetailsStatus(),
          SizedBox(height: 16.h,),
        ], 
      ),
    );
  }
}
