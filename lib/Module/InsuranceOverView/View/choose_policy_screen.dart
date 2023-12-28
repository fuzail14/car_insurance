import 'package:auto_size_text/auto_size_text.dart';
import 'package:car_insurance_app/Constants/Extensions/extensions.dart';
import 'package:car_insurance_app/Module/InsuranceOverView/View/insurance_company_policy1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class ChoosePolicyScreen extends StatefulWidget {
  @override
  State<ChoosePolicyScreen> createState() => ChoosePolicyScreenState();
}

class ChoosePolicyScreenState extends State<ChoosePolicyScreen>
    with SingleTickerProviderStateMixin {
  var arguments = Get.arguments;
  int _selectedIndex = 0;

  final List<String> prices = ['BD 176', 'BD 220', 'BD 355'];
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
    print(arguments);
  }

  void _selectPolicy(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // @override
  // void dispose() {
  //   _tabController.dispose();
  //   super.dispose();
  // }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {
        // Update the selected index to the tab's index
        print('Selected index: ${_tabController.index}');
        print('Price: ${prices[_tabController.index]}');
      });
    }
  }

  void _navigateToNextScreen(BuildContext context) {
    final price = prices[_tabController.index];
    print('Navigating with price: $price');
    Get.to(InsuranceCompanyPolicy1(), arguments: [arguments, price]);
    // Navigator.push to the next screen along with the selected price
    // Pass the 'price' to the next screen. For example:
    // Navigator.of(context).push(MaterialPageRoute(
    //   builder: (_) => NextScreen(selectedPrice: price),
    // ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text('Choose Your Policy'),
              bottom: TabBar(
                controller: _tabController,
                tabs: [
                  Tab(text: 'Flexi'),
                  Tab(text: 'Gold'),
                  Tab(text: 'Platinum'),
                ],
              ),
            ),
            body: TabBarView(controller: _tabController, children: [
              PolicyTabContent(price: '176'),

              Gold(price: '220'),

              Platinum(price: '355.30'),

              // Gold(price: _prices[_selectedIndex]),
              // Platinum(price: _prices[_selectedIndex]),
            ]),
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(top: 800, left: 40),
              child: GestureDetector(
                onTap: () {
                  _navigateToNextScreen(context);
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
              ),
            )));
  }
}

class PolicyTabContent extends StatelessWidget {
  //final String policyType;
  final String price;

  PolicyTabContent({required this.price});

