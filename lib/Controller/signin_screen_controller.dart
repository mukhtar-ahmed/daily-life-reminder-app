import 'package:daily_life_reminder_app/Views/Screens/bottom_navigation_bar_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninScreenController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isLoading = false;

  /* -------------------------------------------------------------------------- */
  /*                                SignIn Method                               */
  /* -------------------------------------------------------------------------- */
  void signIn({required String email, required String password}) async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      update();

      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Get.snackbar('SignIn', 'SignIn Successfully'),
                Get.toNamed(BottomNavigationBarScreen.id)
              })
          .catchError((e) {
        Get.snackbar('SignIn', 'SignIn UnSuccessfully',
            snackPosition: SnackPosition.BOTTOM);

        isLoading = false;
        update();
      });
      isLoading = false;
      update();
    }
  }
}
