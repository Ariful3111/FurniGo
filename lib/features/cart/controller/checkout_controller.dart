import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/icons_path.dart';

class CheckoutController extends GetxController {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController zip = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController cardNumber = TextEditingController();
  TextEditingController mmYY = TextEditingController();
  TextEditingController cvv = TextEditingController();
  TextEditingController nameOnCard = TextEditingController();
  TextEditingController paypalEmailController = TextEditingController();
  TextEditingController promoController = TextEditingController();
  RxInt selectedIndex = 0.obs;

  final List<Map<String, dynamic>> addressList = [
    {
      "type": "Home",
      "name": "John Doe",
      "address1": "123 George Street",
      "address2": "Sydney, NSW 2000",
      "country": "Australia",
      "isDefault": true,
    },
    {
      "type": "Work",
      "name": "John Doe",
      "address1": "456 Collins Street",
      "address2": "Melbourne, VIC 3000",
      "country": "Australia",
      "isDefault": false,
    },
  ];
  RxInt selectedCardIndex = 0.obs;
  final List<Map<String, String>> cardList = [
    {
      "image": IconsPath.visa,
      "number": "41xx xxxx xxxx 5399",
      "name": "John Doe",
      "expiry": "12/2025",
    },
    {
      "image": IconsPath.visa,
      "number": "41xx xxxx xxxx 5499",
      "name": "John Doe",
      "expiry": "12/2025",
    },
    {
      "image": IconsPath.masterCard,
      "number": "41xx xxxx xxxx 5499",
      "name": "John Doe",
      "expiry": "12/2025",
    },
  ];
  RxBool saveInfo = false.obs;
  RxInt selectedAddress = 0.obs;
  RxInt selectedMethod = 0.obs;
  @override
  dispose() {
    firstName.dispose();
    lastName.dispose();
    address.dispose();
    city.dispose();
    state.dispose();
    zip.dispose();
    phone.dispose();
    cardNumber.dispose();
    mmYY.dispose();
    cvv.dispose();
    nameOnCard.dispose();
    paypalEmailController.dispose();
    paypalEmailController.dispose();
    promoController.dispose();
    super.dispose();
  }
}
