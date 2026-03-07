import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/data/local/theme_service.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;
  late final ThemeService themeService;
  @override
  void onInit() {
    themeService = Get.find<ThemeService>();
    isDarkMode.value = themeService.getIsDark();
    super.onInit();
  }

  void changeTheme(bool value) {
    isDarkMode.value = value;
    themeService.saveThemeToStorage(value);
  }

  ThemeMode get currentTheme =>
      isDarkMode.value ? ThemeMode.dark : ThemeMode.dark;
}