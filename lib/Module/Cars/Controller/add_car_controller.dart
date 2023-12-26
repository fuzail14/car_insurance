import 'dart:convert';
import 'dart:developer';

import 'package:car_insurance_app/Module/HomeScreen/View/home_screen.dart';
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

class AddCarController extends GetxController {
  //final CheckPhoneNumberController checkPhoneNumberController = Get.find();
  var id = Get.arguments;
  final carNameController = TextEditingController();
  final carModelController = TextEditingController();
  final carNumberController = TextEditingController();

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

  void togglePasswordView() {
    isHidden = !isHidden;
    update();
  }

  Future addCarApi() async {
    isLoading = true;
    update();

    final response = await Http.post(
      Uri.parse(Api.cars),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'user_id': id,
        "car_name": carNameController.text,
        "car_model": carModelController.text,
        "car_number": carNumberController.text,
      }),
    );
    print(response.body);

    if (response.statusCode == 200) {
      Get.off(HomeScreen());
      myToast(msg: 'Car Added Successfully');
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
