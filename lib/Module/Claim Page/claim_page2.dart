import 'package:car_insurance_app/Constants/Extensions/extensions.dart';
import 'package:car_insurance_app/Module/Claim%20Page/claim_page3.dart';
import 'package:car_insurance_app/Module/InsuranceOverView/View/insurance_company_policy1.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Widgets/My TextForm Field/my_textform_field.dart';

class ClaimPage2 extends StatefulWidget {
  const ClaimPage2({super.key});

  @override
  State<ClaimPage2> createState() => _ClaimPage2State();
}

class _ClaimPage2State extends State<ClaimPage2> {
  String? selectedCompanyName;
  final List<Map<String, dynamic>> insuranceCompanies = [
    {
      'id': 1,
      'logo':
          'https://dhow.com/wp-content/uploads/2017/12/Solidarity-Bahrain-assigned-FSR-rating.jpg',
      'name': 'Solidarity Insurance B.S.C',
      'description': 'Find coverage that’s right for you!',
      'price': 'BD 170/year',
    },
    {
      'id': 2,
      'logo':
          'https://www.atlas-mag.net/sites/default/files/images/AtlasMagazine_2021-10-No184/Fb/GIG.png',
      'name': 'Gulf Insurance Group',
      'description': 'Ensuring your future dreams',
      'price': 'BD 200/year',
    },
    {
      'id': 3,
      'logo':
          'https://www.atlas-mag.net/sites/default/files/images/AtlasMagazine_2022-11-No195/Images/snic.jpg',
      'name': 'SNIC Insurance',
      'description': 'Your Journey, Our Worry',
      'price': 'BD 180/year',
    },
    {
      'id': 4,
      'logo':
          'https://maroonfrog.com/projects/INH_Old/wp-content/uploads/2017/10/bni.jpg',
      'name': 'Bahrain National Insurance',
      'description': 'Your car’s caretaker!',
      'price': 'BD 200/year',
    },
    // Add more insurance companies here
  ];

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
                title: 'Driver CPR',
              ),
              5.ph,
              MyTextFormField(
                hintText: '',
                labelText: '',
              ),
              14.ph,
              const SubHeading(
                title: 'Owner CPR',
              ),
              5.ph,
              MyTextFormField(
                hintText: '',
              ),
              20.ph,
              const SubHeading(
                title: 'Insurance Company',
              ),
              5.ph,
              Container(
                width: 300,
                height: 65,
                margin: EdgeInsets.only(left: 50, right: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: HexColor('#EEEEEE'),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButtonFormField<String>(
                    value: selectedCompanyName,
                    hint: Text('Select Insurance Company'),
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: HexColor('#EEEEEE'),
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCompanyName = newValue;
                      });
                    },
                    items: insuranceCompanies.map<DropdownMenuItem<String>>(
                        (Map<String, dynamic> company) {
                      return DropdownMenuItem<String>(
                        value: company['name'].toString(),
                        child: Text(company['name']),
                      );
                    }).toList(),
                  ),
                ),
              ),
              14.ph,
              const SubHeading(
                title: 'Phone Number',
              ),
              5.ph,
              MyTextFormField(
                hintText: '',
                textInputType: TextInputType.number,
              ),
              14.ph,
              const SubHeading(
                title: 'Email',
              ),
              5.ph,
              MyTextFormField(
                suffixIcon: Icon(Icons.email_outlined),
                hintText: '',
                textInputType: TextInputType.number,
              ),
              40.ph,
              MyButton(
                name: 'Continue',
                onTap: () {
                  Get.to(ClaimPage3());
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
