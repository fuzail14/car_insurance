import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/Person/person.dart';
import '../../../Constants/api_routes.dart';
import '../../../Routes/set_routes.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';
import 'package:http/http.dart' as Http;

import '../Model/Car.dart';

class HomeScreenController extends GetxController {
  var arguments = Get.arguments;
  late final Person person;
  String appBarDropdownval = 'Profile';
  var appBarDropdownli = ['Profile', 'logout'];
  List<Car> carList = [];
  @override
  void onInit() {
    super.onInit();
    person = arguments;
  }

  Future<Car> getCars({required int userid}) async {
    print('here');
    final response = await Http.get(
      Uri.parse(Api.getCars + "/" + userid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.statusCode);
    print(response.body);

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      print('data $data');
      return Car.fromJson(data);
    }

    return Car.fromJson(data);
  }
}
