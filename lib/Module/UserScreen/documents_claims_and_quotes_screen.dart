import 'package:car_insurance_app/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ClaimsView/claims_view.dart';
import '../HomeScreen/Controller/home_screen_controller.dart';
import '../MarketPlace/Widget/market_place_screen_card.dart';
import '../RequestedQuotes/requested_quotes.dart';

class DocumentClaimsAndQuotes extends StatefulWidget {
  const DocumentClaimsAndQuotes({super.key});

  @override
  State<DocumentClaimsAndQuotes> createState() =>
      _DocumentClaimsAndQuotesState();
}

class _DocumentClaimsAndQuotesState extends State<DocumentClaimsAndQuotes> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
        init: HomeScreenController(),
        builder: (controller) {
          return Scaffold(
            // extendBodyBehindAppBar: true,
            appBar: MyAppBar(title: 'Documents'),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardMakretPlace(
                      color: Color(0x14ff6d17),
                      textColor: Color(0xffFF6D17),
                      svgPath: 'assets/images/building.svg',
                      headingText: 'Quotes',
                      boxText: '1',
                      onTap: () {
                        Get.to(RequestedQuote(),
                            arguments: controller.person.data!.id);
                      },
                      // subHeadingText:
                      //     'It serves as a comprehensive directory, showcasing company profiles with industry, locations, products, services, and contact details for easy access and networking.',
                    ),
                    CardMakretPlace(
                      color: Color(0x14fcab10),
                      textColor: Color(0xffFCAB10),
                      svgPath: 'assets/images/online_store.svg',
                      headingText: 'Claims',
                      boxText: '2',
                      onTap: () {
                        Get.to(ClaimView(),
                            arguments: controller.person.data!.id);
                      },
                      // subHeadingText:
                      //     'It hosts an online store providing a platform for suppliers to showcase and sell their products online, catering to diverse customers worldwide.',
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
