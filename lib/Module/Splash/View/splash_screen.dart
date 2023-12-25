import 'dart:async';
import 'package:car_insurance_app/Module/Splash/SlideScreen/slidescree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Constants/Person/person.dart';
import '../../../Routes/set_routes.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getUserSharedPreferencesData();
  }

  void getUserSharedPreferencesData() async {
    Person person = await MySharedPreferences.getUserData();

    if (person.Bearer == "") {
      Timer(const Duration(seconds: 3), () => Get.to(SlideScreen()));
    } else {
      Timer(const Duration(seconds: 3),
          () => Get.offNamed(homescreen, arguments: person));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: double.infinity,
            height: 492,
            child: Image.asset(
              'assets/images/car_splash.png', fit: BoxFit.cover,
              // fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
