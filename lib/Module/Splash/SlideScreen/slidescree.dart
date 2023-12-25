// import 'package:car_insurance_app/Constants/Extensions/extensions.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';

// import '../../../../Widgets/My Button/my_button.dart';

// class SlideScreen extends StatefulWidget {
//   SlideScreen({super.key});

//   @override
//   State<SlideScreen> createState() => _SlideScreenState();
// }

// class _SlideScreenState extends State<SlideScreen> {
//   final _key = GlobalKey<FormState>();

//   final List<String> imgList = [
//     'assets/images/slide1.png',
//     'assets/images/slide2.png',
//     'assets/images/slide3.png',
//     // Add more image paths if you have more slides
//   ];

//   int _current = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       child: Material(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Center(
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 0, top: 20).r,
//                   child: Image.asset(
//                     'assets/images/slide.png',
//                   ),
//                 ),
//               ),
//               60.ph,
//               Image.asset(
//                 'assets/images/slide1.png',
//               ),
//               20.ph,
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 30,
//                 ).r,
//                 child: Text(
//                   'File your claims in minutes',
//                   style: TextStyle(
//                       fontSize: 46,
//                       fontWeight: FontWeight.w700,
//                       color: HexColor('#155D93')),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(
//                   left: 30,
//                 ).r,
//                 child: Text(
//                   'Anytime and anywhere',
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w300,
//                       color: HexColor('#252525')),
//                 ),
//               ),
//               32.ph,
//               CarouselSlider(
//                 items: imgList
//                     .map((item) => Container(
//                           child:
//                               Image.asset(item, fit: BoxFit.cover, width: 1000),
//                         ))
//                     .toList(),
//                 options: CarouselOptions(
//                     autoPlay: true,
//                     enlargeCenterPage: true,
//                     aspectRatio: 2.0,
//                     onPageChanged: (index, reason) {
//                       setState(() {
//                         _current = index;
//                       });
//                     }),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: imgList.asMap().entries.map((entry) {
//                   return GestureDetector(
//                     onTap: () => {}, // Handle indicator tap
//                     child: Container(
//                       width: _current == entry.key ? 24.0 : 8.0,
//                       height: 8.0,
//                       margin:
//                           EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
//                       decoration: BoxDecoration(
//                           shape: BoxShape.rectangle,
//                           borderRadius: BorderRadius.circular(8.0),
//                           color: _current == entry.key
//                               ? HexColor('#155D93')
//                               : HexColor('#155D93').withOpacity(0.5)),
//                     ),
//                   );
//                 }).toList(),
//               ),
//               40.ph,
//               SizedBox(
//                 width: 300,
//                 height: 50,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       elevation: 0,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12.r)),
//                       backgroundColor: HexColor('#155D93')),
//                   onPressed: () {},
//                   child: Text('Create an account',
//                       maxLines: 1,
//                       style: GoogleFonts.ubuntu(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 18.sp),
//                       textAlign: TextAlign.center),
//                 ),
//               ),
//               20.ph,
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Already registered?",
//                       style: TextStyle(
//                         fontSize: 13,
//                         fontWeight: FontWeight.w600,
//                       )),
//                   TextButton(
//                     onPressed: () {},
//                     child: Text('Log In',
//                         style: TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w600,
//                         )),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }

import 'package:car_insurance_app/Constants/Extensions/extensions.dart';
import 'package:car_insurance_app/Module/Login/View/login_screen.dart';
import 'package:car_insurance_app/Module/Register/view/register.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SlideScreen extends StatefulWidget {
  @override
  _SlideScreenState createState() => _SlideScreenState();
}

class _SlideScreenState extends State<SlideScreen> {
  int _current = 0;

  final List<Map<String, dynamic>> slideData = [
    {
      'image':
          'assets/images/slide1.png', // Ensure these assets exist in your project
      'title': 'Insurance at your fingertip',
      'subtitle': 'Get a quote in seconds',
    },
    {
      'image': 'assets/images/slide2.png',
      'title': 'File your claims in minutes',
      'subtitle': 'Track your claims status',
    },
    {
      'image': 'assets/images/slide3.png',
      'title': 'Get road assistance',
      'subtitle': 'Anytime and anywhere',
    },
  ];

  List<Widget> generateSlideWidgets() {
    return slideData.map((slide) {
      return Column(
        children: [
          Image.asset(
            'assets/images/slide.png',
            width: 335,
          ),
          68.ph,
          Image.asset(slide['image'], width: 335, height: 230),
          49.ph,
          Text(
            slide['title'],
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: HexColor('#155D93'),
            ),
            textAlign: TextAlign.center,
          ),
          10.ph,
          Text(
            slide['subtitle'],
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: HexColor('#252525'),
            ),
            textAlign: TextAlign.center,
          ),
          78.ph,
          SizedBox(
            width: 300,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: HexColor('#155D93'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Get.to(RegisterScreen());
              },
              child: Text(
                'Create an account',
                style: GoogleFonts.ubuntu(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already registered?',
                style: GoogleFonts.ubuntu(
                  color: HexColor('#252525'),
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.to(LoginScreen());
                },
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: HexColor('#155D93'),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CarouselSlider(
                items: generateSlideWidgets(),
                options: CarouselOptions(
                  height: 800,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: slideData.asMap().entries.map((entry) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
