import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_request_controller.dart';
import 'package:zb_dezign/features/rent_request/views/rent_appliance.dart';
import 'package:zb_dezign/features/rent_request/views/rent_brand.dart';
import 'package:zb_dezign/features/rent_request/views/rent_delivery.dart';
import 'package:zb_dezign/features/rent_request/views/rent_floor_plan_view.dart';
import 'package:zb_dezign/features/rent_request/views/rent_furniture.dart';
import 'package:zb_dezign/features/rent_request/views/rent_period.dart';
import 'package:zb_dezign/features/rent_request/views/rent_property_details_view.dart';
import 'package:zb_dezign/features/rent_request/views/rent_property_type_view.dart';
import 'package:zb_dezign/features/rent_request/views/rent_review.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_request_view_widgets/rent_request_view_form.dart';

class RentStepController extends GetxController {
  static RentStepController get instance => Get.find();

  // Step management
  RxInt currentIndex = 0.obs;
  int get totalSteps => rentWidgets.length;
  RxBool isLoading = false.obs;
  // Widgets
  late final List<Widget> rentWidgets = [
    RentRequestViewForm(formKey: Get.find<RentRequestController>().formKey),
    RentPropertyTypeView(),
    RentPropertyDetailsView(formKey: GlobalKey()),
    RentFloorPlanView(),
    RentFurniture(),
    RentAppliance(),
    RentBrand(),
    RentPeriod(),
    RentDelivery(),
    RentReview(),
  ];

  Widget getCurrentWidget() {
    return rentWidgets[currentIndex.value];
  }

  // Handle next step with validation
  Future<void> handleNextStep() async {
    debugPrint('⏭️ Step ${currentIndex.value}: Attempting to navigate forward');
    isLoading.value = true;

    switch (currentIndex.value) {
      case 0:
        await Get.find<RentRequestController>().submitRentRequest();
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        break;
      case 6:
        break;
      case 7:
        break;
      case 8:
        break;
      case 9:
        _handleFinalStep();
        break;
      default:
        _handleFinalStep();
        break;
    }
    isLoading.value = false;
  }

  // Final step
  void _handleFinalStep() {
    debugPrint(
      '🏁 Step ${currentIndex.value}: Final step reached - Ready for submission',
    );
  }

  // Navigate to previous step
  void goToPreviousStep() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
      debugPrint('⏮️ Moved back to Step ${currentIndex.value}');
    }
  }

  // Reset flow
  void resetFlow() {
    currentIndex.value = 0;
    debugPrint('🔄 Flow reset to Step 0');
  }
}
