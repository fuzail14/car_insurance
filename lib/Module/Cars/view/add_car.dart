import 'package:car_insurance_app/Constants/Extensions/extensions.dart';
import 'package:car_insurance_app/Module/Login/View/login_screen.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:car_insurance_app/Widgets/My%20TextForm%20Field/my_textform_field.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../Constants/constants.dart';
import '../../../../Widgets/My Button/my_button.dart';
import '../Controller/add_car_controller.dart';

class AddCarScreen extends StatefulWidget {
  AddCarScreen({super.key});

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  bool checkboxVal = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCarController>(
        init: AddCarController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: Material(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 22),
                    child: Form(
                      key: controller.key,
                      child: Column(
                        children: [
                          20.ph,
                          Image.asset(
                            'assets/images/slide.png',
                          ),
                          49.ph,
                          Text('Get Started',
                              style: TextStyle(
                                fontSize: 36,
                                color: HexColor('#252525'),
                                fontWeight: FontWeight.w500,
                              )),
                          Text('Add New Car.',
                              style: TextStyle(
                                fontSize: 14,
                                color: HexColor('#252525'),
                                fontWeight: FontWeight.w300,
                              )),
                          35.ph,
                          Padding(
                            padding: EdgeInsets.only(left: 30).r,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                MyTextFormField(
                                  padding: EdgeInsets.all(0),
                                  validator: emptyStringValidator,
                                  controller: controller.carNameController,

                                  hintText: 'Car Name',

                                  labelText: 'Car Name',
                                  labelTextColor: HexColor('#75788D'),
                                  fillColor: Color(0x33c4c4c4),

                                  suffixIcon: Icon(Icons.person,
                                      color: HexColor(
                                          '#75788D')), // Add an email icon
                                ),
                                20.ph,
                                MyTextFormField(
                                  padding: EdgeInsets.all(0),
                                  validator: emptyStringValidator,
                                  controller: controller.carModelController,

                                  hintText: 'Enter Model Number',

                                  labelText: 'Model Number',
                                  labelTextColor: HexColor('#75788D'),
                                  fillColor: Color(0x33c4c4c4),

                                  suffixIcon: Icon(Icons.message,
                                      color: HexColor(
                                          '#75788D')), // Add an email icon
                                ),
                                20.ph,
                                MyTextFormField(
                                  padding: EdgeInsets.all(0),
                                  validator: emptyStringValidator,
                                  controller: controller.carNumberController,
                                  hintText: 'Enter Car Number',
                                  labelText: 'Car Number',
                                  labelTextColor: HexColor('#75788D'),
                                  fillColor: Color(0x33c4c4c4),
                                  obscureText:
                                      controller.isHidden ? false : true,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      controller.togglePasswordView();
                                    },
                                    child: Icon(
                                      controller.isHidden
                                          ? Icons.lock
                                          : Icons.visibility_off,
                                      color: HexColor('#75788D'),
                                    ),
                                  ),
                                ),
                                50.ph,
                                MyButton(
                                  loading: controller.isLoading,
                                  width: 286.w,
                                  height: 50.h,
                                  color: HexColor('#155D93'),
                                  name: 'Next >',
                                  onPressed: () {
                                    if (controller.key.currentState!
                                        .validate()) {
                                      controller.addCarApi();
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
