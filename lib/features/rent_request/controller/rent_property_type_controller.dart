import 'package:get/get.dart';

class RentPropertyTypeController extends GetxController{
  RxString selectedPropertyType = ''.obs;
  RxString selectedPropertyUse = ''.obs;
  List<String> properType = [
    'Residential',
    'Commercial',
  ];
  List<String> properUse = [
    'Office',
    'Showroom',
    'Warehouse',
    'Retail',
  ];
}