import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/Person/person.dart';
import '../../../Data/Api Resp/api_response.dart';
import '../../../Repo/Bussines For Sale Repo/sale_bussines_repository.dart';
import '../Model/SaleBussines.dart';

class BussinesForSaleController extends GetxController {
  var arguments = Get.arguments;
  late final Person person;
  var responseStatus = Status.loading;

  final saleBussinesRepository = SaleBussinesRepository();
  List<Businesses> salebussinesList = [];
  List<Companies> CompaniesList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    person = arguments;

    print(person.Bearer);
    Future.delayed(Duration(milliseconds: 300), () {
      BussinesForSaleApi(bearerToken: person.Bearer);
    });

    ;
  }

  // ignore: non_constant_identifier_names
  BussinesForSaleApi({required bearerToken}) {
    setResponseStatus(Status.loading);
    update();

    saleBussinesRepository.BussinesForSaleResponse(
      bearerToken: bearerToken,
    ).then((value) {
      salebussinesList.clear();
      update();

      for (int i = 0; i < value.businesses.length; i++) {
        salebussinesList.add(value.businesses[i]);
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
