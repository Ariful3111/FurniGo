import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/features/dashboard/widgets/dashboard_widget/dashboard_active_rentals.dart';
import 'package:zb_dezign/features/dashboard/widgets/dashboard_widget/dashboard_info.dart';
import 'package:zb_dezign/features/dashboard/widgets/dashboard_widget/dashboard_membership_notice.dart';
import 'package:zb_dezign/features/dashboard/widgets/dashboard_widget/dashboard_reminders.dart';
import 'package:zb_dezign/features/dashboard/widgets/dashboard_widget/dashboard_sell_quote.dart';
import 'package:zb_dezign/features/dashboard/widgets/dashboard_widget/dashboard_table.dart';
import 'package:zb_dezign/features/dashboard/widgets/dashboard_widget/dashboard_welcome.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_banner.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_drawer/custom_drawer.dart';
import 'package:zb_dezign/shared/widgets/custom_quick_action/custom_quick_action.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: SingleChildScrollView(
        child: Column(
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
            DashboardInfo(),
            SizedBox(height: 12.h),
            SharedContainer(child: CustomQuickAction()),
            SizedBox(height: 12.h),
            DashboardTable(),
            SizedBox(height: 12.h),
            DashboardActiveRentals(),
            SizedBox(height: 12.h),
            DashboardSellQuote(),
            SizedBox(height: 12.h),
            DashboardReminders(),
            SizedBox(height: 12.h),
            DashboardMembershipNotice(),
          ],
        ),
      ),
    );
  }
}
