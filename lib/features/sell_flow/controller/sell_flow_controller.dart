import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/sell_flow/controller/sell_flow_photos_controller.dart';
import 'package:zb_dezign/features/sell_flow/views/sell_flow_delivery_detail.dart';
import 'package:zb_dezign/features/sell_flow/views/sell_flow_photos.dart';
import 'package:zb_dezign/features/sell_flow/views/sell_flow_review.dart';
import 'package:zb_dezign/features/sell_flow/widgets/sell_flow_view_widgets/sell_flow_view_details.dart';

class SellFlowController extends GetxController {
  RxInt currentIndex = 0.obs;
  ScrollController sellFlowController = ScrollController();
  RxList<ItemFormModel> items = <ItemFormModel>[ItemFormModel()].obs;
  List sellFlowTitle = ['Item details', 'Proof of Purchase','Delivery Detail','Review & Submit'];

  @override
  void onInit() {
    super.onInit();
    Get.put(SellFlowPhotosController());
  }

  late final List<Widget> sellWidgets = [
    SellFlowViewDetails(),
    SellFlowPhotos(),
    SellFlowDeliveryDetail(),
    SellFlowReview(),
  ];
  void addItem() {
    items.add(ItemFormModel());
  }
}

class ItemFormModel {
  TextEditingController brandController = TextEditingController();
  TextEditingController dimensionController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController conditionController = TextEditingController();
  RxString category = "".obs;
}
