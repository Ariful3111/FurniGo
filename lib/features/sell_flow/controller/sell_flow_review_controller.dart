import 'package:get/get.dart';

class SellFlowReviewController extends GetxController{
  RxBool isConfirmed = false.obs;

  List<Map<String, String>> itemSummary = [
    {"title": "Category", "value": "Not specified"},
    {"title": "Brand", "value": "Not specified"},
    {"title": "Dimensions", "value": "Not specified"},
    {"title": "Age", "value": "Not specified"},
    {"title": "Condition", "value": "Not specified"},
    {"title": "Photos", "value": "6/6 uploaded"},
    {"title": "Proof of purchase", "value": "None"},
  ];
}