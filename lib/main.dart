// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:car_insurance_app/Routes/routes_managment.dart';
import 'package:car_insurance_app/Routes/set_routes.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: Size(375, 812),
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Jazalla',
            debugShowCheckedModeBanner: false,
            initialRoute: splashscreen,
            getPages: RouteManagement.getPages(),
          );
        });
  }
}
