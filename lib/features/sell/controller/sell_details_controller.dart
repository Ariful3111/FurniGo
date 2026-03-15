import 'package:get/get.dart';

class SellDetailsController extends GetxController {
  List status = [
    {'title': 'Submitted', 'status': true},
    {'title': 'In review', 'status': false},
    {'title': 'Offer ready', 'status': false},
  ];
  List summary = [
    {'title': 'Category', 'value': 'Not specified'},
    {'title': 'Brand', 'value': 'Not specified'},
    {'title': 'Dimensions', 'value': 'Not specified'},
    {'title': 'Age', 'value': 'Not specified'},
    {'title': 'Condition', 'value': '6/6 uploaded'},
  ];

  List<String> cardList = ['25144654564', '6546546464', '365465464456'];
  RxString selectedCard = ''.obs;
}
