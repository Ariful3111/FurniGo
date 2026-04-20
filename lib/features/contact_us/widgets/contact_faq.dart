import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/contact_us/controller/contact_us_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class ContactFaq extends GetWidget<ContactUsController> {
  const ContactFaq({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    final List<Map<String, String>> faqList = [
      {
        "title": "How does furniture rental work?",
        "subtitle":
            "Choose your furniture, select a rental plan, enjoy delivery, and return anytime.",
      },
      {
        "title": "What if furniture gets damaged?",
        "subtitle":
            "We provide support and protection plans for damages during rental.",
      },
      {
        "title": "Can I buy rented furniture?",
        "subtitle": "Yes, you can purchase anytime during or after rental.",
      },
      {
        "title": "Is AI design tool free?",
        "subtitle":
            "Yes, basic features are free with optional premium upgrades.",
      },
    ];

    return Column(
      children: [
        Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
              decoration: BoxDecoration(
                color:isDark? AppColors.labelColor:AppColors.borderColor,
                borderRadius: BorderRadius.circular(60.r),
              ),
              child: CustomPrimaryText(
                text: "FAQ",
                fontSize: 12.sp,
                color: isDark ? AppColors.whiteColor : AppColors.titleColor,
              ),
            ),
            SizedBox(height: 20.h),
            CustomPrimaryText(
              text: "You Have Questions? We Got Answers",
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 8.h),
            CustomPrimaryText(
              text: "If you can't find what you need, contact support.",
              textAlign: TextAlign.center,
              color: isDark ? AppColors.primaryBorderColor : Color(0xFF938AA5),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Obx(() {
          return Column(
            children: List.generate(faqList.length, (index) {
              final item = faqList[index];
              final isOpen = controller.openedIndexes.contains(index);
              return Container(
                margin: EdgeInsets.only(
                  bottom: faqList.length - 1 == index ? 0 : 12.h,
                ),
                padding: EdgeInsets.all(16.r),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.labelColor : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: isDark
                        ? AppColors.darkBorderColor
                        : AppColors.primaryBorderColor,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// TITLE ROW
                    Row(
                      children: [
                        Expanded(
                          child: CustomPrimaryText(
                            text: item["title"]!,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        InkWell(
                          onTap: () => controller.toggle(index),
                          child: AnimatedRotation(
                            turns: isOpen ? 0.5 : 0,
                            duration: Duration(milliseconds: 300),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: isDark
                                  ? AppColors.whiteColor
                                  : Color(0xFF717182),
                            ),
                          ),
                        ),
                      ],
                    ),

                    AnimatedCrossFade(
                      duration: Duration(milliseconds: 300),
                      crossFadeState: isOpen
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      firstChild: const SizedBox(),
                      secondChild: Padding(
                        padding: EdgeInsets.only(top: 12.h),
                        child: CustomPrimaryText(
                          text: item["subtitle"]!,
                          color: isDark
                              ? AppColors.primaryBorderColor
                              : Color(0xFF938AA5),
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          );
        }),
      ],
    );
  }
}
