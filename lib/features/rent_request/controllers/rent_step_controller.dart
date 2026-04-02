import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_additional_note_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_appliance_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_delivery_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_floor_plan_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_furniture_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_period_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_property_details_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_property_type_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_request_controller.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_appliance_widgets/rent_appliance.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_brand_widgets/rent_brand.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_delivery_widgets/rent_delivery.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_floor_plan_widgets/rent_floor_plan_view.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_furniture_widgets/rent_furniture.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_period_widgets/rent_period.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_property_widgets/rent_property_details_view.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_property_type_view.dart';
import 'package:zb_dezign/features/rent_request/widgets/rent_review_widgets/rent_review.dart';
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
    RentPropertyDetailsView(),
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
        await Get.find<RentRequestController>().submitRentRequestZero();
        break;
      case 1:
        await Get.find<RentPropertyTypeController>().submitRentRequestOne();
        break;
      case 2:
        await Get.find<RentPropertyDetailsController>().submitRentRequestTwo();
        break;
      case 3:
        await Get.find<RentFloorPlanController>().submitRentRequestThree();
        break;
      case 4:
        await Get.find<RentFurnitureController>().submitRentRequestFour();
        break;
      case 5:
        await Get.find<RentApplianceController>().submitRentRequestFive();
        break;
      case 6:
        await Get.find<RentAdditionalNoteController>().submitRentRequestSix();
        break;
      case 7:
        await Get.find<RentPeriodController>().submitRentRequestSix();
        break;
      case 8:
        await Get.find<RentDeliveryController>().submitRentRequestSeven();
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
    Get.find<RentRequestController>().rentController.position.minScrollExtent;
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
