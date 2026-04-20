import 'package:get/get.dart';
import 'package:zb_dezign/features/cart/controller/add_to_cart_controller.dart';
import 'package:zb_dezign/features/cart/repositories/add_to_cart_repo.dart';
import 'package:zb_dezign/features/product_details.dart/controller/product_details_controller.dart';
import 'package:zb_dezign/features/product_details.dart/controller/products_attributes_controller.dart';
import 'package:zb_dezign/features/product_details.dart/controller/related_products_controller.dart';
import 'package:zb_dezign/features/product_details.dart/repositories/product_details_repo.dart';
import 'package:zb_dezign/features/product_details.dart/repositories/product_attributes_repo.dart';
import 'package:zb_dezign/features/product_details.dart/repositories/related_products_repo.dart';

class ProductDetailsBindings implements Bindings {
  @override
  void dependencies() {
    // Product Details
    Get.lazyPut(() => ProductDetailsRepository(getNetwork: Get.find()));
    Get.lazyPut(
      () => ProductDetailsController(productDetailsRepository: Get.find()),
    );

    // Product Attributes
    Get.lazyPut(() => ProductAttributesRepository(getNetwork: Get.find()));
    Get.lazyPut(
      () =>
          ProductAttributesController(productAttributesRepository: Get.find()),
    );

    // Related Products
    Get.lazyPut(() => RelatedProductsRepository(getNetwork: Get.find()));
    Get.lazyPut(
      () => RelatedProductsController(relatedProductsRepository: Get.find()),
    );

    // Add to Cart Products
    Get.lazyPut(() => AddToCartRepository(postWithoutResponse: Get.find()));
    Get.lazyPut(() => AddToCartController(addToCartRepository: Get.find()));
  }
}
