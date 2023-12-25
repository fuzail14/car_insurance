import 'package:car_insurance_app/Module/BussinesCommunity/View/bussines_communities_screen.dart';
import 'package:car_insurance_app/Module/BussinesForSale/View/sale_bussines_screen.dart';
import 'package:car_insurance_app/Module/GeneralServices/View/general_services_screen.dart';
import 'package:car_insurance_app/Module/InvestMentOpportunity/View/investMent_Opportunity_screen.dart';
import 'package:car_insurance_app/Module/MarketPlace/View/market_place_screen.dart';
import 'package:car_insurance_app/Module/OnlineStore/View/online_store_screen.dart';
import 'package:car_insurance_app/Module/Tenders/View/tenders_screen.dart';
import 'package:get/get.dart';
import 'package:car_insurance_app/Module/Verification/Password/View/password_screen.dart';
import 'package:car_insurance_app/Module/Verification/MobileNumber/View/register.dart';
import 'package:car_insurance_app/Module/Verification/Verification%20Code/View/verification_code.dart';
import 'package:car_insurance_app/Routes/screen_binding.dart';
import 'package:car_insurance_app/Routes/set_routes.dart';
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
      GetPage(
          name: checkPhoneNumber,
          page: () => CheckPhoneNumber(),
          binding: ScreenBindings(),
          transition: Transition.noTransition),
      GetPage(
          name: homescreen,
          page: () => HomeScreen(),
          binding: ScreenBindings(),
          transition: Transition.noTransition),
      GetPage(
          name: verificationCodeScreen,
          page: () => VerificationCode(),
          binding: ScreenBindings(),
          transition: Transition.noTransition),
      GetPage(
          name: passwordScreen,
          page: () => PasswordScreen(),
          binding: ScreenBindings(),
          transition: Transition.noTransition),
      GetPage(
          name: marketPlaceScreen,
          page: () => MarketPlaceScreen(),
          binding: ScreenBindings(),
          transition: Transition.noTransition),
      GetPage(
          name: bussinesCommunitiesScreen,
          page: () => BussinesCommunitiesScreen(),
          binding: ScreenBindings(),
          transition: Transition.noTransition),
      GetPage(
          name: onlineStoreScreen,
          page: () => OnlineStoreScreen(),
          binding: ScreenBindings(),
          transition: Transition.noTransition),
      GetPage(
          name: bussinesForSale,
          page: () => BussinesForSale(),
          binding: ScreenBindings(),
          transition: Transition.noTransition),
      GetPage(
          name: tendersView,
          page: () => TendersView(),
          binding: ScreenBindings(),
          transition: Transition.noTransition),
      GetPage(
          name: generalServiceView,
          page: () => GeneralServiceView(),
          binding: ScreenBindings(),
          transition: Transition.noTransition),
      GetPage(
          name: investMentOpportunityView,
          page: () => InvestMentOpportunityView(),
          binding: ScreenBindings(),
          transition: Transition.noTransition),
    ];
  }
}
