import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

class RentRequestController extends GetxController {
  TextEditingController businessNameController = TextEditingController();
  TextEditingController personNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController abnController = TextEditingController();
  TextEditingController businessSiteController = TextEditingController();
  ScrollController rentController = ScrollController();
  RxInt currentIndex = 0.obs;
  final formKey = GlobalKey<FormState>();
  late final List<Widget> rentWidgets = [
    RentRequestViewForm(formKey: formKey),
    RentPropertyTypeView(),
    RentPropertyDetailsView(formKey: formKey),
    RentFloorPlanView(),
    RentFurniture(),
    RentAppliance(),
    RentBrand(),
    RentPeriod(),
    RentDelivery(),
    RentReview(),
  ];
  @override
  void dispose() {
    businessNameController.dispose();
    personNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    abnController.dispose();
    businessSiteController.dispose();
    super.dispose();
  }
}
