import 'package:daily_life_reminder_app/Controller/splash_screen2_controller.dart';
import 'package:daily_life_reminder_app/Views/Widget/custome_text.dart';
import 'package:daily_life_reminder_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen2 extends StatelessWidget {
  static const String id = '/splash_screen2';
  const SplashScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: GetBuilder<SplashScreen2Controller>(
          init: SplashScreen2Controller(),
          builder: (splashScreen2Controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.h,
                ),
                CustomeText(
                    text: 'WELCOME', latterSpacing: 3.sp, fontSize: 15.sp),
                SizedBox(
                  height: 235.h,
                ),
                Image.asset(
                  'images/logo.png',
                  height: 200.h,
                  width: 380.w,
                ),
                Hero(
                  tag: 'text_ani',
                  child: CustomeText(
                      text: 'Daily Life Reminder',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      latterSpacing: 1),
                ),
                SizedBox(
                  height: 245.h,
                ),
                CustomeText(
                    text: 'Copyright Ⓒ 2018 Daily Life Reminder.',
                    fontSize: 14.sp,
                    latterSpacing: 1),
                CustomeText(
                    text: 'All right reserved',
                    fontSize: 14.sp,
                    latterSpacing: 1),
              ],
            );
          }),
    );
  }
}
