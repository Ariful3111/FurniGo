import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';
import 'package:zb_dezign/features/favorites/controller/toggle_favourite_controller.dart';
import 'package:zb_dezign/features/favorites/models/favourite_model.dart';
import 'package:zb_dezign/shared/widgets/custom_product_design.dart';
import 'package:zb_dezign/shared/widgets/custom_product_text.dart';

class FavoritesItems extends StatelessWidget {
  final List<FavoriteItem> favorites;
  const FavoritesItems({required this.favorites, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: favorites.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 12.h,
        mainAxisExtent: 260.h,
      ),
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomProductDesign(
              onFavorite: () async {
                await Get.find<ToggleFavouriteController>().toggleFavourite(
                  productID: favorites[index].product.id.toInt(),
                  changeIndex: 2,
                );
              },
              icon: IconsPath.favoriteFill,
              color: Color(0xFFFF383C),
              favoriteItem: favorites[index],
            ),
            SizedBox(height: 14.h),
            CustomProductText(
              color: AppColors.productColorList,
              title: favorites[index].product.name,
              price:
                  '\$${favorites[index].product.finalPrice.toDouble().toPrecision(2)}',
            ),
          ],
        );
      },
    );
  }
}
