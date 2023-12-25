import 'package:car_insurance_app/Module/BussinesCommunity/Controller/bussines_communities_controller.dart';
import 'package:car_insurance_app/Module/GeneralServices/Model/GeneralService.dart';
import 'package:car_insurance_app/Module/GeneralServices/View/general_services_screen.dart';
import 'package:car_insurance_app/Module/InvestMentOpportunity/Model/InvestMentOpportunity.dart';
import 'package:car_insurance_app/Module/InvestMentOpportunity/View/investMent_Opportunity_screen.dart';
import 'package:car_insurance_app/Module/OnlineStore/Controller/online_store_controller.dart';
import 'package:car_insurance_app/Module/Tenders/Model/Tender.dart';
import 'package:car_insurance_app/Module/Tenders/View/tenders_screen.dart';
import 'package:car_insurance_app/Module/Verification/MobileNumber/Controller/register_controller.dart';
import 'package:car_insurance_app/Module/Verification/Verification%20Code/Controller/verification_code_controller.dart';
import 'package:get/get.dart';
import 'package:car_insurance_app/Module/Verification/Password/View/password_screen.dart';
import 'package:car_insurance_app/Module/Verification/MobileNumber/View/register.dart';
import 'package:car_insurance_app/Module/Verification/Verification%20Code/View/verification_code.dart';

import '../Module/BussinesForSale/View/sale_bussines_screen.dart';
import '../Module/HomeScreen/View/home_screen.dart';

import '../Module/MarketPlace/Controller/market_place_controller.dart';
import '../Module/Splash/View/splash_screen.dart';
import '../Module/Verification/Password/Controller/password_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => const SplashScreen());
    Get.lazyPut(() => CheckPhoneNumberController());
    Get.lazyPut(() => VerificationCodeController());
    Get.lazyPut(() => PasswordController());
    Get.lazyPut(() => HomeScreen());
    Get.lazyPut(() => MarketPlaceController());
    Get.lazyPut(() => BussinesCommunitiesController());
    Get.lazyPut(() => OnlineStoreController());
    Get.lazyPut(() => BussinesForSale());
    Get.lazyPut(() => TendersView());
    Get.lazyPut(() => GeneralServiceView());
    Get.lazyPut(() => InvestMentOpportunityView());
  }
}
