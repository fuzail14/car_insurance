import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/Person/person.dart';
import '../../../Data/Api Resp/api_response.dart';
import '../../../Repo/Online Store Repository/online_store_repository.dart';
import '../Model/Product.dart';

class OnlineStoreController extends GetxController {
  var arguments = Get.arguments;
  late final Person person;
  var responseStatus = Status.loading;

  final onlineStoreRepo = OnlineStoreRepository();
  List<Products> productsApiList = [];
  List<Companies> productsCompaniesApiList = [];

  var secondFilterList = ['Buyer', 'Supplier', 'Service Provider'];

  var secondFilterval = 'Buyer';

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    person = arguments;

    print(person.Bearer);
    Future.delayed(Duration(milliseconds: 300), () {
      OnlineStoreViewApi(bearerToken: person.Bearer);
    });

    // BussinesCommunitiesViewApi(bearerToken: person.Bearer);
  }

  // ignore: non_constant_identifier_names
  OnlineStoreViewApi({required bearerToken}) {
    setResponseStatus(Status.loading);
    update();

    onlineStoreRepo
        .onlineStoreViewApi(
      bearerToken: bearerToken,
    )
        .then((value) {
      productsApiList.clear();
      update();

      for (int i = 0; i < value.products.length; i++) {
        productsApiList.add(value.products[i]);
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

  Rating(val) {}

  // ignore: non_constant_identifier_names
  // CompanyBussinesFilterApi({
  //   String? bussinestype,
  // }) {
  //   companiesApiList.clear();

  //   onlineStoreRepo
  //       .bussinesTypeFilterApi(
  //     type: bussinestype,
  //     bearerToken: person.Bearer,
  //   )
  //       .then((value) {
  //     Status.completed;

  //     for (int i = 0; i < value.products.length; i++) {
  //       companiesApiList.add(value.products[i]);
  //     }
  //     update();
  //   }).onError((error, stackTrace) {
  //     setResponseStatus(Status.error);

  //     Get.snackbar('Error', '$error ', backgroundColor: Colors.white);
  //     log(error.toString());
  //     log(stackTrace.toString());
  //   });
  // }

  // // ignore: non_constant_identifier_names
  // BussinesCommunityIsicFilterApi({
  //   String? type,
  // }) {
  //   companiesApiList.clear();

  //   onlineStoreRepo
  //       .bussinesCommunityIsicFilterApi(
  //     type: type,
  //     bearerToken: person.Bearer,
  //   )
  //       .then((value) {
  //     Status.completed;

  //     for (int i = 0; i < value.companies.length; i++) {
  //       companiesApiList.add(value.companies[i]);
  //     }
  //     update();
  //   }).onError((error, stackTrace) {
  //     setResponseStatus(Status.error);

  //     Get.snackbar('Error', '$error ', backgroundColor: Colors.white);
  //     log(error.toString());
  //     log(stackTrace.toString());
  //   });
  // }
}
