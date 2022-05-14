import 'package:daily_life_reminder_app/Views/Screens/registration_screen.dart';
import 'package:daily_life_reminder_app/Views/Screens/sign_in_screen.dart';
import 'package:daily_life_reminder_app/Views/Widget/custome_button.dart';
import 'package:daily_life_reminder_app/Views/Widget/custome_round_button.dart';
import 'package:daily_life_reminder_app/Views/Widget/custome_text.dart';
import 'package:daily_life_reminder_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignupFbGoogleScreen extends StatelessWidget {
  static const String id = '/signup_fb_google_screen';
  const SignupFbGoogleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.8),
                  spreadRadius: 10,
                  blurRadius: 5,
                  offset: Offset(0, 7), // changes position of shadow
                ),
              ],
              image: DecorationImage(
                image: const AssetImage('images/img1_1.jpeg'),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.7), BlendMode.darken),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 100.h,
              ),
              /* ---------------------------- i Text ---------------------------- */
              Hero(
                tag: 'text_ani',
                child: CustomeText(
                  text: 'Daily Life Reminder',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  latterSpacing: 1,
                  color: kWhiteColor,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              /* ---------------------------------- Logo ---------------------------------- */
              Image.asset(
                'images/logo.png',
                height: 150.h,
                width: 380.w,
              ),
              SizedBox(
                height: 60.h,
              ),
              Divider(
                indent: 150.w,
                endIndent: 150.w,
                color: kWhiteColor,
              ),
              CustomeText(
                text: 'Save time while you busy',
                fontSize: 14.sp,
                color: kWhiteColor,
              ),
              SizedBox(
                height: 30.h,
              ),
              /* ------------------------------ Signup Button ----------------------------- */
              CustomeButton(
                borderColor: kWhiteColor,
                text: 'SignUp',
                onTap: () {
                  Get.toNamed(RegistrationScreen.id);
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              /* ----------------------------- Divider and OR ----------------------------- */
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      indent: 80.w,
                      endIndent: 10.w,
                      color: kWhiteColor,
                    ),
                  ),
                  CustomeText(
                    text: 'OR',
                    fontSize: 14.sp,
                    color: kWhiteColor,
                  ),
                  Expanded(
                    child: Divider(
                      indent: 10.w,
                      endIndent: 80.w,
                      color: kWhiteColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              /* ------------------------------ Login Button ------------------------------ */
              CustomeButton(
                borderColor: kWhiteColor,
                text: 'Login',
                onTap: () {
                  Get.toNamed(SignInScreen.id);
                },
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomeText(
                text: 'Continue with',
                fontSize: 14.sp,
                color: kWhiteColor,
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  /* ---------------------------- FB Rounder Button --------------------------- */
                  const CustomeRoundButton(
                    bgimage: AssetImage('images/fb.png'),
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CustomeText(
                    text: 'OR',
                    fontSize: 14.sp,
                    color: kWhiteColor,
                  ),
                  /* -------------------------- Google Rounder Button ------------------------- */
                  SizedBox(
                    width: 10.w,
                  ),
                  const CustomeRoundButton(
                    bgimage: AssetImage('images/gmail.png'),
                    color: Colors.white,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
