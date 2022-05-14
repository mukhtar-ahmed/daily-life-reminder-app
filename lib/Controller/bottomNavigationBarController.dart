import 'package:daily_life_reminder_app/Views/Screens/chat_screen.dart';
import 'package:daily_life_reminder_app/Views/Screens/notifaction_screen.dart';
import 'package:daily_life_reminder_app/Views/Screens/person_screen.dart';
import 'package:daily_life_reminder_app/Views/Screens/place_an_add_screen.dart';
import 'package:daily_life_reminder_app/Weather/Screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  int currentIndex = 0;

  List<BottomNavigationBarItem> item = [
    const BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.cloud),
      label: "Weather",
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.notifications,
      ),
      label: "Notifaction",
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.add_circle,
      ),
      label: "Place an Add",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.chat),
      label: "Chat",
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.person,
      ),
      label: "Person",
    ),
  ];

  final screen = [
    LocationScreen(),
    NotifactionScreen(),
    PlaceAnAddScreen(),
    ChatScreen(),
    PersonScreen()
  ];

  onTap(index) {
    currentIndex = index;
    update();
  }
}
