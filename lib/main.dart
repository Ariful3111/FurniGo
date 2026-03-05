import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/di/dependency_injection.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/core/routes/routes.dart';
import 'package:zb_dezign/core/theme/app_theme.dart';
import 'package:zb_dezign/core/theme/theme_controller.dart';
import 'package:zb_dezign/features/dashboard/bindings/dashboard_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
            initialBinding: DashboardBindings(),
            initialRoute: AppRoutes.bottomNav,
            getPages: appRoutes,
          );
        });
      },
    );
  }
}
