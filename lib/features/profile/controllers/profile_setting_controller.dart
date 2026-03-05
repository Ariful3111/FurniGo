import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileSettingController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController addressLabelController = TextEditingController();
  TextEditingController dialogNameController = TextEditingController();
  TextEditingController dialogPhoneController = TextEditingController();
  TextEditingController dialogAddressController = TextEditingController();

  RxBool isEdit = false.obs;
  List addressList = [
    {
      'label': 'Home',
      'address': '123 Main St, Sydney NSW 2000',
      'default': true,
    },
    {
      'label': 'Work',
      'address': '456 Elm St, Sydney NSW 2000',
      'default': false,
    },
  ];
  List notification = [
    {
      'title': 'Order updates',
      'sub': 'Get notified about order status changes',
      'isOn': false.obs,
    },
    {
      'title': 'Rental updates',
      'sub': 'Get notified about order status changes',
      'isOn': false.obs,
    },
    {
      'title': 'Quote updates',
      'sub': 'Get alerts when quotes are ready',
      'isOn': false.obs,
    },
    {
      'title': 'Promotions',
      'sub': 'Receive marketing emails and special offers',
      'isOn': false.obs,
    },
  ];
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    dialogAddressController.dispose();
    dialogPhoneController.dispose();
    addressLabelController.dispose();
    dialogNameController.dispose();
    super.dispose();
  }
}
