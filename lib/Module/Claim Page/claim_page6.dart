import 'dart:io';
import 'package:car_insurance_app/Constants/Extensions/extensions.dart';
import 'package:car_insurance_app/Module/Claim%20Page/claim_page2.dart';
import 'package:car_insurance_app/Module/Claim%20Page/claimpage_controller.dart';
import 'package:car_insurance_app/Module/InsuranceOverView/View/insurance_company_policy1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';

class ClaimPage6 extends StatefulWidget {
  @override
  _ClaimPage6State createState() => _ClaimPage6State();
}

class _ClaimPage6State extends State<ClaimPage6> {
  final ImagePicker _picker = ImagePicker();
  Map<String, XFile?> _pickedFiles = {};

  Future<void> _pickImage(String category, ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _pickedFiles[category] = image;
      });
    }
  }

  Widget _buildImagePickerButton(String title, String category) {
    return Column(
      children: [
        DottedBorder(
          color: HexColor('#155D93'),
          borderType: BorderType.RRect,
          radius: Radius.circular(12),
          padding: EdgeInsets.all(6),
          dashPattern: [8, 4],
          child: ListTile(
            title: Text(title),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: () => _pickImage(category, ImageSource.camera),
                ),
                IconButton(
                  icon: Icon(Icons.photo_library),
                  onPressed: () => _pickImage(category, ImageSource.gallery),
                ),
              ],
            ),
          ),
        ),
        if (_pickedFiles[category] != null)
          Container(
            width: double.infinity,
            height: 150,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Image.file(
              File(_pickedFiles[category]!.path),
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload your documents'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: GetBuilder<ClaimController>(
          init: ClaimController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Column(
                  children: <Widget>[
                    20.ph,
                    _buildImagePickerButton(
                        'Driving License (Front and Back)', 'Driving License'),
                    20.ph,
                    // ... repeat for other categories ...
                    _buildImagePickerButton(
                        'Ownership Card (Front and Back)', 'Ownership Card'),
                    20.ph,
                    // ... repeat for other categories ...
                    _buildImagePickerButton(
                        'Accident Photos', 'Accident Photos'),
                    20.ph,
                    // ... repeat for other categories ...
                    _buildImagePickerButton(
                        'Incident Report', 'Incident Report'),
                    20.ph,

                    Container(
                      width: 297.1662902832031,
                      height: 48.48029708862305,
                      margin: EdgeInsets.all(30),
                      child: MyButton(
                        name: 'Continue',
                        onTap: () {
                          controller.storeClaim();
                          // Get.to(ClaimPage5());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
