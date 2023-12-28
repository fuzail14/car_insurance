import 'package:car_insurance_app/Constants/Extensions/extensions.dart';
import 'package:car_insurance_app/Module/Claim%20Page/claim_page4.dart';
import 'package:car_insurance_app/Module/InsuranceOverView/View/insurance_company_policy1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../Widgets/My TextForm Field/my_textform_field.dart';

class ClaimPage3 extends StatefulWidget {
  const ClaimPage3({super.key});

  @override
  State<ClaimPage3> createState() => _ClaimPage3State();
}

class _ClaimPage3State extends State<ClaimPage3> {
  var surveyDate;
  final TextEditingController surveyDateController = TextEditingController();

  Future surveyDatePick(context) async {
    DateTime? picked = await showDatePicker(
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2030),
        context: context);
    if (picked != null) {
      picked.toString();
      surveyDateController.text = picked.toString().split(' ')[0];
      setState(() {});
    } else {
      surveyDateController.text = DateTime.now().toString().split(' ')[0];
      setState(() {});
    }
  }

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              14.ph,
              const Heading(
                title: 'Tell us more about your incident',
              ),
              14.ph,
              const SubHeading(
                title: 'Vechile No',
              ),
              5.ph,
              MyTextFormField(
                hintText: '',
              ),
              14.ph,
              const SubHeading(title: "Preferred Date to survey the car"),
              5.ph,
              MyTextFormField(
                controller: surveyDateController,
                hintText: '',
                readOnly: true,
                onTap: () {
                  surveyDatePick(context);
                },
              ),
              14.ph,
              const SubHeading(
                title: 'Remarks',
              ),
              5.ph,
              MyTextFormField(
                maxLines: 4,
                hintText: '',
              ),
              40.ph,
              MyButton(
                name: 'Continue',
                onTap: () {
                  Get.to(ClaimPage4());
                },
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
