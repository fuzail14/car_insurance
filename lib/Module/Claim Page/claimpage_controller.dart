import 'dart:convert';

import 'package:car_insurance_app/Module/HomeScreen/View/home_screen.dart';
import 'package:car_insurance_app/Routes/set_routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../Constants/api_routes.dart';
import '../../../Constants/constants.dart';
import '../HomeScreen/Controller/home_screen_controller.dart';

class ClaimController extends GetxController {
  var arguments = Get.arguments;
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  String? driverCpr;
  String? ownerCpr;
  String? insuranceCompanyName;
  String? phoneNumber;
  String? email;
  String? vehcileno;
  String? surveydate;
  String? remarks;
  String? garageName;
  var argument0Index;
  var argument0Index1;
  var userId;
  bool isLoading = false;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    print('arguments $arguments');
    argument0Index = arguments[0];
    garageName = arguments[1];
    print('first $argument0Index');
    print('first $garageName');
    vehcileno = argument0Index[1];

    surveydate = argument0Index[2];

    remarks = argument0Index[3];
    argument0Index1 = argument0Index[0];
    print('second $vehcileno');
    print('second $surveydate');
    print('second $remarks');
    print('second $argument0Index1');
    driverCpr = argument0Index1[0];
    ownerCpr = argument0Index1[1];
    phoneNumber = argument0Index1[2];
    email = argument0Index1[3];
    insuranceCompanyName = argument0Index1[4];

    print('driverCpr $driverCpr');
    print('ownerCpr $ownerCpr');
    print('phoneNumber $phoneNumber');
    print('email $email');
    print('insuranceCompanyName $insuranceCompanyName');
    userId = homeScreenController.person.data!.id;

    print(homeScreenController.person.data!.id);
  }

  Future storeClaim() async {
    isLoading = true;
    update();

    final response = await Http.post(
      Uri.parse(Api.storeClaims),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "user_id": userId,
        "driver_cpr": driverCpr,
        "insurance_company": insuranceCompanyName,
        "owner_cpr": ownerCpr,
        "phone_number": phoneNumber,
        "email": email,
        "vehcileno": vehcileno,
        "surveydate": surveydate,
        "remarks": remarks,
        "garage_name": garageName,
      }),
    );
    print(response.body);

    if (response.statusCode == 200) {
      Get.off(HomeScreen(), arguments: homeScreenController.arguments);
      Get.snackbar('Claim', 'Claim Added Successfully');
      myToast(msg: 'Claim Added Successfully');
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
