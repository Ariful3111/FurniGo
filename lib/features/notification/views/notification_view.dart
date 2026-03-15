import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/notification/widgets/notification_header.dart';
import 'package:zb_dezign/features/notification/widgets/notification_list.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(child: ListView(
      children: [
        NotificationHeader(),
        SizedBox(height: 5.h,),
        CustomPrimaryText(text: 'Today',color: isDark?AppColors.whiteColor:Color(0xFF091E42),),
        SizedBox(height: 12.h,),
        NotificationList(),
        SizedBox(height: 18.h,),
        CustomPrimaryText(text: 'This Week',color: isDark?AppColors.whiteColor:Color(0xFF091E42),),
        SizedBox(height: 12.h,),
        NotificationList(),

      ],
    ),);
  }
}