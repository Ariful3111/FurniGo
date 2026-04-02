import 'package:get/get.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_additional_note_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_property_details_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_property_type_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_request_controller.dart';
import 'package:zb_dezign/features/rent_request/controllers/rent_furniture_controller.dart';

class RentReviewController extends GetxController {
  RentPropertyTypeController get rentPropertyTypeController => Get.find();
  RentPropertyDetailsController get rentPropertyDetailsController => Get.find();
  RentRequestController get rentRequestController => Get.find();
  RentAdditionalNoteController get rentAdditionalNoteController => Get.find();

  List<Map<String, dynamic>> get propertyType => [
    {
      'title': 'Business Name',
      'value': rentRequestController.businessNameController.text,
    },
    {
      'title': 'Contact Person',
      'value': rentRequestController.personNameController.text,
    },
    {'title': 'Email', 'value': rentRequestController.emailController.text},
    {'title': 'Phone ', 'value': rentRequestController.phoneController.text},
    {'title': 'ABN  ', 'value': rentRequestController.abnController.text},
    {'title': 'Phone ', 'value': rentRequestController.phoneController.text},
    {
      'title': 'Website  ',
      'value': rentRequestController.businessSiteController.text,
    },
    {
      'title': 'Property type ',
      'value': rentPropertyTypeController.selectedPropertyType.toString(),
    },
    {
      'title': 'Property Use',
      'value': rentPropertyTypeController.selectedPropertyUse.toString(),
    },
  ];
  List<Map<String, dynamic>> get propertyDetails => [
    {
      'title': 'Property Address',
      'value': rentPropertyDetailsController.propertyAddressController.text,
    },
    {
      'title': 'Property Size',
      'value': rentPropertyDetailsController.propertySizeController.text,
    },
    {
      'title': 'Space Breakdown',
      'value': rentPropertyDetailsController.formattedSpaceBreakdown,
    },
  ];
  List<Map<String, dynamic>> get propertyFurniture =>
      Get.find<RentFurnitureController>().formattedFurnitureData;
  List<Map<String, dynamic>> get additionalNote => [
    {
      'title': 'Custom notes',
      'value': rentAdditionalNoteController.noteController.text,
    },
    {
      'title': 'Material preferences',
      'value': rentAdditionalNoteController.brandController.text,
    },
  ];
  List<Map<String, dynamic>> propertyAppliance = [
    {
      'title': 'Reception',
      'value': 'Refrigerator (2), Microwave (1), Washing Machine (3)',
    },
    {
      'title': 'Office Floor',
      'value': 'Refrigerator (2), Microwave (1), Washing Machine (3)',
    },
    {
      'title': 'Private Offices',
      'value': 'Refrigerator (2), Microwave (1), Washing Machine (3)',
    },
  ];
  List<Map<String, dynamic>> propertyBranding = [
    {'title': 'Branding', 'value': 'Required'},
    {'title': 'Logo Placement', 'value': 'Yes'},
    {'title': 'Brand Color Matching', 'value': 'No'},
  ];
  List<Map<String, dynamic>> propertyNotes = [
    {'title': 'Custom notes', 'value': 'Required'},
    {'title': 'Material preferences', 'value': 'Yes'},
  ];
  List<Map<String, dynamic>> propertyPeriod = [
    {'title': 'Rental term (days)', 'value': '365 days'},
    {'title': 'Rental term (days)', 'value': '60 days'},
    {'title': 'Payment Type', 'value': 'Pay in instalments'},
    {'title': 'Discount', 'value': '10%'},
  ];
  List<Map<String, dynamic>> propertyDelivery = [
    {'title': 'Delivery Time', 'value': '10 days'},
    {'title': 'Return Time', 'value': '10 days'},
  ];
}
