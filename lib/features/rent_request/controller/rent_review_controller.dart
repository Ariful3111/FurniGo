import 'package:get/get.dart';

class RentReviewController extends GetxController{
  var propertyType = [
    {'title': 'Property Type', 'value': 'Commercial'},
    {'title': 'Property Use', 'value': 'Office'},
  ];
  var propertyDetails = [
    {'title': 'Property Address', 'value': '25 Collins Street, Melbourne VIC 3000, Australia'},
    {'title': 'Property Size', 'value': '1235 sqm'},
    {'title': 'Space Breakdown', 'value': 'Reception / Waiting Area(2), Meeting / Conference Rooms (2), Private Offices (1), Utility Room(1), Staff Break Area (2)'},
  ];
  var propertyFloorPlan = [
    {'title': 'Office Floor', 'value': 'Length (1 sqm)*Width (1 sqm)'},
    {'title': 'Private Offices', 'value': 'Length (1 sqm)*Width (1 sqm)'},
    {'title': 'Kitchen', 'value': 'Length (1 sqm)*Width (1 sqm)'},
  ];
  var propertyAppliance = [
    {'title': 'Reception', 'value': 'Refrigerator (2), Microwave (1), Washing Machine (3)'},
    {'title': 'Office Floor', 'value': 'Refrigerator (2), Microwave (1), Washing Machine (3)'},
    {'title': 'Private Offices', 'value': 'Refrigerator (2), Microwave (1), Washing Machine (3)'},
  ];
  var propertyBranding = [
    {'title': 'Branding', 'value': 'Required'},
    {'title': 'Logo Placement', 'value': 'Yes'},
    {'title': 'Brand Color Matching', 'value': 'No'},
  ];
  var propertyPeriod = [
    {'title': 'Rental term (days)', 'value': '60 days'},
    {'title': 'Payment Type', 'value': 'Pay in instalments'},
    {'title': 'Discount', 'value': '10%'},
  ];
  var propertyDelivery = [
    {'title': 'Delivery Time', 'value': '10 days'},
    {'title': 'Return Time', 'value': '10 days'},
  ];
}