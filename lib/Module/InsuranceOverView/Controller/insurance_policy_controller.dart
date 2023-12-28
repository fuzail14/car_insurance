import 'dart:convert';

import 'package:car_insurance_app/Module/HomeScreen/View/home_screen.dart';
import 'package:car_insurance_app/Routes/set_routes.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as Http;

import '../../../Constants/api_routes.dart';
import '../../../Constants/constants.dart';
import '../../HomeScreen/Controller/home_screen_controller.dart';

class insurancePolicyController extends GetxController {
  var arguments = Get.arguments;
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  var companyId;
  var companyName;
  var sumInsured;
  var modelYear;
  var make;
  var model;
  var firstRegistrationdate;
  var premiumPrice;
  var motorName;
  var plateNumber;
  var expiryDate;

  var totalpremiumPrice;

  int? userId;
  int vat = 20;
  var argumentIndex0;
  var argumentIndex1;
  bool isLoading = false;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    print('arguments $arguments');
    argumentIndex0 = arguments[0];
    plateNumber = arguments[1];
    expiryDate = arguments[2];
    argumentIndex1 = argumentIndex0[0];
    motorName = argumentIndex0[1];
    premiumPrice = argumentIndex1[1];

    companyId = argumentIndex1[0][0];
    companyName = argumentIndex1[0][1];

    sumInsured = argumentIndex1[0][2];
    modelYear = argumentIndex1[0][3];
    make = argumentIndex1[0][4];
    model = argumentIndex1[0][5];
    firstRegistrationdate = argumentIndex1[0][6];

    String numericString = premiumPrice.replaceAll(RegExp(r'[^0-9]'), '');
    int value = int.parse(numericString);
    totalpremiumPrice = value + vat;
    userId = homeScreenController.person.data!.id;
    print(value);

    print(totalpremiumPrice);

    print(companyId);
    print(companyName);
    print(sumInsured);
    print(modelYear);
    print(make);
    print(model);
    print(firstRegistrationdate);

    print(premiumPrice);

    print(motorName);

    print(plateNumber);
    print(expiryDate);
    print(homeScreenController.person.data!.id);
  }

  Future storeQuote() async {
    isLoading = true;
    update();

    final response = await Http.post(
      Uri.parse(Api.storeQuotes),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "user_id": userId,
        "company_id": companyId,
        "company_name": companyName,
        "sum_insured": sumInsured,
        "model_year": modelYear,
        "make": make,
        "model": model,
        "first_registration_date": firstRegistrationdate,
        "premium_price": premiumPrice,
        "motor_name": motorName,
        "plate_number": plateNumber,
        "expiry_date": expiryDate,
        "total_premium_price": totalpremiumPrice,
      }),
    );
    print(response.body);

    if (response.statusCode == 200) {
      Get.off(HomeScreen(), arguments: homeScreenController.arguments);
      Get.snackbar('Quote', 'Quote Added Successfully');
      myToast(msg: 'Quote Added Successfully');
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
