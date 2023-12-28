import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';

final Color primaryColor = HexColor("#175E94");
final Color primaryColor2 = HexColor("#1f3996");

var whiteColor = HexColor("FAFFFD");

//
// getFile() async {
//   var file;
//   // String? base64Image;
//   //
//
//
//   FilePickerResult? result = await FilePicker.platform.pickFiles();
//
//   if (result != null) {
//     file = File(result.files.single.path!);
//
//     print(file);
//     // isFile = true;
//     //  List<int> imageBytes = _file!.readAsBytesSync();
//     //
//     //  print(imageBytes);
//     // base64Image = base64Encode(imageBytes);
//     //  print(base64Image);
//
//     return file;
//   } else {
//     // View Users canceled the picker
//   }
// }

/* Validations */

String? emptyStringValidator(String? val) {
  String string = val!.trim();

  if (string.isEmpty) {
    return "This field is required";
  } else {
    return null;
  }
}

String? passwordValidator(String? v) {
  RegExp smallAlphabets = RegExp("(?=.*?[a-z])");
  RegExp capitalAlphabets = RegExp("(?=.*?[A-Z])");
  RegExp specialCharacter = RegExp("(?=.*?[#?!@\$%^&*-])");
  String string = v!.trim();
  if (string.isEmpty) {
    return 'Please enter the password';
  } else if (string.length < 6 || string.length > 25) {
    return 'Password length should be in between 6 and 25';
  } else if (!smallAlphabets.hasMatch(string)) {
    return 'Password must includes at least one lower case English letter. ';
  } else if (!capitalAlphabets.hasMatch(string)) {
    return 'Password must includes at least one upper case English letter.';
  } else if (!specialCharacter.hasMatch(string)) {
    return 'Password must includes at least one special character.';
  } else {
    return null;
  }
}

String? emailValidator(String? v) {
  String string = v!.trim();
  bool _emailValid = RegExp(
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
      .hasMatch(string);

  if (string.isEmpty) {
    return 'Please enter your email';
  } else if (!_emailValid) {
    return 'Please enter a valid email';
  } else {
    return null;
  }
}

String? cnicValidator(String? v) {
  String string = v!.trim();
  bool _cnicValid = RegExp("^[0-9]{5}-[0-9]{7}-[0-9]\$").hasMatch(string);

  if (string.isEmpty) {
    return 'Please enter your CNIC';
  } else if (!_cnicValid) {
    return 'Please enter a valid CNIC  XXXXX-XXXXXXX-X  ';
  } else {
    return null;
  }
}

Future<bool?> myToast(
    {required msg,
    Color? backgroundColor,
    bool isNegative = false,
    ToastGravity? gravity}) async {
  bool? toast = await Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity ?? ToastGravity.BOTTOM,
      backgroundColor: isNegative ? Colors.red : Colors.black,
      textColor: Colors.white,
      fontSize: 16.0.sp);
  return toast;
}

String? validateMobileNumber(String? value) {
// Check if the value is empty
  if (value!.isEmpty) {
    return 'Mobile number is required';
  }

// Remove any whitespace or special characters from the value
  value = value.replaceAll(RegExp(r'\s|\D'), '');

// Check if the value contains only digits
  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
    return 'Invalid mobile number';
  }

// Check the length of the value
  if (value.length < 11 || value.length > 12) {
    return 'Mobile number must be between 10 and 12 digits';
  }

// If all checks pass, return null (no error)
  return null;
}

String? validatePhoneNumber(String? phoneNumber) {
  // Remove any non-digit characters from the phone number
  String cleanedPhoneNumber = phoneNumber!.replaceAll(RegExp(r'\D'), '');

  // Check if the phone number has a valid length
  int phoneNumberLength = cleanedPhoneNumber.length;
  if (phoneNumberLength == 0) {
    return 'Please Enter Phone Number';
  } else if (phoneNumberLength != 10 && phoneNumberLength != 11) {
    return 'Invalid Phone Number !';
  }

  return null; // Return null if the phone number is valid
}

String? otpValidator(String? value) {
  if (value!.isEmpty) {
    return 'Please enter the OTP';
  }

// Create a regular expression pattern for exactly 6 digits
  RegExp regex = RegExp(r'^[0-9]{6}$');

  if (!regex.hasMatch(value)) {
    return 'Please enter a valid 6-digit OTP';
  }

  return null; // Return null if the value is valid
}
