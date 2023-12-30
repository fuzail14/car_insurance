import 'package:car_insurance_app/Constants/Extensions/extensions.dart';
import 'package:car_insurance_app/Module/HomeScreen/Controller/home_screen_controller.dart';
import 'package:car_insurance_app/Module/InsuranceOverView/View/insurance_overview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InsuranceCompaniesPage extends StatelessWidget {
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
        title: Text('Insurance Companies Page'),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Implement filter logic
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          20.ph,
          Expanded(
            child: ListView.builder(
              itemCount: insuranceCompanies.length,
              itemBuilder: (context, index) {
                var company = insuranceCompanies[index];
                return Container(
                    width: 318,
                    height: 180,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(InsuranceOverView(),
                            arguments: insuranceCompanies[index]);
                      },
                      child: Card(
                        color: Colors.white,
                        margin:
                            EdgeInsets.only(left: 16.0, top: 48.0, right: 16),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20, top: 10),
                              child: Image.network(
                                company['logo'],
                                fit: BoxFit.cover,
                                width: 100,
                                height: 100,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 140, top: 20),
                              child: Text(company['name'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 140, top: 50),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(company['description'],
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      )),
                                  5.ph,
                                  Text(company['price'],
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.blue)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
