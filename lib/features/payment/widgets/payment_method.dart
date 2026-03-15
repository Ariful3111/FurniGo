import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/shared/widgets/custom_button/custom_secondary_button.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class PaymentMethod extends StatelessWidget {
  PaymentMethod({super.key});

  final List<Map<String, dynamic>> cards = [
    {
      "type": "Visa",
      "icon": IconsPath.visa,
      "number": "•••• 4242",
      "expiry": "12/25",
      "isDefault": true,
    },
    {
      "type": "Mastercard",
      "icon": IconsPath.masterCard,
      "number": "•••• 4242",
      "expiry": "12/25",
      "isDefault": false,
    },
    {
      "type": "Mastercard",
      "icon": IconsPath.masterCard,
      "number": "•••• 4242",
      "expiry": "12/25",
      "isDefault": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SharedContainer(
      padding: EdgeInsets.all(16.w),
      radius: 24.r,
      color: isDark ? AppColors.darkColor : AppColors.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    IconsPath.drawerPayment,
                    height: 24.h,
                    width: 24.w,
                    color: isDark ? AppColors.whiteColor : AppColors.titleColor,
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomPrimaryText(
                        text: "Payment methods",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.titleColor,
                      ),
                      SizedBox(height: 4.h),
                      CustomPrimaryText(
                        text: "Manage cards and EFT details",
                        fontSize: 14.sp,
                        color: AppColors.secondaryTextColor,
                      ),
                    ],
                  )
                ],
              ),

              /// Add Card Button
              CustomSecondaryButton(
                text: "Add Card",
                icon: IconsPath.add,
                onPressed: () {},
                iconColor: AppColors.labelColor,
              ),
            ],
          ),
          SizedBox(height: 20.h),

          CustomPrimaryText(
            text: "Cards",
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: isDark ? AppColors.whiteColor : AppColors.titleColor,
          ),

          SizedBox(height: 16.h),

          /// Card List
          Column(
            children: List.generate(cards.length, (index) {
              final card = cards[index];

              return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: _cardItem(context, card),
              );
            }),
          )
        ],
      ),
    );
  }

  Widget _cardItem(BuildContext context, Map<String, dynamic> card) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return SharedContainer(
      padding: EdgeInsets.all(12.w),
      radius: 16.r,
      border: Border.all(color: AppColors.buttonBorderColor),
      color: isDark ? AppColors.darkColor : AppColors.whiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          /// Card Info
          Row(
            children: [
              Image.asset(
                card["icon"],
                height: 30.h,
                width: 48.w,
                fit: BoxFit.contain,
              ),

              SizedBox(width: 16.w),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomPrimaryText(
                        text: "${card["type"]} ${card["number"]}",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: isDark
                            ? AppColors.whiteColor
                            : AppColors.titleColor,
                      ),

                      SizedBox(width: 10.w),

                      if (card["isDefault"])
                        SharedContainer(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 6.h),
                          radius: 100.r,
                          border: Border.all(
                            color: AppColors.buttonBorderColor,
                          ),
                          child: CustomPrimaryText(
                            text: "Default",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: isDark
                                ? AppColors.whiteColor
                                : AppColors.titleColor,
                          ),
                        )
                    ],
                  ),

                  SizedBox(height: 4.h),

                  CustomPrimaryText(
                    text: "Expires ${card["expiry"]}",
                    fontSize: 14.sp,
                    color: AppColors.secondaryTextColor,
                  ),
                ],
              ),
            ],
          ),

          /// Right Action
          card["isDefault"]
              ? Image.asset(
                  IconsPath.delete,
                  height: 20.h,
                  width: 20.w,
                )
              : GestureDetector(
                  onTap: () {},
                  child: CustomPrimaryText(
                    text: "Set default",
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: isDark
                        ? AppColors.whiteColor
                        : AppColors.titleColor,
                  ),
                ),
        ],
      ),
    );
  }
}
