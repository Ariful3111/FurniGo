import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/rent_request/widgets/other_field.dart';
import 'package:zb_dezign/shared/widgets/custom_check_box.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class PropertyDetailsContainer extends StatelessWidget {
  final bool isChecked;
  final ValueChanged onChange;
  final String title;
  final String ?subTitle;
  final VoidCallback onAdd;
  final VoidCallback onRemoved;
  final String count;
  final bool isOther;
  final bool readOnly;
  final TextEditingController otherController;
  const PropertyDetailsContainer({
    super.key,
    required this.isChecked,
    required this.onChange,
    required this.title,
    required this.onAdd,
    required this.onRemoved,
    required this.count, required this.isOther, required this.otherController, required this.readOnly, this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      width: MediaQuery.widthOf(context),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(width: 1.r, color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 12,
            color: AppColors.shadowColor.withValues(alpha: 0.08),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomCheckBox(
                isChecked: isChecked,
                onChange: onChange,
                color: Color(0xFF00C0E8),
              ),
             isOther?Expanded(child: OtherField(controller: otherController, readOnly: readOnly?false:true,)) :CustomPrimaryText(
                text: title,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.darkColor,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 32.w),
              CustomPrimaryText(
                text:subTitle?? 'Count',
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.darkColor,
              ),
              Spacer(),
              button(
                child: InkWell(
                  onTap:isChecked? onRemoved:(){},
                  child: Icon(
                    Icons.remove,
                    size: 12.r,
                    color:isChecked? AppColors.darkColor:Color(0xFFC0C0C0),
                  ),
                ),
              ),
              SizedBox(width: 1.63.w),
              button(
                child: CustomPrimaryText(
                  text: count,
                  fontSize: 10.sp,
                  color:isChecked? AppColors.buttonTextColor:Color(0xFFC0C0C0),
                ),
              ),
              SizedBox(width: 1.63.w),
              button(
                child: InkWell(
                  onTap:isChecked? onAdd:(){},
                  child: Icon(
                    Icons.add,
                    size: 12.r,
                    color:isChecked? AppColors.darkColor:Color(0xFFC0C0C0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget button({required Widget child}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.75.h, horizontal: 9.8.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(3.5.r),
        border: Border.all(width: 0.44.r, color: AppColors.fieldBorderColor),
      ),
      child: child,
    );
  }
}
