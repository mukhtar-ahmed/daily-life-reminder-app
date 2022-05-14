import 'dart:async';

import 'package:daily_life_reminder_app/Views/Screens/signup_fb_google_screen.dart';
import 'package:get/get.dart';

class SplashScreen2Controller extends GetxController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 2), () {
      const Duration(seconds: 5);
      Get.toNamed(SignupFbGoogleScreen.id);
    });
    super.onInit();
  }
}
