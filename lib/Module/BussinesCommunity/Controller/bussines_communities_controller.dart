import 'dart:developer';
import 'package:car_insurance_app/Module/BussinesCommunity/Model/BussinesCommunity.dart';
import 'package:car_insurance_app/Repo/Bussines%20Communities%20Repository/bussines_communities_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/Person/person.dart';
import '../../../Data/Api Resp/api_response.dart';

class BussinesCommunitiesController extends GetxController {
  var arguments = Get.arguments;
  late final Person person;
  var responseStatus = Status.loading;

  final bussinesCommunitiesRepo = BussinessCommunitiesRepository();
  List<Companies> companiesApiList = [];

  var secondFilterList = ['Buyer', 'Supplier', 'Service Provider'];

  var secondFilterval = 'Buyer';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    person = arguments;

    print(person.Bearer);
    Future.delayed(Duration(milliseconds: 300), () {
      BussinesCommunitiesViewApi(bearerToken: person.Bearer);
    });

    // BussinesCommunitiesViewApi(bearerToken: person.Bearer);
  }

  // ignore: non_constant_identifier_names
  BussinesCommunitiesViewApi({required bearerToken}) {
    setResponseStatus(Status.loading);
    update();

    bussinesCommunitiesRepo
        .bussinesCommunitiesViewApi(
      bearerToken: bearerToken,
    )
        .then((value) {
      companiesApiList.clear();
      update();

      for (int i = 0; i < value.companies.length; i++) {
        companiesApiList.add(value.companies[i]);
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

  // ignore: non_constant_identifier_names
  CompanyBussinesFilterApi({
    String? bussinestype,
  }) {
    companiesApiList.clear();

    bussinesCommunitiesRepo
        .bussinesTypeFilterApi(
      type: bussinestype,
      bearerToken: person.Bearer,
    )
        .then((value) {
      Status.completed;

      for (int i = 0; i < value.companies.length; i++) {
        companiesApiList.add(value.companies[i]);
      }
      update();
    }).onError((error, stackTrace) {
      setResponseStatus(Status.error);

      Get.snackbar('Error', '$error ', backgroundColor: Colors.white);
      log(error.toString());
      log(stackTrace.toString());
    });
  }

  // ignore: non_constant_identifier_names
  BussinesCommunityIsicFilterApi({
    String? type,
  }) {
    companiesApiList.clear();

    bussinesCommunitiesRepo
        .bussinesCommunityIsicFilterApi(
      type: type,
      bearerToken: person.Bearer,
    )
        .then((value) {
      Status.completed;

      for (int i = 0; i < value.companies.length; i++) {
        companiesApiList.add(value.companies[i]);
      }
      update();
    }).onError((error, stackTrace) {
      setResponseStatus(Status.error);

      Get.snackbar('Error', '$error ', backgroundColor: Colors.white);
      log(error.toString());
      log(stackTrace.toString());
    });
  }
}
