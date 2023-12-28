import 'package:car_insurance_app/Module/Claim%20Page/claim_page6.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../InsuranceOverView/View/insurance_company_policy1.dart';

class ClaimPage5 extends StatefulWidget {
  @override
  _ClaimPage5State createState() => _ClaimPage5State();
}

class _ClaimPage5State extends State<ClaimPage5> {
  final List<String> garageNames = [
    'Heston Auto Services',
    'Makkah Motor Cycles',
    'Yaseen Garage',
    'Mac Power Auto Services',
    'Kanoo Plaza - Tubli',
    'Ahmed Alherz Garage',
    'Al Ammadi Auto Services',
    'National Motor Company W.L.L.',
    'KIA BIN HINDI - Arad',
    'Behbehani Brothers W.L.L.'
  ];

  int? _selectedIndex;

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Claims Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Garage',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: garageNames.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(garageNames[index]),
                  onTap: () => _onItemSelected(index),
                  trailing: _selectedIndex == index
                      ? Icon(Icons.check_circle, color: Colors.blue)
                      : null,
                  tileColor: _selectedIndex == index
                      ? Colors.blue.withOpacity(0.2)
                      : null,
                );
              },
            ),
          ),
          Container(
            width: 297.1662902832031,
            height: 48.48029708862305,
            margin: EdgeInsets.all(30),
            child: MyButton(
                name: 'Continue',
                onTap: () {
                  if (_selectedIndex != null) {
                    // Do something with the selected garage
                    print('Selected Garage: ${garageNames[_selectedIndex!]}');
                    Get.to(ClaimPage6());
                  }
                }),
          )
        ],
      ),
    );
  }
}
