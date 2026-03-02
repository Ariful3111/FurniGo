import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/features/dashboard/widgets/dashboard_payment_widgets/dashboard_payment_header.dart';
import 'package:zb_dezign/features/dashboard/widgets/dashboard_payment_widgets/dashboard_payment_items.dart';
import 'package:zb_dezign/features/dashboard/widgets/dashboard_payment_widgets/dashboard_payment_save.dart';
import 'package:zb_dezign/features/dashboard/widgets/dashboard_payment_widgets/dashboard_payment_schedule.dart';
import 'package:zb_dezign/features/dashboard/widgets/dashboard_widget/dashboard_welcome.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_banner.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_drawer/custom_drawer.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class DashboardPaymentView extends StatelessWidget {
  const DashboardPaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: ListView(
        children: [
          CustomAppbar(
            title: 'Dashboard',
            onDrawerTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CustomDrawer();
                },
              );
            },
          ),
          SizedBox(height: 12.h),
          DashboardWelcome(),
          SizedBox(height: 16.h),
          CustomBanner(),
          SizedBox(height: 16.h),
          SharedContainer(
            padding: EdgeInsets.all(12.r),
            radius: 20.r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DashboardPaymentHeader(),
                SizedBox(height: 14.h),
                DashboardPaymentItems(),
                SizedBox(height: 12.h),
                DashboardPaymentSchedule(),
                SizedBox(height: 12.h),
                DashboardPaymentSave(),
              ],
            ))
        ],
      ),
    );
  }
}
