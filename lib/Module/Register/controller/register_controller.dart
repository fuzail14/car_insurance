import 'dart:convert';
import 'dart:developer';

import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;
import '../../../../Constants/Person/person.dart';
import '../../../../Constants/api_routes.dart';
import '../../../../Constants/constants.dart';
import '../../../../Repo/Verification Repository/verification_repository.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Services/Shared Preferences/MySharedPreferences.dart';
import '../Verfication/View/verfication_screen.dart';

class RegisterController extends GetxController {
  //final CheckPhoneNumberController checkPhoneNumberController = Get.find();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final fullnameController = TextEditingController();
  final cprnumberController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  final key = GlobalKey<FormState>();
  bool isLoading = false;
  Person? person;
  final _repository = LoginRepository();
  var isHidden = true;

  @override
  void onInit() {
    super.onInit();
    // countryCode.value = country.phoneCode;
    // countryFlag.value = country.flagEmoji;
  }

  // Future<void> registerUser() async {
  //   isLoading = true;

  //   print(fullnameController.text);
  //   print(cprnumberController.text);
  //   print(phoneNumberController.text);
  //   print(passwordController.text);
  //   print('hi${confirmpasswordController.text}');

  //   Map<String, String> headers = {"Content-Type": "application/json"};
  //   Map<String, dynamic> body = {
  //     "full_name": fullnameController.text,
  //     "cpr_number": cprnumberController.text,
  //     "mobile_number": phoneNumberController.text,
  //     "password": passwordController.text,
  //     "confirm_password": confirmpasswordController.text,
  //   };

  //   try {
  //     final response = await http.post(
  //       Uri.parse(Api.register),
  //       headers: headers,
  //       body: jsonEncode(body),
  //     );

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       // Handle the JSON data returned from the server
  //       final data = jsonDecode(response.body);

  //       // If the API has a specific key for the response data, ensure to access it correctly
  //       Get.snackbar('Success', 'User registered successfully!');
  //     } else {
  //       // Error handling
  //       Get.snackbar('Error', 'Failed to register user.');
  //     }
  //   } catch (e) {
  //     Get.snackbar('Error', 'An error occurred: $e');
  //   } finally {
  //     isLoading = false;
  //   }
  // }

  void togglePasswordView() {
    isHidden = !isHidden;
    update();
  }

  RxString countryFlag = "".obs;
  RxString countryCode = "".obs;
  RxString phoneNumber = "".obs;
  Country country = Country(
      phoneCode: "",
      countryCode: "",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: '',
      example: '',
      displayName: '',
      displayNameNoCountryCode: '',
      e164Key: "");

  RxString verificationId = "".obs;

  verifyUserPhoneNumber() async {
    isLoading = true;
    print(phoneNumber);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber.toString().trim(),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
        isLoading = false;
      },
      verificationFailed: (FirebaseAuthException e) {
        isLoading = false;

        myToast(msg: e.code.toString(), isNegative: true);
      },
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId.value = verificationId;
        isLoading = false;

        Get.to(VerificationScreen());
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        isLoading = true;
      },
    );
  }

  Future registerApi() async {
    isLoading = true;
    update();

    final response = await Http.post(
      Uri.parse(Api.register),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "full_name": fullnameController.text,
        "cpr_number": cprnumberController.text,
        "mobile_number": phoneNumberController.text,
        "password": passwordController.text,
        "confirm_password": confirmpasswordController.text,
      }),
    );
    print(response.body);

    if (response.statusCode == 200) {
      verifyUserPhoneNumber();
      myToast(msg: 'User Added Successfully');
    } else if (response.statusCode == 403) {
      isLoading = false;
      update();
      var data = jsonDecode(response.body.toString());

      (data['errors'] as List)
          .map((e) => myToast(
                msg: e.toString(),
              ))
          .toList();
    } else if (response.statusCode == 400) {
      isLoading = false;
      update();
      var data = jsonDecode(response.body.toString());

      (data['errors'] as List)
          .map((e) => myToast(
                msg: e.toString(),
              ))
          .toList();
      myToast(msg: data);
    }
  }
}
