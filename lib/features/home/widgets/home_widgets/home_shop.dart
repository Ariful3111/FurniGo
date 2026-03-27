import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/features/home/controller/get_rooms_controller.dart';
import 'package:zb_dezign/shared/widgets/custom_loadings/button_loading.dart';
import 'package:zb_dezign/shared/widgets/custom_text/custom_primary_text.dart';

class HomeShop extends GetWidget<GetRoomsController> {
  const HomeShop({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoading.value
          ? ButtonLoading()
          : SizedBox(
              height: 100.h,
              child: ListView.builder(
                itemCount: controller.rooms.value?.data?.length ?? 0,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.only(bottom: 12.h),
                    margin: EdgeInsets.only(right: 8.w),
                    height: 100.h,
                    width: 170.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          controller.rooms.value?.data?[index].imageUrl ?? '',
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomPrimaryText(
                        text: controller.rooms.value?.data?[index].name ?? '',
                        fontSize: 14.sp,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  );
                },
              ),
            );
    });
  }
}
