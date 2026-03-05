import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/features/profile/widgets/profile_view_widgets/profile_view_info.dart';
import 'package:zb_dezign/features/profile/widgets/profile_view_widgets/profile_view_items.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_primary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_drawer/custom_drawer.dart';

class ProfileViews extends StatelessWidget {
  const ProfileViews({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: ListView(
        children: [
          CustomAppbar(
            title: 'My Profile',
            onDrawerTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CustomDrawer();
                },
              );
            },
          ),
          SizedBox(height: 20.h,),
          ProfileViewInfo(),
          SizedBox(height: 20.h,),
          ProfileViewItems(),
          SizedBox(height: 20.h,),
          CustomPrimaryButton(text: 'Logout', onPressed: () {
            
          },
          height: 52.h,
          fontSize: 16.sp,
          borderRadius: BorderRadius.circular(12.r),
          )
        ],
      ),
    );
  }
}
