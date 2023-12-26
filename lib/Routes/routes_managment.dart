import 'package:car_insurance_app/Routes/screen_binding.dart';
import 'package:car_insurance_app/Routes/set_routes.dart';
import 'package:get/get.dart';
import '../Module/HomeScreen/View/home_screen.dart';

import '../Module/Splash/View/splash_screen.dart';

class RouteManagement {
  static List<GetPage> getPages() {
    return [
      GetPage(
          name: splashscreen,
          page: () => const SplashScreen(),
          binding: ScreenBindings(),
          transition: Transition.noTransition),
    ];
  }
}
