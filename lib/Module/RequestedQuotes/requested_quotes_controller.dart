import 'dart:convert';

import 'package:car_insurance_app/Module/RequestedQuotes/Quote.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/Person/person.dart';
import '../../../Constants/api_routes.dart';
import '../../../Routes/set_routes.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';
import 'package:http/http.dart' as Http;

import '../HomeScreen/Controller/home_screen_controller.dart';

class RequestQouteController extends GetxController {
  var arguments = Get.arguments;
  int? id;
  @override
  void onInit() {
    super.onInit();
    id = arguments;
  }

  Future<Quote> getQuotes({required int userid}) async {
    print('here');
    final response = await Http.get(
      Uri.parse(Api.getQuotes + "/" + userid.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(response.statusCode);
    print(response.body);

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      print('data $data');
      return Quote.fromJson(data);
    }

    return Quote.fromJson(data);
  }
}
