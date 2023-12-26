import 'package:get/get.dart';
import '../Module/HomeScreen/View/home_screen.dart';

import '../Module/MarketPlace/Controller/market_place_controller.dart';
import '../Module/Splash/View/splash_screen.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => const SplashScreen());

    Get.lazyPut(() => HomeScreen());
    Get.lazyPut(() => MarketPlaceController());
  }
}
