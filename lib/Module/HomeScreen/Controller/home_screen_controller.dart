import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/Person/person.dart';
import '../../../Routes/set_routes.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';

class HomeScreenController extends GetxController {
  var arguments = Get.arguments;
  late final Person person;
  String appBarDropdownval = 'Profile';
  var appBarDropdownli = ['Profile', 'logout'];

  @override
  void onInit() {
    super.onInit();
    person = arguments;
  }
}
