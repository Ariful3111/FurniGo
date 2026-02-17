import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zb_dezign/core/constant/colors.dart';
import 'package:zb_dezign/core/constant/images_path.dart';
import 'package:zb_dezign/core/routes/app_routes.dart';
import 'package:zb_dezign/core/theme/theme_controller.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  var currentIndex = 0.obs;
  RxDouble dragOffset = 0.0.obs;
  final double maxDragDistance = 45;
  RxInt activeArrow = 0.obs;
  List colorList = [
    AppColors.primaryBG,
    AppColors.primaryBG.withOpacity(0.6),
    AppColors.primaryBG.withOpacity(0.3),
  ];
  List darkColorList = [
    AppColors.darkPrimaryGradient,
    AppColors.darkPrimaryGradient.withOpacity(0.6),
    AppColors.darkPrimaryGradient.withOpacity(0.3),
  ];

  Color syncColor(int i) {
    int relativeIndex = (i - activeArrow.value) % 3;
    return Get.find<ThemeController>().isDarkMode.value
        ? darkColorList[relativeIndex]
        : colorList[relativeIndex];
  }

  double syncOpacity(int i) {
    int relativeIndex = (i - activeArrow.value) % 3;
    if (relativeIndex == 0) return 1.0;
    if (relativeIndex == 1) return 0.6;
    return 0.3;
  }

  void startArrowAnimation() {
    Future.delayed(Duration.zero, () async {
      while (true) {
        await Future.delayed(const Duration(milliseconds: 300));
        activeArrow.value = (activeArrow.value + 1) % 3;
      }
    });
  }

  void updateDrag(double dx) {
    dragOffset.value = (dragOffset.value + dx).clamp(0.0, maxDragDistance);
  }

  void endDrag({required bool isLast}) {
    if (dragOffset.value > maxDragDistance * 0.8) {
      Future.delayed(Duration(milliseconds: 200), () {
        if (pageController.hasClients && !isLast) {
          pageController.nextPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
          Get.toNamed(AppRoutes.signInView);
        }
        Future.delayed(Duration(milliseconds: 500), () {
          dragOffset.value = 0.0;
        });
      });
      dragOffset.value = maxDragDistance;
    } else {
      dragOffset.value = 0.0;
    }
  }

  List onboardingItems = [
    {
      'image': Get.find<ThemeController>().isDarkMode.value
          ? ImagesPath.darkOnboarding1
          : ImagesPath.onboarding1,
      'title': 'Design, Buy & Rent Furniture Effortlessly',
      'subTitle':
          'Shop premium furniture, rent collections, and visualize everything in your own space with AI & AR.',
    },
    {
      'image': Get.find<ThemeController>().isDarkMode.value
          ? ImagesPath.darkOnboarding2
          : ImagesPath.onboarding2,
      'title': 'See It In Your Space Before You Buy',
      'subTitle':
          'Upload or capture your room and place furniture, lighting & décor using AI and 3D.',
    },
    {
      'image': Get.find<ThemeController>().isDarkMode.value
          ? ImagesPath.darkOnboarding3
          : ImagesPath.onboarding3,
      'title': 'Buy New. Sell Old. Rent Smart.',
      'subTitle':
          'Sell your old furniture, rent collections,\nor request business setups in minutes.',
    },
    {
      'image': Get.find<ThemeController>().isDarkMode.value
          ? ImagesPath.darkOnboarding4
          : ImagesPath.onboarding4,
      'title': 'Memberships & Business Rentals',
      'subTitle':
          'Unlock discounts, free collections, and\nbusiness rental solutions with flexible plans.',
    },
    {
      'image': Get.find<ThemeController>().isDarkMode.value
          ? ImagesPath.darkOnboarding4
          : ImagesPath.onboarding4,
      'title': 'Sign Up or Log In, No Password Required',
      'subTitle':
          'Unlock discounts, free collections, and\nbusiness rental solutions with flexible plans.',
    },
  ];
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    super.onInit();
    startArrowAnimation();
  }
}
