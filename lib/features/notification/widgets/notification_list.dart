import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/notification/controller/notification_controller.dart';
import 'package:zb_dezign/features/notification/widgets/notification_list_info.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController notificationController = Get.find();
    List notification = [
      {
        "title": "Payment complete.",
        'time': '10 min ago',
        'sub':
            'Your full payment for Order #RNT-1024 has been completed successfully. Your full payment for Order #RNT-1024 has been completed successfully.',
      },
      {
        "title": "Payment complete.",
        'time': '10 min ago',
        'sub':
            'Your full payment for Order #RNT-1024 has been completed successfully. Your full payment for Order #RNT-1024 has been completed successfully.',
      },
      {
        "title": "Reminder for your payment.",
        'time': '15 min ago',
        'sub':
            'Your full payment for Order #RNT-1024 has been completed successfully. Your full payment for Order #RNT-1024 has been completed successfully.',
      },
    ];
    return Column(
      children: List.generate(
       notification.length,
        (index) => Obx(() {
          final isSelected =
              notificationController.selectedIndex.value == index;
          return GestureDetector(
            onTap: () {
              notificationController.selectedIndex.value = index;
            },
            child: Container(
              margin: EdgeInsets.only(bottom: index == 2 ? 0 : 12.h),
              padding: EdgeInsets.all(1.r),
              decoration: BoxDecoration(
                gradient: isSelected
                    ? LinearGradient(
                        begin: AlignmentGeometry.centerLeft,
                        end: AlignmentGeometry.centerRight,
                        colors: [Color(0xFFBBA0EB), Color(0xFFAE45FA)],
                      )
                    : null,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: SharedContainer(
                padding: EdgeInsets.all(16.r),
                radius: 16.r,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 8),
                    color: AppColors.shadowColor.withValues(alpha: 0.1),
                    blurRadius: 30,
                  ),
                ],
                child: NotificationListInfo(index: index, notification: notification,),
              ),
            ),
          );
        }),
      ),
    );
  }
}
