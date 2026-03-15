import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/home/controller/home_controller.dart';
import 'package:zb_dezign/shared/widgets/shared_container.dart';

class HomeProductPlacementButton extends GetWidget<HomeController> {
  const HomeProductPlacementButton({super.key});

  @override
  Widget build(BuildContext context) {
    List icon = [
      IconsPath.scan,
      IconsPath.swap,
      IconsPath.add,
      IconsPath.change,
      IconsPath.delete,
    ];
    List<Color> color = [
      Color(0xFF823200),
      Color(0xFFB76A41),
      Color(0xFF142428),
      Color(0xFFD3CFC6),
    ];
    return Row(
      children: [
        Column(
          children: List.generate(color.length, (index) {
            return Obx(() {
              final selected = controller.colorIndex.value == index;
              return InkWell(
                onTap: () {
                  controller.colorIndex.value = index;
                },
                child: Container(
                  height: 13.08.h,
                  width: 13.08.w,
                  decoration: BoxDecoration(
                    border: selected
                        ? Border.all(width: 0.44.r, color: AppColors.darkColor)
                        : null,
                    borderRadius: BorderRadius.circular(17.44.r),
                  ),
                  child: Center(
                    child: Container(
                      height: 8.72.h,
                      width: 8.72.w,
                      decoration: BoxDecoration(
                        color: color[index],
                        borderRadius: BorderRadius.circular(17.44.r),
                      ),
                    ),
                  ),
                ),
              );
            });
          }),
        ),
        SizedBox(width: 7.w),
        SharedContainer(
          color: AppColors.whiteColor,
          width: 30.w,
          padding: EdgeInsets.all(3.50.r),
          radius: 20.r,
          border: Border.all(width: 0.44.r, color: Color(0xFFB6B0C2)),
          child: Column(
            children: List.generate(icon.length, (index) {
              return Container(
                margin: EdgeInsets.only(
                  bottom: icon.length - 1 == index ? 0 : 10.46.h,
                ),
                width: 22.23.w,
                height: 22.23.h,
                decoration: BoxDecoration(
                  color: index == 2
                      ? AppColors.primaryColor
                      : index == 3
                      ? Color(0xFFECB900)
                      : AppColors.boxColor,
                  border: Border.all(
                    width: 0.44.r,
                    color: AppColors.whiteColor,
                  ),
                  borderRadius: BorderRadius.circular(17.44.r),
                ),
                child: Center(
                  child: Image.asset(
                    icon[index],
                    height: 10.46.h,
                    width: 10.16.w,
                    color: index == 2 || index == 3
                        ? AppColors.whiteColor
                        : icon.length - 1 == index
                        ? AppColors.darkColor
                        : null,
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
