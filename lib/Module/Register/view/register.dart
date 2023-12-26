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
import '../controller/register_controller.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool checkboxVal = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
        init: RegisterController(),
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
                          Text('by creating a free account.',
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
                                  controller: controller.fullnameController,

                                  hintText: 'Enter Full Name',

                                  labelText: 'Full Name',
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
                                  controller: controller.cprnumberController,

                                  hintText: 'Enter CPR Number',

                                  labelText: 'CPR Number',
                                  labelTextColor: HexColor('#75788D'),
                                  fillColor: Color(0x33c4c4c4),

                                  suffixIcon: Icon(Icons.message,
                                      color: HexColor(
                                          '#75788D')), // Add an email icon
                                ),
                                20.ph,
                                MyTextFormField(
                                  //validator: validatePhoneNumber,
                                  controller: controller.phoneNumberController,
                                  textInputType: TextInputType.number,
                                  hintText: 'Phone Number',
                                  labelText: 'Phone Number',
                                  labelTextColor: HexColor('#75788D'),
                                  fillColor: HexColor('#FFFFFF'),
                                  prefixIcon: Container(
                                    height: 52.h,
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          bottomLeft: Radius.circular(10.0),
                                        ),
                                        border: Border.all(
                                            color: HexColor('#EFEFEF'))),
                                    child: GestureDetector(
                                        onTap: () {
                                          showCountryPicker(
                                              context: context,
                                              countryListTheme:
                                                  CountryListThemeData(
                                                flagSize: 30,
                                                backgroundColor: Colors.white,
                                                textStyle:
                                                    GoogleFonts.montserrat(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                ),
                                                bottomSheetHeight: 500,
                                                // Optional. Country list modal height
                                                //Optional. Sets the border radius for the bottomsheet.
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(12.0),
                                                  topRight:
                                                      Radius.circular(12.0),
                                                ),
                                                //Optional. Styles the search field.
                                                inputDecoration:
                                                    InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: primaryColor,
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: primaryColor,
                                                    ),
                                                  ),
                                                  labelStyle:
                                                      GoogleFonts.montserrat(
                                                    color: HexColor('#B6B6B6'),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                  ),
                                                  labelText: 'Search',
                                                  hintText:
                                                      'Start typing to search',
                                                  prefixIcon: Icon(
                                                    Icons.search,
                                                    color: primaryColor,
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: primaryColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              onSelect: (Country country) {
                                                controller.countryFlag.value =
                                                    country.flagEmoji;
                                                controller.countryCode.value =
                                                    country.phoneCode;
                                              });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 16, 8, 0),
                                          child: Obx(() {
                                            return Text(
                                              "${controller.countryFlag} + ${controller.countryCode}",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                              ),
                                            );
                                          }),
                                        )),
                                  ),
                                ),
                                20.ph,
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
                                MyTextFormField(
                                  padding: EdgeInsets.all(0),
                                  validator: emptyStringValidator,
                                  controller:
                                      controller.confirmpasswordController,
                                  hintText: 'Enter Confirm Password',
                                  labelText: 'Confirm Password',
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
                                    Text(
                                      'By checking the box you agree to our Terms ',
                                      style: TextStyle(
                                          fontSize: 9,
                                          fontWeight: FontWeight.w400,
                                          color: HexColor('#252525')),
                                    ),
                                    0.pw,
                                    Text(
                                      'Conditions.',
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
                                  name: 'Next >',
                                  onPressed: () {
                                    if (controller.key.currentState!
                                        .validate()) {
                                      controller.registerApi();
                                      controller.phoneNumber.value =
                                          "+${controller.countryCode}${controller.phoneNumberController.text}";

                                      if (!controller.isLoading) {
                                        print(controller.phoneNumber.value);
                                      }
                                    }
                                  },
                                ),
                                20.ph,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Already registered? ',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: HexColor('#252525'))),
                                    TextButton(
                                        onPressed: () {
                                          Get.to(LoginScreen());
                                        },
                                        child: Text(
                                          'Login',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: HexColor('#155D93')),
                                        )),
                                  ],
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
