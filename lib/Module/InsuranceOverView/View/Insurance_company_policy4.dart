import 'package:car_insurance_app/Constants/Extensions/extensions.dart';
import 'package:car_insurance_app/Module/InsuranceOverView/View/Insurance_company_policy5.dart';
import 'package:car_insurance_app/Module/InsuranceOverView/View/insurance_company_policy1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class InsuranceCompanyPolicy4 extends StatefulWidget {
  const InsuranceCompanyPolicy4({super.key});

  @override
  State<InsuranceCompanyPolicy4> createState() =>
      InsuranceCompanyPolicy4State();
}

class InsuranceCompanyPolicy4State extends State<InsuranceCompanyPolicy4> {
  final List<String> bankItems = [
    "Bank1",
    "Bank2",
  ];

  String bank = "Bank1";
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
        padding: const EdgeInsets.only(left: 23, right: 23),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Spacer(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Heading(title: 'What’s your Bank/Lender name?'),
                    20.ph,
                    Container(
                      width: double.infinity,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: bank,
                        items: bankItems.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          // Handle dropdown item selection if needed
                          bank = newValue!;
                          setState(() {});
                        },
                      ),
                    ),
                    20.ph,
                    MyButton(
                      name: 'Continue',
                      onTap: () {
                        Get.to(InsuranceCompanyPolicy5(), arguments: arguments);
                      },
                    ),
                  ]),
            ),
          )
        ]),
      ),
    );
    ;
  }
}
