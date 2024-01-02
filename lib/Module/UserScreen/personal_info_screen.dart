import 'package:car_insurance_app/Constants/Extensions/extensions.dart';
import 'package:car_insurance_app/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../HomeScreen/Controller/home_screen_controller.dart';

class PersonalInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
        init: HomeScreenController(),
        builder: (controller) {
          return Scaffold(
            appBar: MyAppBar(
              title: 'Personal Info',
            ),
            body: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User Id',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        20.ph,
                        Text(
                          controller.person.data!.id.toString(),
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 20.0,
                          ),
                        ),
                        Divider(color: Colors.grey),
                        20.ph,
                        Text(
                          'Name',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        20.ph,
                        Text(
                          controller.person.data!.fullName,
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 20.0,
                          ),
                        ),
                        Divider(color: Colors.grey),
                        20.ph,
                        Text(
                          'Mobile Number',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        20.ph,
                        Text(
                          controller.person.data!.mobileNumber,
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 20.0,
                          ),
                        ),
                        Divider(color: Colors.grey),
                        20.ph,
                        Text(
                          'Cpr Number',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        20.ph,
                        Text(
                          controller.person.data!.cprNumber,
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 20.0,
                          ),
                        ),
                        Divider(color: Colors.grey),
                      ]),
                ),
              ),
            ),
          );
        });
  }
}
