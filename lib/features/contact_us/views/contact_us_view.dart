import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/contact_us/widgets/contact_arrow_button.dart';
import 'package:zb_dezign/features/contact_us/widgets/contact_faq.dart';
import 'package:zb_dezign/features/contact_us/widgets/contact_field.dart';
import 'package:zb_dezign/features/contact_us/widgets/contact_header.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/flow_widgets/flow_header.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      child: ListView(
        children: [
          CustomAppbar(
            title: 'Contact Us',
            onDrawerTap: () {
              Navigator.pop(context);
            },
            icon: IconsPath.back,
          ),
          SizedBox(height: 32.h),
          FlowHeader(
            title: 'Contact Us',
            sub: 'We\'re here to help—get in touch anytime.',
          ),
          SizedBox(height: 24.h),
          SharedContainer(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
            color: isDark ? AppColors.darkColor : AppColors.whiteColor,
            child: Column(
              children: [
                ContactHeader(),
                SizedBox(height: 28.h),
                ContactField(),
                SizedBox(height: 32.h),
                ContactFaq(),
                SizedBox(height: 20.h),
                ContactArrowButton(
                  text: 'Contact Support',
                  onTap: () {},
                  bgColor: Colors.transparent,
                  border: Border.all(
                    color: isDark
                        ? AppColors.darkBorderColor
                        : AppColors.whiteBorderColor,
                  ),
                  textColor: isDark
                      ? AppColors.whiteColor
                      : AppColors.primaryColor,
                  iconColor: isDark
                      ? AppColors.whiteColor
                      : AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
