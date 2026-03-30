import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_property_type_controller.dart';
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
import 'package:zb_dezign/shared/widgets/snackbars/error_snackbar.dart';

class RentStepController extends GetxController {
  static RentStepController get instance => Get.find();

  // Step management
  final currentIndex = 0.obs;
  late final int totalSteps;

  // Controllers
  final _propertyTypeController = Get.find<RentPropertyTypeController>();

  // Widgets
  late final List<Widget> rentWidgets;
  late final GlobalKey<FormState> _formKey;

  @override
  void onInit() {
    super.onInit();
    _initializeWidgets();
    debugPrint('🚀 RentStepController initialized with $totalSteps steps');
  }

  void _initializeWidgets() {
    _formKey = GlobalKey<FormState>();
    rentWidgets = [
      RentRequestViewForm(formKey: _formKey),
      RentPropertyTypeView(),
      RentPropertyDetailsView(formKey: _formKey),
      RentFloorPlanView(),
      RentFurniture(),
      RentAppliance(),
      RentBrand(),
      RentPeriod(),
      RentDelivery(),
      RentReview(),
    ];
    totalSteps = rentWidgets.length;
    debugPrint('📦 Total steps: $totalSteps (derived from rentWidgets)');
  }

  // Get current widget
  Widget getCurrentWidget() {
    return rentWidgets[currentIndex.value];
  }

  // Handle next step with validation
  void handleNextStep() {
    debugPrint('⏭️ Step ${currentIndex.value}: Attempting to navigate forward');

    switch (currentIndex.value) {
      case 0:
        _validateStep0();
        break;
      case 1:
        _validateStep1();
        break;
      case 2:
        _validateStep2();
        break;
      case 3:
        _navigateNext('Floor Plan');
        break;
      case 4:
        _navigateNext('Furniture');
        break;
      case 5:
        _navigateNext('Appliance');
        break;
      case 6:
        _navigateNext('Brand');
        break;
      case 7:
        _navigateNext('Period');
        break;
      case 8:
        _navigateNext('Delivery');
        break;
      case 9:
        _handleFinalStep();
        break;
      default:
        _handleFinalStep();
        break;
    }
  }

  // Step 0: Business Info Form
  void _validateStep0() {
    if (_formKey.currentState!.validate()) {
      debugPrint('✅ Step 0: Business Info validated successfully');
      _navigateNext('Business Info');
    } else {
      debugPrint('❌ Step 0: Business Info validation failed');
    }
  }

  // Step 1: Property Type Selection
  void _validateStep1() {
    if (_propertyTypeController.selectedPropertyType.value.isEmpty) {
      ErrorSnackbar.show(description: 'Please select Property Type');
      debugPrint('❌ Step 1: Property Type not selected');
      return;
    }

    if (_propertyTypeController.selectedPropertyUse.value.isEmpty) {
      ErrorSnackbar.show(description: 'Please select Property Use');
      debugPrint('❌ Step 1: Property Use not selected');
      return;
    }

    debugPrint('✅ Step 1: Property Type validated successfully');
    _navigateNext('Property Type');
  }

  // Step 2: Property Details Form
  void _validateStep2() {
    if (_formKey.currentState!.validate()) {
      debugPrint('✅ Step 2: Property Details validated successfully');
      _navigateNext('Property Details');
    } else {
      debugPrint('❌ Step 2: Property Details validation failed');
    }
  }

  // Navigate to next step
  void _navigateNext(String stepName) {
    currentIndex.value++;
    debugPrint('📍 Moved to Step ${currentIndex.value}: $stepName');
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
