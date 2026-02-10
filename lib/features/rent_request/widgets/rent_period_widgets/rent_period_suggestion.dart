import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/controller/rent_period_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_period_widgets/rent_period_suggestion_decoration.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_period_widgets/rent_period_suggestion_field.dart';
import 'package:zb_dezign/shared/widgets/custom_form_field/custom_text_form_field.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class RentPeriodSuggestion extends StatelessWidget {
  const RentPeriodSuggestion({super.key});
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    RentPeriodController rentPeriodController = Get.find();
    return TypeAheadField<Map<String, String>>(
      hideOnUnfocus: true,
      focusNode: rentPeriodController.rentDurationFocusNode,
      itemBuilder: (BuildContext context, Map<String, String> suggestion) {
        return Obx(() {
          final selected =
              suggestion['title'] ==
              rentPeriodController.selectedRentPeriodTitle.value;
          final discount = suggestion['subTitle'] == 'Minimum Duration';
          return suggestion['title'] == 'custom'
              ? RentPeriodSuggestionField(selected: selected)
              : Container(
                  margin: EdgeInsets.only(
                    bottom: suggestion.length - 1 == 5 ? 0.h : 12.h,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                  decoration: BoxDecoration(
                    color: selected ? Color(0xFFF4F6F8) : null,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomPrimaryText(
                        text: suggestion['title'] ?? '',
                        fontSize: 16.sp,
                        color: isDark
                            ? AppColors.labelColor
                            : AppColors.labelColor,
                      ),
                      if (suggestion['title'] == '12 Month')
                        Container(
                          padding: EdgeInsets.all(6.r),
                          decoration: BoxDecoration(
                            color: Color(0xFFE7F3F4),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: CustomPrimaryText(
                            text: 'Best Value',
                            fontSize: 12.sp,
                            color: Color(0xFF179471),
                          ),
                        ),
                      CustomPrimaryText(
                        text: suggestion['subTitle'] ?? '',
                        fontSize: 16.sp,
                        color: isDark
                            ? AppColors.labelColor
                            : discount
                            ? AppColors.labelColor
                            : Color(0xFF21D19F),
                        fontWeight: discount ? null : FontWeight.w600,
                      ),
                    ],
                  ),
                );
        });
      },
      onSelected: (value) {
        final String title = (value['title'] ?? '');
        rentPeriodController.searchController.text = title;
      },
      controller: rentPeriodController.searchController,
      suggestionsCallback: (String search) {
        return rentPeriodController.rentPeriodList.where((e) {
          return e['title']?.toLowerCase().contains(search.toLowerCase()) ??
              false;
        }).toList();
      },
      builder: (context, controller, focusNode) {
        focusNode.addListener(() {
          rentPeriodController.isSearchFocus.value = focusNode.hasFocus;
        });
        return CustomTextFormField(
          controller: controller,
          focusNode: focusNode,
          labelText: 'Rent Duration',
        );
      },
      decorationBuilder: (context, child) {
        return Obx(
          () => RentPeriodSuggestionDecoration(
            isFocus: rentPeriodController.isSearchFocus.value,
            child: child,
          ),
        );
      },
    );
  }
}
