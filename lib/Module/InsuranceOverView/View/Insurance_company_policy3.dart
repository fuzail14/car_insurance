import 'package:car_insurance_app/Constants/Extensions/extensions.dart';
import 'package:car_insurance_app/Module/InsuranceOverView/View/Insurance_company_policy4.dart';
import 'package:car_insurance_app/Module/InsuranceOverView/View/insurance_company_policy1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class InsuranceCompanyPolicy3 extends StatefulWidget {
  const InsuranceCompanyPolicy3({super.key});

  @override
  State<InsuranceCompanyPolicy3> createState() =>
      InsuranceCompanyPolicy3State();
}

class InsuranceCompanyPolicy3State extends State<InsuranceCompanyPolicy3> {
  bool yesValue = false;
  bool noValue = false;
  var arguments = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios))),
      body: Padding(
        padding: const EdgeInsets.only(left: 23),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Spacer(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Heading(title: 'Is your car on installments?'),
                    CheckboxListTile(
                      title: Text('Yes'),
                      value: yesValue,
                      onChanged: (newValue) {
                        setState(() {
                          yesValue = newValue ?? false;
                          if (yesValue) {
                            noValue = false;
                          }
                        });
                      },
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                    CheckboxListTile(
                      title: const Text('No'),
                      value: noValue,
                      onChanged: (newValue) {
                        setState(() {
                          noValue = newValue ?? false;
                          if (noValue) {
                            yesValue = false;
                          }
                        });
                      },
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                    20.ph,
                    MyButton(
                      name: 'Continue',
                      onTap: () {
                        Get.to(InsuranceCompanyPolicy4(), arguments: arguments);
                      },
                    ),
                  ]),
            ),
          )
        ]),
      ),
    );
  }
}
