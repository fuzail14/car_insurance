import 'package:car_insurance_app/Constants/Extensions/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:car_insurance_app/Module/Verification/Password/Controller/password_controller.dart';

import 'package:car_insurance_app/Widgets/My%20TextForm%20Field/my_textform_field.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../Constants/constants.dart';
import '../../../../Widgets/My Button/my_button.dart';
import '../login_controller.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>();
  bool checkboxVal = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: Material(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 22),
                    child: Column(
                      children: [
                        20.ph,
                        Image.asset(
                          'assets/images/slide.png',
                        ),
                        71.ph,
                        Text('Welcome back',
                            style: TextStyle(
                              fontSize: 24,
                              color: HexColor('#252525'),
                              fontWeight: FontWeight.w500,
                            )),
                        Text('sign in to access your account',
                            style: TextStyle(
                              fontSize: 14,
                              color: HexColor('#252525'),
                              fontWeight: FontWeight.w300,
                            )),
                        95.ph,
                        Form(
                          key: _key,
                          child: Padding(
                            padding: EdgeInsets.only(left: 30).r,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'CPR Number',
                                  style: GoogleFonts.poppins(
                                    color: HexColor('#868686'),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                10.ph,
                                MyTextFormField(
                                  padding: EdgeInsets.all(0),
                                  validator: emptyStringValidator,
                                  controller: controller.phoneController,

                                  hintText: 'Enter CPR Number',

                                  labelText: 'CPR Number',
                                  labelTextColor: HexColor('#75788D'),
                                  fillColor: Color(0x33c4c4c4),

                                  suffixIcon: Icon(Icons.message,
                                      color: HexColor(
                                          '#75788D')), // Add an email icon
                                ),
                                35.ph,
                                Text(
                                  'Password',
                                  style: GoogleFonts.poppins(
                                    color: HexColor('#868686'),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                10.ph,
                                MyTextFormField(
                                  padding: EdgeInsets.all(0),
                                  validator: emptyStringValidator,
                                  controller: controller.passwordController,
                                  hintText: 'Enter Password',
                                  labelText: 'Password',
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
                                20.ph,
                                Row(
                                  children: [
                                    Checkbox(
                                        value: checkboxVal,
                                        onChanged: (value) {
                                          checkboxVal = value!;
                                          setState(() {});
                                        }),
                                    Text('Remeber me'),
                                    100.pw,
                                    Text(
                                      'Forgot password?',
                                      style: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w400,
                                          color: HexColor('#155D93')),
                                    ),
                                  ],
                                ),
                                50.ph,
                                MyButton(
                                  loading: controller.isLoading,
                                  width: 286.w,
                                  height: 50.h,
                                  color: HexColor('#155D93'),
                                  name: 'Submit',
                                  onPressed: () {
                                    if (_key.currentState!.validate()) {
                                      controller.loginApi(controller.phoneNum!,
                                          controller.passwordController.text);
                                    }
                                  },
                                ),
                                20.ph,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('New Member? ',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: HexColor('#252525'))),
                                    Text(
                                      'Register Know',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: HexColor('#155D93')),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
