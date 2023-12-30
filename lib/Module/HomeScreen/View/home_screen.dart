import 'package:car_insurance_app/Constants/Person/person.dart';
import 'package:car_insurance_app/Module/Cars/view/add_car.dart';
import 'package:car_insurance_app/Module/ClaimsView/claims_view.dart';
import 'package:car_insurance_app/Module/HomeScreen/Model/Car.dart';
import 'package:car_insurance_app/Module/InsuranceOverView/View/insurance_overview.dart';
import 'package:car_insurance_app/Module/MarketPlace/View/market_place_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:car_insurance_app/Constants/Extensions/extensions.dart';
import 'package:car_insurance_app/Routes/set_routes.dart';

import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../Constants/constants.dart';
import '../../../Services/Shared Preferences/MySharedPreferences.dart';
import '../../../Widgets/admin_screen_custom_button.dart';
import '../../Claim Page/claim_page.dart';
import '../../Menu/View/menu_screen.dart';
import '../../RequestedQuotes/requested_quotes.dart';
import '../../UserScreen/user_screen.dart';
import '../Controller/home_screen_controller.dart';

class HomeScreen extends GetView {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  HomeScreen({super.key});

  List<Widget> _buildScreens() {
    return [Home(), InsuranceCompaniesPage(), ClaimPage(), UserScreen()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        //title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.car_fill),
        //title: ("MarketPlace"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.square_arrow_down_on_square_fill),
        // title: ("Approvals"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        // title: ("Employee Center"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      // PersistentBottomNavBarItem(
      //   icon: Icon(CupertinoIcons.tortoise_fill),
      //   title: ("Menu"),
      //   activeColorPrimary: CupertinoColors.activeBlue,
      //   inactiveColorPrimary: CupertinoColors.systemGrey,
      // ),
      // Add more items as needed
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List of car images and names for demonstration
    List<Map<String, String>> cars = [
      {
        'image':
            'https://img.freepik.com/free-photo/luxurious-car-parked-highway-with-illuminated-headlight-sunset_181624-60607.jpg?w=1800&t=st=1703577739~exp=1703578339~hmac=70e54f3ba4467f861c6e38aca3cb4ef9ca50f5a90de8914957f3bfc924b62fa5',
        'name': 'Toyota Yaris'
      },
      {
        'image':
            'https://img.freepik.com/premium-photo/close-up-headlamp-light-modern-car-garage_427248-555.jpg?w=1480',
        'name': 'Benz CL250'
      },
      {
        'image':
            'https://img.freepik.com/premium-photo/close-up-headlamp-light-modern-car-garage_427248-555.jpg?w=1480',
        'name': 'Benz CL250'
      },
    ];

    // List of suggested insurance companies for demonstration
    List<String> suggestions = [
      'https://dhow.com/wp-content/uploads/2017/12/Solidarity-Bahrain-assigned-FSR-rating.jpg',
      'https://www.atlas-mag.net/sites/default/files/images/AtlasMagazine_2021-10-No184/Fb/GIG.png',
      'https://www.atlas-mag.net/sites/default/files/images/AtlasMagazine_2022-11-No195/Images/snic.jpg',
      'https://maroonfrog.com/projects/INH_Old/wp-content/uploads/2017/10/bni.jpg',
    ];

    return GetBuilder<HomeScreenController>(
        init: HomeScreenController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/slide.png',
                        width: 76.00000762939453,
                        height: 75.00000762939453,
                        fit: BoxFit.cover,
                      ),
                      13.ph,
                      Text(
                        'Welcome Back',
                        style: GoogleFonts.lato(fontSize: 16),
                      ),
                      Text(
                        'How can we help you today?',
                        style: GoogleFonts.lato(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Image.asset('assets/images/home1.png'),
                              SizedBox(height: 8),
                              Text('File a claim'),
                            ],
                          ),
                          48.pw,

                          Image.asset('assets/images/home2.png'),
                          SizedBox(height: 8),
                          // Text('Quick Renewal'),
                          48.pw,
                          Image.asset('assets/images/home3.png'),
                          SizedBox(height: 8),
                          // Text('Road Assistance'),
                        ],
                      ),
                      SizedBox(height: 50),
                      Text(
                        'Your Insured Cars',
                        style: GoogleFonts.lato(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),

                      Container(
                        width: double.infinity,
                        height: 123,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 260,
                              height: 123,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white),
                              child: FutureBuilder<Car>(
                                future: controller.getCars(
                                    userid: controller.person.data!.id),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return CircularProgressIndicator(); // Show a loading indicator while waiting for the data
                                  } else if (snapshot.hasData) {
                                    return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapshot.data!.data
                                          .length, // Make sure data is not null before accessing length
                                      itemBuilder: (context, index) {
                                        return Container(
                                          width: 120,
                                          height: 123,
                                          margin: EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.white),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.network(
                                                cars[index]['image'].toString(),
                                                width: 117,
                                                height: 56,
                                                fit: BoxFit.cover,
                                              ),
                                              10.ph,
                                              Text(
                                                snapshot.data!.data[index]
                                                    .carName, // Make sure data[index] is not null
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text(
                                        'Error: ${snapshot.error}'); // Display the error if there is one
                                  } else {
                                    return Text(
                                        'No data available'); // Display this if there is no error and no data
                                  }
                                },
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(AddCarScreen(),
                                    arguments: controller.person.data!.id);
                              },
                              child: Container(
                                width: 120,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color(0xff155d93)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add),
                                    10.ph,
                                    Text('Add New',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      20.ph,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              height: 150,
                              margin: EdgeInsets.all(16),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Color(0x14ff4bcc),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(RequestedQuote(),
                                      arguments: controller.person.data!.id);
                                },
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/investment_opportunities.svg',
                                      fit: BoxFit.cover,
                                    ),
                                    10.ph,
                                    Text('View Quotes',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        )),
                                    Text('Your Quotes',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        )),
                                  ],
                                ),
                              )),
                          Container(
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: Color(0x144b6fff),
                              ),
                              margin: EdgeInsets.all(16),
                              padding: EdgeInsets.all(16),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(ClaimView(),
                                      arguments: controller.person.data!.id);
                                },
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/general_service.svg',
                                      fit: BoxFit.cover,
                                    ),
                                    10.ph,
                                    Text('View Claims',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        )),
                                    Text('Your Claims',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        )),
                                  ],
                                ),
                              )),
                        ],
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Suggested for you',
                          style: GoogleFonts.lato(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 120,
                        margin: EdgeInsets.only(left: 10),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: insuranceCompanies.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(InsuranceOverView(),
                                    arguments: insuranceCompanies[index]);
                              },
                              child: Card(
                                child: Image.network(
                                    insuranceCompanies[index]['logo'],
                                    fit: BoxFit.cover),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      // ... add more widgets as necessary
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  final List<Map<String, dynamic>> insuranceCompanies = [
    {
      'id': 1,
      'logo':
          'https://dhow.com/wp-content/uploads/2017/12/Solidarity-Bahrain-assigned-FSR-rating.jpg',
      'name': 'Solidarity Insurance B.S.C',
      'description': 'Find coverage that’s right for you!',
      'price': 'BD 170/year',
    },
    {
      'id': 2,
      'logo':
          'https://www.atlas-mag.net/sites/default/files/images/AtlasMagazine_2021-10-No184/Fb/GIG.png',
      'name': 'Gulf Insurance Group',
      'description': 'Ensuring your future dreams',
      'price': 'BD 200/year',
    },
    {
      'id': 3,
      'logo':
          'https://www.atlas-mag.net/sites/default/files/images/AtlasMagazine_2022-11-No195/Images/snic.jpg',
      'name': 'SNIC Insurance',
      'description': 'Your Journey, Our Worry',
      'price': 'BD 180/year',
    },
    {
      'id': 4,
      'logo':
          'https://maroonfrog.com/projects/INH_Old/wp-content/uploads/2017/10/bni.jpg',
      'name': 'Bahrain National Insurance',
      'description': 'Your car’s caretaker!',
      'price': 'BD 200/year',
    },
    // Add more insurance companies here
  ];

  Widget _buildMenuIcon(IconData icon, String label) {
    return Column(
      children: [
        Image.asset('assets/images/home1.png'),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}
