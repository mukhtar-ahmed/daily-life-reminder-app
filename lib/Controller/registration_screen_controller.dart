import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_life_reminder_app/Model/user_model.dart';
import 'package:daily_life_reminder_app/Views/Screens/bottom_navigation_bar_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationScreenController extends GetxController {
  final auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  var isChecked = false.obs;
  var loading = false.obs;

  /* -------------------------------------------------------------------------- */
  /*                            Checkbox is Cheacked                            */
  /* -------------------------------------------------------------------------- */
  void cheacked(bool? value) {
    isChecked.value = value!;
    update();
  }

  /* -------------------------------------------------------------------------- */
  /*                            Sign Up Method Start                            */
  /* -------------------------------------------------------------------------- */
  void signUp({required String email, required String password}) async {
    RegistrationScreenController registrationScreenController =
        Get.put(RegistrationScreenController());
    if (registrationScreenController.formKey.currentState!.validate()) {
      registrationScreenController.loading.value = true;
      update();
      try {
        await registrationScreenController.auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  postDetailsToFireStore(),
                });
      } catch (e) {
        Get.snackbar('SignUp', e.toString());
      }

      registrationScreenController.loading.value = false;
      update();
    }
  }

  /* -------------------------------------------------------------------------- */
  /*                          Post Details to Firestore                         */
  /* -------------------------------------------------------------------------- */
  postDetailsToFireStore() async {
    RegistrationScreenController registrationScreenController =
        Get.put(RegistrationScreenController());
    User? user = registrationScreenController.auth.currentUser;
    UserModel userModel = UserModel();
    userModel.uid = user!.uid;
    userModel.fullName = registrationScreenController.nameController.text;
    userModel.email = user.email;

    await registrationScreenController.firebaseFirestore
        .collection('users')
        .doc(user.uid)
        .set(userModel.toMap());
    Get.toNamed(BottomNavigationBarScreen.id);
    Get.snackbar('SignUp', 'SignUp Successfully');
  }
}
