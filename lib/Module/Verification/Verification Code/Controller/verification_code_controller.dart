import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../Constants/constants.dart';
import '../../../../Routes/set_routes.dart';

import '../../MobileNumber/Controller/register_controller.dart';

class VerificationCodeController extends GetxController {
  RxString otpCode = "".obs;
  RxString fcmToken = "".obs;
  RxString verificatioCode = "".obs;
  final otpCodeController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CheckPhoneNumberController checkPhoneNumberController =
      Get.put(CheckPhoneNumberController());
  RxBool isLoading = false.obs;

  verifyUserOtp() async {
    String smsCode = otpCodeController.text.toString();
    isLoading.value = true;

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificatioCode.value, smsCode: smsCode);

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      if (userCredential != null) {
        log(userCredential.user!.phoneNumber.toString().trim());
        Get.toNamed(passwordScreen);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'session-expired') {
        myToast(
            msg: 'The SMS code has expired. Please request to resend the OTP.',
            isNegative: true);
        // Here, add logic to resend the OTP to the user's phone number
      } else {
        myToast(
            msg: e.message ?? 'An unknown error occurred', isNegative: true);
      }
    } catch (e, stackTrace) {
      log(e.toString());
      myToast(
          msg: 'An error occurred while verifying OTP: $e', isNegative: true);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    verificatioCode.value = checkPhoneNumberController.verificationId.value;
    log(verificatioCode.value.toString());
  }
}
