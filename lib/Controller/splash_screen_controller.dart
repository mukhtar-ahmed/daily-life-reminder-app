import 'dart:async';

import 'package:daily_life_reminder_app/Views/Screens/splash_screen2.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 2), () {
      Get.toNamed(SplashScreen2.id);
    });
    super.onInit();
  }
}
