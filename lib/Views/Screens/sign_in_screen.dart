import 'package:daily_life_reminder_app/Controller/signin_screen_controller.dart';
import 'package:daily_life_reminder_app/Views/Screens/registration_screen.dart';
import 'package:daily_life_reminder_app/Views/Widget/custome_button.dart';
import 'package:daily_life_reminder_app/Views/Widget/custome_text.dart';
import 'package:daily_life_reminder_app/Views/Widget/custome_text_form_field.dart';
import 'package:daily_life_reminder_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  static const String id = '/sign_in_screen';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SigninScreenController>(
        init: SigninScreenController(),
        builder: (signinScreenController) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Stack(
              children: [
                Container(
                  foregroundDecoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.8),
                        spreadRadius: 10,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 7), // changes position of shadow
                      ),
                    ],
                    image: DecorationImage(
                      image: const AssetImage('images/img1_1.jpeg'),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.8), BlendMode.darken),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Form(
                    key: signinScreenController.formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 60.h,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'images/logo.png',
                                height: 100.h,
                                width: 150.w,
                              ),
                              CustomeText(
                                text: 'Daily Life Reminder',
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                latterSpacing: 1,
                                color: kWhiteColor,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          /* ---------------------------------- Email --------------------------------- */
                          CustomeTextFormField(
                              textController:
                                  signinScreenController.emailController,
                              isObscure: false,
                              icon: Icons.email,
                              labelText: 'Email',
                              hintText: 'Email',
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your email";
                                }
                                if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                                  return 'Invalid Email';
                                }

                                return null;
                              }),
                          SizedBox(
                            height: 10.h,
                          ),

                          /* -------------------------------- Password -------------------------------- */
                          CustomeTextFormField(
                              textController:
                                  signinScreenController.passwordController,
                              isObscure: true,
                              icon: Icons.key,
                              labelText: 'Password',
                              hintText: 'Password',
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Password is required';
                                }
                                if (value.length < 6) {
                                  return 'Password Must be atleast 6 Character';
                                }
                                return null;
                              }),
                          SizedBox(
                            height: 30.h,
                          ),

                          /* -------------------------- Have Account? Sign In ------------------------- */
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const CustomeText(
                                text: "Don't have an account? ",
                                color: kWhiteColor,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(RegistrationScreen.id);
                                },
                                child: const CustomeText(
                                  text: 'Sign Up ',
                                  color: kWhiteColor,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          CustomeButton(
                            borderColor: Colors.transparent,
                            text: 'SIGN IN',
                            color: kPrimaryColor,
                            onTap: () {
                              signinScreenController.signIn(
                                  email: signinScreenController
                                      .emailController.text,
                                  password: signinScreenController
                                      .passwordController.text);
                            },
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
