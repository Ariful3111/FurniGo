import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/di/dependency_injection.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/core/routes/routes.dart';
import 'package:zb_dezign/core/theme/app_theme.dart';
import 'package:zb_dezign/core/theme/theme_controller.dart';
import 'package:zb_dezign/features/auth/bindings/onboard_bindings.dart';
import 'package:zb_dezign/features/home/bindings/home_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String token = await DependencyInjection.init();
  if (token.isNotEmpty) {
    debugPrint("Token: $token");
  }
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String token;
  const MyApp({required this.token, super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      builder: (context, child) {
        return Obx(() {
          return GetMaterialApp(
            title: 'ZB DEZIGN',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: Get.find<ThemeController>().currentTheme,
            initialBinding: token.isEmpty ? OnboardBindings() : HomeBindings(),
            initialRoute: token.isEmpty
                ? AppRoutes.onboardingView
                : AppRoutes.checkoutView,
            getPages: appRoutes,
          );
        });
      },
    );
  }
}
