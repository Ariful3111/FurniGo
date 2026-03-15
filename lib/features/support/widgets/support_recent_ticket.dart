import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/support/controller/support_controller.dart';
import 'package:zb_dezign/features/support/widgets/support_recent_tickets_items.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class SupportRecentTicket extends StatelessWidget {
  const SupportRecentTicket({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    SupportController supportController = Get.find();
    return SharedContainer(
      padding: EdgeInsets.all(20.w),
      radius: 20.r,
      color: isDark ? AppColors.darkColor : AppColors.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPrimaryText(
            text: "Recent Tickets",
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: isDark ? AppColors.whiteColor : AppColors.titleColor,
          ),
          SizedBox(height: 20.h),
          Column(
            children: List.generate(supportController.tickets.length, (index) {
              final ticket = supportController.tickets[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: SupportRecentTicketsItems(ticket: ticket),
              );
            }),
          ),
        ],
      ),
    );
  }
}
