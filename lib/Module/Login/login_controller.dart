import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../Constants/Person/person.dart';
import '../../../../Constants/api_routes.dart';
import '../../../../Constants/constants.dart';
import '../../../../Repo/Verification Repository/verification_repository.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Services/Shared Preferences/MySharedPreferences.dart';
import '../HomeScreen/View/home_screen.dart';

class LoginController extends GetxController {
  //final CheckPhoneNumberController checkPhoneNumberController = Get.find();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  String? phoneNum;
  final key = GlobalKey<FormState>();
  bool isLoading = false;
  Person? person;
  final _repository = LoginRepository();
  var isHidden = true;

  @override
  void onInit() {
    super.onInit();
  }

  Future loginApi(String mobileNo, String password) async {
    isLoading = true;

    update();
    Map<String, String> data = {"cpr_number": mobileNo, "password": password};

    _repository.loginApi(data).then((value) async {
      isLoading = false;
      update();
      if (kDebugMode) {
        print("value $value");
        final person = Person.fromJson(value);
        Get.to(HomeScreen(), arguments: person);

        //log(person.toString());
        // MySharedPreferences.setUserData(person: person);

        //Person person2 = await MySharedPreferences.getUserData();

        // Get.offAllNamed(homescreen, arguments: person2);

        Get.snackbar('Login', person.data!.fullName.toString());
      }
    }).onError((error, stackTrace) {
      isLoading = false;
      update();
      Get.snackbar('Error', '$error ', backgroundColor: Colors.white);
      if (kDebugMode) {
        print(error.toString());
        print(stackTrace.toString());
      }
    });
  }

  void togglePasswordView() {
    isHidden = !isHidden;
    update();
  }
}
