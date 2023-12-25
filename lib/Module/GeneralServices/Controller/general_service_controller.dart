import 'dart:developer';
import 'package:car_insurance_app/Repo/Tenders%20Repo/tenders_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/Person/person.dart';
import '../../../Data/Api Resp/api_response.dart';
import '../../../Repo/General Service Repo/general_service_repository.dart';
import '../Model/GeneralService.dart';

class GeneralServiceController extends GetxController {
  var arguments = Get.arguments;
  late final Person person;
  var responseStatus = Status.loading;

  final generalServiceRepository = GeneralServiceRepository();
  List<Services> servicesList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    person = arguments;

    print(person.Bearer);
    Future.delayed(Duration(milliseconds: 300), () {
      GeneralServicesApi(bearerToken: person.Bearer);
    });

    ;
  }

  // ignore: non_constant_identifier_names
  GeneralServicesApi({required bearerToken}) {
    setResponseStatus(Status.loading);
    update();

    generalServiceRepository.ServicesResponse(
      bearerToken: bearerToken,
    ).then((value) {
      servicesList.clear();
      update();

      for (int i = 0; i < value.services.length; i++) {
        servicesList.add(value.services[i]);
      }

      setResponseStatus(Status.completed);
      update();
    }).onError((error, stackTrace) {
      setResponseStatus(Status.error);

      Get.snackbar('Error', '$error ', backgroundColor: Colors.white);
      log(error.toString());
      log(stackTrace.toString());
    });
  }

  setResponseStatus(Status val) {
    responseStatus = val;
    update();

    return responseStatus;
  }
}
