import 'package:car_insurance_app/Constants/Extensions/extensions.dart';
import 'package:car_insurance_app/Module/InsuranceOverView/View/choose_policy_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class InsuranceCompanyPolicyScreen extends StatefulWidget {
  @override
  _InsuranceCompanyPolicyScreenState createState() =>
      _InsuranceCompanyPolicyScreenState();
}

class _InsuranceCompanyPolicyScreenState
    extends State<InsuranceCompanyPolicyScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _sumInsured;
  String? _modelYear;
  String? _make;
  String? _model;
  DateTime _firstRegistrationDate = DateTime.now();
  TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insurance Company Policy'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 80, left: 30, right: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Let\'s get started',
                  style: Theme.of(context).textTheme.headline6,
                ),
                20.ph,
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Sum Insured',
                  ),
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    _sumInsured = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter sum insured';
                    }
                    return null;
                  },
                ),
                20.ph,
                DropdownButtonFormField<String>(
                  value: _modelYear,
                  decoration: InputDecoration(labelText: 'Model Year'),
                  items: ['2022', '2021', '2020']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _modelYear = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a model year';
                    }
                    return null;
                  },
                ),
                20.ph,
                DropdownButtonFormField<String>(
                  value: _make,
                  decoration: InputDecoration(labelText: 'Model'),
                  items: ['Audi', 'Mercedes', 'G-Wagon']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _make = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a model year';
                    }
                    return null;
                  },
                ),
                20.ph,
                DropdownButtonFormField<String>(
                  value: _model,
                  decoration: InputDecoration(labelText: 'Model'),
                  items: ['S3', 'S4', 'S5']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _model = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a model year';
                    }
                    return null;
                  },
                ),
                20.ph,
                TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: 'First Registration Date',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  readOnly:
                      true, // Make the text field read-only since you're using it as a date picker
                  onTap: () {
                    _selectDate(
                        context); // Call the date picker when the field is tapped
                  },
                  onSaved: (val) {
                    // Convert the date from String to DateTime if necessary when saving
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter first registration date';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 70),
                GestureDetector(
                  onTap: () {
                    Get.to(ChoosePolicyScreen());
                    if (_formKey.currentState!.validate()) {}
                  },
                  child: Center(
                    child: Container(
                      child: Center(
                          child: Text('Select Your Policy',
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
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate:
          _firstRegistrationDate, // Assuming this is a DateTime variable holding the initial date
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _firstRegistrationDate) {
      setState(() {
        _firstRegistrationDate = pickedDate;
        _dateController.text = DateFormat('dd-MM-yyyy')
            .format(pickedDate); // Using intl package to format the date
      });
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
