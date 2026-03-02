import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/features/dashboard/controller/reminder_controller.dart';
import 'package:zb_dezign/features/dashboard/widgets/dashboard_widget/dashboard_card.dart';
import 'package:zb_dezign/features/dashboard/widgets/dashboard_widget/dashboard_property_header.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class DashboardReminders extends StatelessWidget {
  const DashboardReminders({super.key});

  @override
  Widget build(BuildContext context) {
    ReminderController reminderController = Get.find();

    return Obx(() {
      final reminders = reminderController.reminderList;
      if (reminders.isEmpty) {
        return SizedBox.shrink();
      }
      return AnimatedSize(
        duration: Duration(milliseconds: 300),
        curve: Curves.linearToEaseOut,
        child: SharedContainer(
          padding: EdgeInsets.all(16.r),
          child: Column(
            children: [
              DashboardPropertyHeader(title: 'Remainder', onTap: () {}),
              SizedBox(height: 16.h),
              ...List.generate(reminders.length, (index) {
                final item = reminders[index];
                return Dismissible(
                  key: ObjectKey(item),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {
                    reminderController.reminderList.removeAt(index);
                  },
                  child: DashboardCard(
                    title: item.title,
                    sub: item.sub,
                    time: item.time,
                    icon: item.icon,
                    isLastIndex:
                        reminderController.reminderList.length - 1 == index,
                    button: Align(
                      alignment: Alignment.centerRight,
                      child: CustomPrimaryButton(
                        height: 36.h,
                        width: 90.w,
                        padding: EdgeInsets.symmetric(
                          vertical: 8.h,
                          horizontal: 16.w,
                        ),
                        text: 'Pay Now',
                        fontSize: 12.sp,
                        onPressed: () {
                          Get.toNamed(AppRoutes.dashboardPaymentView);
                        },
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      );
    });
  }
}
