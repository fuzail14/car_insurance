import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Constants/Person/person.dart';
import '../../../Data/Api Resp/api_response.dart';
import '../../../Repo/InvestMent Opportunity Repo/investment_opportunity_repository.dart';
import '../Model/InvestMentOpportunity.dart';

class InvestMentOpportunityController extends GetxController {
  var arguments = Get.arguments;
  late final Person person;
  var responseStatus = Status.loading;
  final investMentOpportunityRepository = InvestMentOpportunityRepository();
  List<Investments> investmentsList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    person = arguments;

    Future.delayed(Duration(milliseconds: 300), () {
      InvestMentOpportunityApi(bearerToken: person.Bearer);
    });

    ;
  }

  // ignore: non_constant_identifier_names
  InvestMentOpportunityApi({required bearerToken}) {
    setResponseStatus(Status.loading);
    update();

    investMentOpportunityRepository.InvestMentOpportunityResponse(
      bearerToken: bearerToken,
    ).then((value) {
      investmentsList.clear();
      update();

      for (int i = 0; i < value.investments.length; i++) {
        investmentsList.add(value.investments[i]);
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
