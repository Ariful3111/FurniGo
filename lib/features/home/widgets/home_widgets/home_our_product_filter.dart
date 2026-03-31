import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/home/controller/get_product_types_controller.dart';
import 'package:zb_dezign/features/home/controller/get_products_by_type_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_loadings/button_loading.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class HomeOurProductFilter extends GetWidget<GetProductTypesController> {
  const HomeOurProductFilter({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return controller.isLoading.value
          ? ButtonLoading()
          : SizedBox(
              height: 45.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller.productTypes.value?.data.length ?? 0,
                itemBuilder: (context, index) {
                  return Obx(() {
                    bool selected =
                        controller.selectedProductType.value ==
                        controller.productTypes.value?.data[index].id;
                    return GestureDetector(
                      onTap: () async {
                        controller.selectedProductType.value =
                            controller.productTypes.value?.data[index].id
                                .toInt() ??
                            0;

                        await Get.find<GetProductsByTypeController>()
                            .getProductsByType(
                              typeID: controller.selectedProductType.value,
                            );
                      },
                      child: AnimatedSize(
                        duration: Duration(milliseconds: 300),
                        child: selected
                            ? Container(
                                margin: EdgeInsets.only(right: 8),
                                height: 44.h,
                                padding: EdgeInsets.only(
                                  bottom: 2.h,
                                  top: 2.h,
                                  left: 2.5.w,
                                  right: 8.5.w,
                                ),
                                decoration: BoxDecoration(
                                  gradient: isDark
                                      ? AppColors.darkPrimaryGradient
                                      : AppColors.primaryGradient,
                                  borderRadius: BorderRadius.circular(32.r),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 4),
                                      blurRadius: 25,
                                      color: Color(
                                        0xFF8C63DD,
                                      ).withValues(alpha: 0.25),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    item(isDark: isDark, isSelected: selected),
                                    SizedBox(width: 4.w),
                                    CustomPrimaryText(
                                      text:
                                          controller
                                              .productTypes
                                              .value
                                              ?.data[index]
                                              .name ??
                                          '',
                                      fontSize: 14.sp,
                                      color: AppColors.whiteColor,
                                      textOverflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: item(
                                  isDark: isDark,
                                  isSelected: selected,
                                ),
                              ),
                      ),
                    );
                  });
                },
              ),
            );
    });
  }

  Widget item({required bool isDark, required bool isSelected}) {
    return Container(
      height: 44.h,
      width: 44.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.r),
        color: isDark ? AppColors.darkColor : AppColors.fieldColor,
        border: Border.all(
          width: 1.r,
          color: isDark
              ? isSelected
                    ? AppColors.boxColor
                    : Color(0xFF62547B)
              : isSelected
              ? AppColors.whiteColor
              : AppColors.boxColor,
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 25,
            color: AppColors.darkColor.withValues(alpha: 0.05),
          ),
        ],
      ),
      child: Center(
        child: Image.asset(IconsPath.furniture, height: 32.h, width: 32.w),
      ),
    );
  }
}
