import 'package:daily_life_reminder_app/Views/Screens/bottom_navigation_bar_screen.dart';
import 'package:daily_life_reminder_app/Views/Screens/chat_screen.dart';
import 'package:daily_life_reminder_app/Views/Screens/home_screen.dart';
import 'package:daily_life_reminder_app/Views/Screens/notifaction_screen.dart';
import 'package:daily_life_reminder_app/Views/Screens/person_screen.dart';
import 'package:daily_life_reminder_app/Views/Screens/place_an_add_screen.dart';
import 'package:daily_life_reminder_app/Views/Screens/registration_screen.dart';
import 'package:daily_life_reminder_app/Views/Screens/sign_in_screen.dart';
import 'package:daily_life_reminder_app/Views/Screens/signup_fb_google_screen.dart';
import 'package:daily_life_reminder_app/Views/Screens/splash_screen.dart';
import 'package:daily_life_reminder_app/Views/Screens/splash_screen2.dart';
import 'package:daily_life_reminder_app/Weather/Screens/loading_screen.dart';
import 'package:daily_life_reminder_app/constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: kPrimaryColor,
        ),
        home: const SplashScreen(),
        getPages: [
          GetPage(name: SplashScreen.id, page: () => const SplashScreen()),
          GetPage(name: SplashScreen2.id, page: () => const SplashScreen2()),
          GetPage(
              name: SignupFbGoogleScreen.id,
              page: () => const SignupFbGoogleScreen()),
          GetPage(
              name: RegistrationScreen.id,
              page: () => const RegistrationScreen()),
          GetPage(name: SignInScreen.id, page: () => const SignInScreen()),
          GetPage(
              name: BottomNavigationBarScreen.id,
              page: () => const BottomNavigationBarScreen()),
          GetPage(name: HomeScreen.id, page: () => const HomeScreen()),
          GetPage(
              name: NotifactionScreen.id,
              page: () => const NotifactionScreen()),
          GetPage(
              name: PlaceAnAddScreen.id, page: () => const PlaceAnAddScreen()),
          GetPage(name: ChatScreen.id, page: () => const ChatScreen()),
          GetPage(name: PersonScreen.id, page: () => const PersonScreen()),
          GetPage(name: LoadingScreen.id, page: () =>  LoadingScreen()),
        ],
      ),
    );
  }
}
