import 'package:get/get.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_additional_note_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_appliance_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_brand_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_request_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_delivery_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_floor_plan_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_furniture_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_period_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_property_details_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_property_type_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_review_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_step_controller.dart';
import 'package:zb_dezign/features/rent_request/repositories/step_one_repo.dart';
import 'package:zb_dezign/features/rent_request/repositories/step_zero_repo.dart';

class RentBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StepZeroRepository(postWithResponse: Get.find()));
    Get.lazyPut(() => StepOneRepository(postWithoutResponse: Get.find()));
    Get.lazyPut(() => RentRequestController(stepZeroRepository: Get.find()));
    Get.lazyPut(
      () => RentPropertyTypeController(stepOneRepository: Get.find()),
    );
    Get.lazyPut(() => RentStepController());
    Get.lazyPut(() => RentPropertyDetailsController());
    Get.lazyPut(() => RentFloorPlanController());
    Get.lazyPut(() => RentFurnitureController());
    Get.lazyPut(() => RentApplianceController());
    Get.lazyPut(() => RentBrandController());
    Get.lazyPut(() => RentPeriodController());
    Get.lazyPut(() => RentDeliveryController());
    Get.lazyPut(() => RentReviewController());
    Get.lazyPut(() => RentAdditionalNoteController());
  }
}
