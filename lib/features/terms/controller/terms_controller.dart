import 'package:get/get.dart';

class TermsController extends GetxController {
  RxString selectedOption = 'Privacy Policy'.obs;
  List option = [
    'Privacy Policy',
    'Cookie Policy',
    'Referral Policy',
    'Terms & Conditions',
    'Security & Compliance',
    'Shipping & Returns',
  ];
}
