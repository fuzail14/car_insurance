import 'package:car_insurance_app/Constants/Extensions/extensions.dart';
import 'package:car_insurance_app/Module/InsuranceOverView/View/Insurance_company_policy2.dart';
import 'package:car_insurance_app/Module/InsuranceOverView/View/Insurance_company_policy3.dart';
import 'package:car_insurance_app/Module/InsuranceOverView/View/Insurance_company_policy4.dart';
import 'package:car_insurance_app/Module/InsuranceOverView/View/insurance_company_policy1.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../Widgets/My TextForm Field/my_textform_field.dart';
import '../../HomeScreen/Controller/home_screen_controller.dart';
import '../Controller/insurance_policy_controller.dart';

class InsuranceCompanyPolicy5 extends StatefulWidget {
  const InsuranceCompanyPolicy5({super.key});

  @override
  State<InsuranceCompanyPolicy5> createState() =>
      _InsuranceCompanyPolicy5State();
}

class _InsuranceCompanyPolicy5State extends State<InsuranceCompanyPolicy5> {
  // final motorController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<insurancePolicyController>(
        init: insurancePolicyController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
                leading: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back_ios))),
            body: Padding(
              padding: const EdgeInsets.only(left: 23),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Heading(title: 'Your Premium'),
                    20.ph,
                    const SubHeading(
                      title: 'Motor',
                    ),
                    20.ph,
                    // TextField(
                    //     //controller: insuranceCompanyPolicy1State.motorController,

                    //     ),
                    Container(
                      width: 300,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: HexColor('#BDBDBD'))),
                      child: Center(child: Text(controller.motorName)),
                    ),
                    40.ph,
                    CustomText(
                      title: "Sum Insured",
                      text: controller.sumInsured.toString(),
                    ),
                    20.ph,
                    CustomText(
                      title: "Premium",
                      text: controller.premiumPrice.toString(),
                    ),
                    20.ph,
                    CustomText(
                      title: "VAT(10%)",
                      text: "BD 20.00",
                    ),
                    40.ph,
                    Container(
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Premium',
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "BD ${controller.totalpremiumPrice}",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                    Spacer(
                      flex: 5,
                    ),
                    MyButton(
                      name: "Proceed to Pay",
                      onTap: () {
                        controller.storeQuote();
                        // Get.toNamed(claimPage);
                      },
                    ),
                    Spacer(
                      flex: 1,
                    ),
                  ]),
            ),
          );
        });
  }
}

class CustomText extends StatelessWidget {
  final String? title;
  final String? text;
  const CustomText({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            text!,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
