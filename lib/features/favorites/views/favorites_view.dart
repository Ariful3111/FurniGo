import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/favorites/controller/get_favourites_controller.dart';
import 'package:zb_dezign/features/favorites/widgets/favorites_header.dart';
import 'package:zb_dezign/features/favorites/widgets/favorites_items.dart';
import 'package:zb_dezign/features/favorites/widgets/favorites_select_item.dart';
import 'package:zb_dezign/shared/widgets/custom_appbar.dart';
import 'package:zb_dezign/shared/widgets/custom_container.dart';
import 'package:zb_dezign/shared/widgets/custom_loadings/button_loading.dart';

class FavoritesView extends GetView<GetFavouritesController> {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Obx(() {
      return CustomContainer(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDark
              ? [AppColors.darkColor, AppColors.darkColor]
              : [AppColors.whiteColor, AppColors.whiteColor],
        ),
        child: controller.isLoading.value
            ? ButtonLoading()
            : ListView(
                children: [
                  CustomAppbar(
                    title: 'Favorites',
                    onDrawerTap: () {
                      Navigator.pop(context);
                    },
                    icon: IconsPath.back,
                  ),
                  SizedBox(height: 20.h),
                  FavoritesHeader(),
                  SizedBox(height: 16.h),
                  FavoritesSelectItem(),
                  SizedBox(height: 20.h),
                  FavoritesItems(
                    favorites: controller.favourites.value?.data ?? [],
                  ),
                ],
              ),
      );
    });
  }
}
