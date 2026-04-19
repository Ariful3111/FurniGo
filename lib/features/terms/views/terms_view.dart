import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/terms/controller/terms_controller.dart';
import 'package:zb_dezign/features/terms/widgets/terms_description.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_dropdown/custom_dropdown_menu.dart';
import 'package:zb_dezign/shared/widgets/flow_widgets/flow_header.dart';

class TermsView extends GetView<TermsController> {
  const TermsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: ListView(
        children: [
          CustomAppbar(
            title: 'Terms & Condition',
            onDrawerTap: () {
              Navigator.pop(context);
            },
            icon: IconsPath.back,
          ),
          SizedBox(height: 32.h),
          FlowHeader(
            title: 'Terms & Condition',
            sub: 'Review the terms and conditions before proceeding',
          ),
          SizedBox(height: 24.h),
          CustomDropdownMenu(
            borderColor: Colors.transparent,
            onSelect: (value) {
              controller.selectedOption.value = value!;
            },
            option: controller.option,
            isSelect: controller.selectedOption,
            label: '',
           fontSize: 20.sp,
           contentPadding: EdgeInsets.symmetric(vertical: 24.h,horizontal: 20.w),
          ),
          SizedBox(height: 12.h),
          TermsDescription(),
        ],
      ),
    );
  }
}
