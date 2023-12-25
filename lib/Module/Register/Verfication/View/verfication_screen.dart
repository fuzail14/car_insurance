import 'package:car_insurance_app/Constants/Extensions/extensions.dart';
import 'package:car_insurance_app/Module/Register/Verfication/Controller/verfication_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pinput/pinput.dart';

import '../../../../Constants/constants.dart';
import '../../../../Widgets/My Button/my_button.dart';
import '../../controller/register_controller.dart';

class VerificationScreen extends StatelessWidget {
  final verificationCodeController = Get.put(VerificationController());

  final registerController = Get.put(RegisterController());
  VerificationScreen({super.key});

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 80, left: 21),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Almost there ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    )),
                26.ph,
                Text(
                    'Please enter the 6-digit code sent to your phone number ${registerController.phoneNumberController.text} for verification.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    )),
                Form(
                  key: _key,
                  child: Padding(
                    padding: EdgeInsets.only(top: 50.h, left: 40),
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.poppins(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(
                                    0, 0, 0, 0.4) // Default text color
                                ),
                            children: <TextSpan>[
                              TextSpan(text: "Code sent via SMS to "),
                              TextSpan(
                                text: "${registerController.phoneNumber}",
                                style: TextStyle(
                                    color: Color.fromRGBO(133, 24, 255,
                                        0.65) // Dynamic number color
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Pinput(
                            validator: otpValidator,
                            length: 6,
                            controller:
                                verificationCodeController.otpCodeController,
                            onCompleted: (val) {
                              verificationCodeController.otpCode.value = val;
                            },
                            pinAnimationType: PinAnimationType.fade,
                            defaultPinTheme: PinTheme(
                              width: 36,
                              height: 36,
                              textStyle: GoogleFonts.poppins(
                                color: HexColor('#000000'),
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0x33c4c4c4),
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                            ),
                            focusedPinTheme: PinTheme(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(133, 24, 255, 1)),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            submittedPinTheme: PinTheme(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(133, 24, 255, 1)),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                          ),
                        ),
                        40.ph,
                        Obx(() {
                          return MyButton(
                            width: 295,
                            height: 50,
                            color: HexColor('#155D93'),
                            loading: verificationCodeController.isLoading.value,
                            name: 'Next',
                            onPressed: () {
                              if (_key.currentState!.validate()) {
                                if (!verificationCodeController
                                    .isLoading.value) {
                                  verificationCodeController.verifyUserOtp();
                                }
                              }
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
