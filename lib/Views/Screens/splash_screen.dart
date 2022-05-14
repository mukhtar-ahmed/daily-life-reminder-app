import 'package:daily_life_reminder_app/Controller/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  static const String id = '/splash_screen.dart';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GetBuilder<SplashScreenController>(
          init: SplashScreenController(),
          builder: (splashScreenController) {
            return Center(
              child: Image.asset(
                'images/logo.png',
                height: 200.h,
              ),
            );
          }),
    );
  }
}
