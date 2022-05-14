import 'package:daily_life_reminder_app/Controller/registration_screen_controller.dart';
import 'package:daily_life_reminder_app/Views/Screens/sign_in_screen.dart';
import 'package:daily_life_reminder_app/Views/Widget/custome_button.dart';
import 'package:daily_life_reminder_app/Views/Widget/custome_round_button.dart';
import 'package:daily_life_reminder_app/Views/Widget/custome_text.dart';
import 'package:daily_life_reminder_app/Views/Widget/custome_text_form_field.dart';
import 'package:daily_life_reminder_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatelessWidget {
  static const String id = '/registration_screen';
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationScreenController>(
        init: RegistrationScreenController(),
        builder: (registrationScreenController) {
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
                    key: registrationScreenController.formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50.h,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'images/logo.png',
                                height: 80.h,
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
                            height: 20.h,
                          ),

                          /* ---------------------------------- Name ---------------------------------- */
                          CustomeTextFormField(
                              textController:
                                  registrationScreenController.nameController,
                              isObscure: false,
                              icon: Icons.person,
                              labelText: 'Name',
                              hintText: 'Name',
                              validate: (value) {
                                if (value != null && value.isNotEmpty) {
                                  if (value.length < 3) {
                                    return "Name should be atleast 3 Character";
                                  }
                                } else {
                                  return 'Name cannot be empty';
                                }
                                return null;
                              }),
                          SizedBox(
                            height: 10.h,
                          ),
                          /* ---------------------------------- Email --------------------------------- */
                          CustomeTextFormField(
                            textController:
                                registrationScreenController.emailController,
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
                            },
                          ),
                          SizedBox(
                            height: 10.h,
                          ),

                          /* -------------------------------- Password -------------------------------- */
                          CustomeTextFormField(
                              textController: registrationScreenController
                                  .passwordController,
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
                            height: 10.h,
                          ),
                          /* ---------------------------- Confirm Password ---------------------------- */
                          CustomeTextFormField(
                            textController: registrationScreenController
                                .confirmPasswordController,
                            isObscure: true,
                            icon: Icons.key,
                            labelText: 'Confirm Password',
                            hintText: 'Confirm Password',
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Password is required';
                              }
                              if (registrationScreenController
                                      .passwordController.text !=
                                  value) {
                                return 'Password not match';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          /* -------------------------- Have Account? Sign In ------------------------- */
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const CustomeText(
                                text: 'Have account? ',
                                color: kWhiteColor,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(SignInScreen.id);
                                },
                                child: const CustomeText(
                                  text: 'Sign In ',
                                  color: kWhiteColor,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomeButton(
                            borderColor: Colors.transparent,
                            text: 'SignUp',
                            color: kPrimaryColor,
                            onTap: () {
                              registrationScreenController.signUp(
                                  email: registrationScreenController
                                      .emailController.text,
                                  password: registrationScreenController
                                      .passwordController.text);
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
                          const CustomeRoundButton(
                            bgimage: AssetImage('images/gmail.png'),
                            color: Colors.white,
                          )
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
