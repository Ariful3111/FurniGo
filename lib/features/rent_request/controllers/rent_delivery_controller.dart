import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_request_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_step_controller.dart';

class RentDeliveryController extends GetxController {
  TextEditingController deliveryAddressController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController deliveryDateController = TextEditingController();
  TextEditingController otherDateController = TextEditingController();
  TextEditingController numberDateController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  RxBool isChecked = false.obs;
  RxBool isSetup = false.obs;
RxList<int> timeIndex = <int>[0].obs;
  List<String> timePeriod = [
    'Between 8 a.m. - 12 p.m.',
    'Between 12 p.m. - 5 p.m.',
    'After 5 p.m.',
    'other',
  ];
  RxInt selectedTimePeriod = 0.obs;
  RxInt isLoading = 0.obs;
  RxInt isLift = 0.obs;
  RxInt isRestriction = 0.obs;
  List access = [
    {
      'Option': ['Yes', 'No'],
      'title': 'Loading Dock Available? *',
      'selectedOption': 0.obs,
    },
    {
      'Option': ['Yes', 'No'],
      'title': 'Lift Access Available? *',
      'selectedOption': 0.obs,
    },
    {
      'Option': ['Yes', 'No'],
      'title': 'Working hours restrictions',
      'selectedOption': 0.obs,
    },
  ];

  RentRequestController controller = Get.find();
  Future<void> submitRentRequestSeven() async {
    controller.rentController.animateTo(
      duration: Duration(milliseconds: 300),
      curve: Curves.linear,
      controller.rentController.position.minScrollExtent,
    );
    Get.find<RentStepController>().currentIndex.value++;

  }

  @override
  void dispose() {
    deliveryAddressController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    zipController.dispose();
    deliveryDateController.dispose();
    otherDateController.dispose();
    numberDateController.dispose();
    super.dispose();
  }
}
