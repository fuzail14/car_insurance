import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../Constants/constants.dart';
import '../../../../Routes/set_routes.dart';

class CheckPhoneNumberController extends GetxController {
  final phoneNumberController = TextEditingController();
  RxString countryFlag = "".obs;
  RxString countryCode = "".obs;
  RxString phoneNumber = "".obs;
  Country country = Country(
      phoneCode: "966",
      countryCode: "SA",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: 'Saudi Arabia',
      example: 'Saudi Arabia',
      displayName: 'Saudi Arabia',
      displayNameNoCountryCode: 'SA',
      e164Key: "");

  RxString verificationId = "".obs;

  RxBool isLoading = false.obs;
  final key = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    countryCode.value = country.phoneCode;
    countryFlag.value = country.flagEmoji;
  }

  verifyUserPhoneNumber() async {
    isLoading.value = true;
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber.toString().trim(),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
        isLoading.value = false;
      },
      verificationFailed: (FirebaseAuthException e) {
        isLoading.value = false;

        myToast(msg: e.code.toString(), isNegative: true);
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId.value = verificationId;
        isLoading.value = false;

        Get.toNamed(verificationCodeScreen);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        isLoading.value = true;
      },
    );
  }
}
