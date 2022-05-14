import 'package:daily_life_reminder_app/Controller/bottomNavigationBarController.dart';
import 'package:daily_life_reminder_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  static const String id = '/bottom_navigation_bar_screen';
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationBarController>(
        init: BottomNavigationBarController(),
        builder: (bottomNavigationBarController) {
          return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: kPrimaryColor,
                unselectedItemColor: kGreyColor,
                currentIndex: bottomNavigationBarController.currentIndex,
                onTap: (index) {
                  bottomNavigationBarController.onTap(index);
                },
                // ignore: prefer_const_literals_to_create_immutables
                items: bottomNavigationBarController.item,
              ),
              body: bottomNavigationBarController
                  .screen[bottomNavigationBarController.currentIndex]);
        });
  }
}
