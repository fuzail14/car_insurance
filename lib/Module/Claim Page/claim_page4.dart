import 'package:car_insurance_app/Constants/Extensions/extensions.dart';
import 'package:car_insurance_app/Module/Claim%20Page/claim_page5.dart';
import 'package:car_insurance_app/Module/InsuranceOverView/View/Insurance_company_policy4.dart';
import 'package:car_insurance_app/Module/InsuranceOverView/View/insurance_company_policy1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Constants/constants.dart';

class ClaimPage4 extends StatefulWidget {
  const ClaimPage4({super.key});

  @override
  State<ClaimPage4> createState() => ClaimPage4State();
}

class ClaimPage4State extends State<ClaimPage4> {
  bool yesValue = false;
  bool noValue = false;
  bool repairhecked = false;
  bool cashhecked = false;

  var arguments = Get.arguments;
  String? repairVal;
  String? cashVal;

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
                    const Heading(
                        title: 'How would you like to proceed with the claim?'),
                    20.ph,
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: primaryColor)),
                      child: CheckboxListTile(
                        title: Text('Repair'),
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
                    ),
                    40.ph,
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: primaryColor)),
                      child: CheckboxListTile(
                        title: const Text('Cash'),
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
                    ),
                    20.ph,
                    MyButton(
                      name: 'Continue',
                      onTap: () {
                        Get.to(ClaimPage5());
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
