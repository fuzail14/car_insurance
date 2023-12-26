import 'package:auto_size_text/auto_size_text.dart';
import 'package:car_insurance_app/Constants/Extensions/extensions.dart';
import 'package:car_insurance_app/Module/HomeScreen/View/home_screen.dart';
import 'package:car_insurance_app/Module/InsuranceOverView/Controller/insurance_overview_controller.dart';
import 'package:car_insurance_app/Module/InsuranceOverView/View/insurance_policy_screen.dart';
import 'package:car_insurance_app/Widgets/My%20Button/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class InsuranceOverView extends StatefulWidget {
  const InsuranceOverView({super.key});

  @override
  State<InsuranceOverView> createState() => _InsuranceOverViewState();
}

class _InsuranceOverViewState extends State<InsuranceOverView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InsuranceOverviewController>(
        init: InsuranceOverviewController(),
        builder: (controller) {
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 370,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      color: Color(0xffe6edf2)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, top: 49),
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 63),
                        child: AutoSizeText(controller.data['name'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 31.42242431640625,
                                fontWeight: FontWeight.w500,
                                color: HexColor('#165E93'))),
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20, top: 63),
                            child: AutoSizeText('Starting At',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20, top: 93),
                            child: AutoSizeText(controller.data['price'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: HexColor('#165E93'))),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 220, top: 23),
                            child: Image.network(
                              controller.data['logo'],
                              width: 140.00001525878906,
                              height: 135.00001525878906,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                26.ph,
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: AutoSizeText('Overview',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: HexColor('#165E93'))),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 50, top: 20, right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.account_balance_wallet_rounded,
                            color: HexColor('#155D93'),
                          ),
                          17.ph,
                          AutoSizeText('Seamless Claims',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: HexColor('#000000'))),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.line_axis_outlined,
                            color: HexColor('#155D93'),
                          ),
                          17.ph,
                          AutoSizeText('Quick Renewal',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: HexColor('#000000'))),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.account_balance_wallet_rounded,
                            color: HexColor('#155D93'),
                          ),
                          17.ph,
                          AutoSizeText('Hassle-free Insurance',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: HexColor('#000000'))),
                        ],
                      ),
                    ],
                  ),
                ),
                83.ph,
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: AutoSizeText('About',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: HexColor('#000000'))),
                ),
                20.ph,
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: AutoSizeText(
                      'Solidarity Bahrain B.S.C  has been a leading force in Bahrains insurance sector since 1976. Solidarity Bahrain known for ethical practices, a diverse product range, innovative customer service, and seamlessly combines human touch with advanced Insurance Technology solutions.',
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: HexColor('#000000'))),
                ),
                50.ph,
                GestureDetector(
                  onTap: () {
                    Get.to(InsuranceCompanyPolicyScreen());
                  },
                  child: Center(
                    child: Container(
                      child: Center(
                          child: Text('Get A Quote',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white))),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: HexColor('#175E94'),
                      ),
                      width: 297.1662902832031,
                      height: 48.48029708862305,
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