  // final policyDetails = {
  //   'flexi': {
  //     'duration': '3 Years',
  //     'details': [
  //       '3 Years Nil Depreciation on spare parts',
  //       'Loss or damage by fire or theft',
  //       // Add more details as per your requirements
  //     ],
  //     'price': 'BD 176.00',
  //   },
  //   // Add gold and platinum policy details similarly
  // };
  @override
  Widget build(BuildContext context) {
    // Example policy details, you should fetch these from your backend or state management solution
    print(this.price);
    return Column(
      children: [
        Container(
          width: 275,
          height: 484,
          margin: EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: HexColor('#155D93'))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text('3 Years',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: HexColor('#000000'))),
              ),
              Center(
                child: Text('Agency Repair',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: HexColor('#BFBFBF'))),
              ),
              Divider(
                color: HexColor("#155D93"),
              ),
              59.ph,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Image.asset('assets/images/choose_policy.png'),
                    10.pw,
                    Text('3 Years Nil Depreciation on spare parts ',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: HexColor('#000000'))),
                  ],
                ),
              ),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Image.asset('assets/images/choose_policy.png'),
                    10.pw,
                    Text('Loss or damage by fire or theft',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: HexColor('#000000'))),
                  ],
                ),
              ),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Image.asset('assets/images/choose_policy.png'),
                    10.pw,
                    Text('Personal Cyber',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: HexColor('#000000'))),
                  ],
                ),
              ),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Image.asset('assets/images/choose_policy.png'),
                    10.pw,
                    Text('Standard Motor Comprehensive Policy',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: HexColor('#000000'))),
                  ],
                ),
              ),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Row(
                  children: [
                    Image.asset('assets/images/choose_policy.png'),
                    10.pw,
                    AutoSizeText(
                        'WindShield Cover Up to BD 300\nStandard Motor Comprehensive\n Policy',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: HexColor('#000000'))),
                  ],
                ),
              ),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Image.asset('assets/images/choose_policy.png'),
                    10.pw,
                    Text('Emergency Treatment Cover Limit BD\n 500/-',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: HexColor('#000000'))),
                  ],
                ),
              ),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Image.asset('assets/images/choose_policy.png'),
                    10.pw,
                    Text('Liability to third parties',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: HexColor('#000000'))),
                  ],
                ),
              ),
              20.ph,
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 80, right: 30, top: 30),
          child: Row(
            children: [
              Text(
                'STARTING',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              93.pw,
              Text(
                '176',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Gold extends StatelessWidget {
  //final String policyType;
  final String price;

  Gold({required this.price});

  // final policyDetails = {
  //   'flexi': {
  //     'duration': '3 Years',
  //     'details': [
  //       '3 Years Nil Depreciation on spare parts',
  //       'Loss or damage by fire or theft',
  //       // Add more details as per your requirements
  //     ],
  //     'price': 'BD 176.00',
  //   },
  //   // Add gold and platinum policy details similarly
  // };
  @override
  Widget build(BuildContext context) {
    // Example policy details, you should fetch these from your backend or state management solution
    print(this.price);
    return Column(
      children: [
        Container(
          width: 275,
          height: 484,
          margin: EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: HexColor('#155D93'))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text('5 Years',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: HexColor('#000000'))),
              ),
              Center(
                child: Text('Agency Repair',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: HexColor('#BFBFBF'))),
              ),
              Divider(
                color: HexColor("#155D93"),
              ),
              59.ph,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Image.asset('assets/images/choose_policy.png'),
                    10.pw,
                    Text('5 Years Nil Depreciation on spare parts ',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: HexColor('#000000'))),
                  ],
                ),
              ),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Image.asset('assets/images/choose_policy.png'),
                    10.pw,
                    Text('Flexi Plan Coverage',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: HexColor('#000000'))),
                  ],
                ),
              ),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Image.asset('assets/images/choose_policy.png'),
                    10.pw,
                    Text('Natural Perils Cover',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: HexColor('#000000'))),
                  ],
                ),
              ),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Image.asset('assets/images/choose_policy.png'),
                    10.pw,
                    Text('Geographical Extension to KSA',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: HexColor('#000000'))),
                  ],
                ),
              ),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Row(
                  children: [
                    Image.asset('assets/images/choose_policy.png'),
                    10.pw,
                    AutoSizeText(
                        'Nil Depreciation on total loss claim\n up to 6 months',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: HexColor('#000000'))),
                  ],
                ),
              ),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Image.asset('assets/images/choose_policy.png'),
                    10.pw,
                    Text(
                        'Personal Accident benefits to Driver\n only up to BD 5,000/-',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: HexColor('#000000'))),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 80, right: 30, top: 30),
          child: Row(
            children: [
              Text(
                'STARTING',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              93.pw,
              Text(
                '220',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Platinum extends StatelessWidget {
  //final String policyType;
  final String price;

  Platinum({required this.price});

  // final policyDetails = {
  //   'flexi': {
  //     'duration': '3 Years',
  //     'details': [
  //       '3 Years Nil Depreciation on spare parts',
  //       'Loss or damage by fire or theft',
  //       // Add more details as per your requirements
  //     ],
  //     'price': 'BD 176.00',
  //   },
  //   // Add gold and platinum policy details similarly
  // };
  @override
  Widget build(BuildContext context) {
    // Example policy details, you should fetch these from your backend or state management solution
    print(this.price);
    return Column(
      children: [
        Container(
          width: 275,
          height: 484,
          margin: EdgeInsets.only(top: 40),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: HexColor('#155D93'))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text('Lifetime',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: HexColor('#000000'))),
              ),
              Center(
                child: Text('Agency Repair',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: HexColor('#BFBFBF'))),
              ),
              Divider(
                color: HexColor("#155D93"),
              ),
              59.ph,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Image.asset('assets/images/choose_policy.png'),
                    10.pw,
                    Text('Gold Plan Coverage ',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: HexColor('#000000'))),
                  ],
                ),
              ),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Image.asset('assets/images/choose_policy.png'),
                    10.pw,
                    Text('VIP Service',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: HexColor('#000000'))),
                  ],
                ),
              ),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Image.asset('assets/images/choose_policy.png'),
                    10.pw,
                    Text('24-hour roadside assistance in GCC',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: HexColor('#000000'))),
                  ],
                ),
              ),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Image.asset('assets/images/choose_policy.png'),
                    10.pw,
                    Text('Life insurance to the policy holder',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: HexColor('#000000'))),
                  ],
                ),
              ),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Row(
                  children: [
                    Image.asset('assets/images/choose_policy.png'),
                    10.pw,
                    AutoSizeText(
                        'Vehicle replacement up to\n 14 days (small size)',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: HexColor('#000000'))),
                  ],
                ),
              ),
              20.ph,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Image.asset('assets/images/choose_policy.png'),
                    10.pw,
                    Text(
                        'Windscreen Cover (NCD protection\n & Waiver of deductible)',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: HexColor('#000000'))),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 80, right: 30, top: 30),
          child: Row(
            children: [
              Text(
                'STARTING',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              93.pw,
              Text(
                '355.30',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
