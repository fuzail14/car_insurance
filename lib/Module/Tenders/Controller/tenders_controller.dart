import 'dart:developer';
import 'package:car_insurance_app/Repo/Tenders%20Repo/tenders_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/Person/person.dart';
import '../../../Data/Api Resp/api_response.dart';
import '../Model/Tender.dart';

class TendersController extends GetxController {
  var arguments = Get.arguments;
  late final Person person;
  var responseStatus = Status.loading;

  final tendersRepository = TendersRepository();
  List<Tenders> tendersList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    person = arguments;

    print(person.Bearer);
    Future.delayed(Duration(milliseconds: 300), () {
      TendersApi(bearerToken: person.Bearer);
    });

    ;
  }

  // ignore: non_constant_identifier_names
  TendersApi({required bearerToken}) {
    setResponseStatus(Status.loading);
    update();

    tendersRepository.TendersResponse(
      bearerToken: bearerToken,
    ).then((value) {
      tendersList.clear();
      update();

      for (int i = 0; i < value.tenders.length; i++) {
        tendersList.add(value.tenders[i]);
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
