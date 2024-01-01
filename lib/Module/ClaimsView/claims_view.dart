import 'package:auto_size_text/auto_size_text.dart';
import 'package:car_insurance_app/Constants/Extensions/extensions.dart';
import 'package:car_insurance_app/Module/ClaimsView/Claim.dart';
import 'package:car_insurance_app/Module/ClaimsView/claims_view_controller.dart';
import 'package:car_insurance_app/Module/RequestedQuotes/Quote.dart';
import 'package:car_insurance_app/Module/RequestedQuotes/requested_quotes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

// ... Your imports ...

class ClaimView extends StatefulWidget {
  const ClaimView({super.key});

  @override
  State<ClaimView> createState() => _ClaimViewState();
}

class _ClaimViewState extends State<ClaimView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ClaimViewController>(
      init: ClaimViewController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Claims'),
          ),
          body: FutureBuilder<Claim>(
            future: controller.getClaim(userid: controller.id!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData && snapshot.data!.claims.isNotEmpty) {
                return ListView.builder(
                  itemCount: snapshot.data!.claims.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var claim = snapshot.data!.claims[index];
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        //height: 686.h,
                        //width: 386.w,

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Color(0xfff3f4f5)),
                        margin: EdgeInsets.only(top: 10, left: 14, right: 14).r,
                        padding: EdgeInsets.only(
                                left: 16, top: 22, right: 16, bottom: 61.75)
                            .r,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // margin:
                              //     EdgeInsets.only(top: 22, left: 16, right: 16).r,
                              padding: EdgeInsets.only(
                                      left: 10, top: 10, right: 10, bottom: 13)
                                  .r,

                              width: 353.83331298828125.w,
                              //height: 186.h,

                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.white),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      // Container(
                                      //   width: 55.75555419921875.w,
                                      //   height: 52.h,
                                      //   decoration: BoxDecoration(
                                      //       border: Border.all(
                                      //           color: HexColor('#E1E3E6')),
                                      //       shape: BoxShape.circle),
                                      //   child: CachedNetworkImage(
                                      //     imageUrl: Api.imageBaseUrl +
                                      //         tenders.companies.logoPath
                                      //             .toString(),
                                      //     fit: BoxFit.contain,
                                      //     progressIndicatorBuilder: (context, url,
                                      //             downloadProgress) =>
                                      //         CircularProgressIndicator(
                                      //             value:
                                      //                 downloadProgress.progress),
                                      //     errorWidget: (context, url, error) =>
                                      //         Icon(Icons.error),
                                      //   ),
                                      // ),
                                      // CircleAvatar(
                                      //   backgroundColor: HexColor('#FFFFF'),
                                      //   child: (tenders.companies.logo == null)
                                      //       ? Icon(Icons.eco, color: Colors.white)
                                      //       : Image.network(Api.imageBaseUrl +
                                      //           tenders.companies.logoPath
                                      //               .toString()),
                                      // ),
                                      15.pw,
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              claim.insuranceCompany
                                                  .toString(), // Replace with actual title
                                              style: GoogleFonts.quicksand(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                            AutoSizeText(
                                              //tenders.companies.logo.toString(),
                                              claim.phoneNumber.toString(),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  13.ph,
                                  Container(
                                    width: 332.39.w,
                                    height: 27.h,
                                    decoration: BoxDecoration(
                                        color: HexColor('#FFFFFF'),
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(
                                            color: HexColor('#E1E3E6'))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/tendercard_icon1.svg',
                                          height: 14.h,
                                          width: 15.01.w,
                                        ),
                                        Text(
                                          'Closed',
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                              color: HexColor('#EB2F2F')),
                                        ),
                                        VerticalDivider(
                                          color: HexColor('#E1E3E6'),
                                        ),
                                        SvgPicture.asset(
                                          'assets/images/tendercard_icon2.svg',
                                          height: 14.h,
                                          width: 15.01.w,
                                        ),
                                        Text('Qualified',
                                            style: GoogleFonts.quicksand(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12.sp,
                                                color: HexColor('#27D959'))),
                                        VerticalDivider(
                                          color: HexColor('#E1E3E6'),
                                        ),
                                        SvgPicture.asset(
                                          'assets/images/tendercard_icon3.svg',
                                          height: 14.h,
                                          width: 15.01.w,
                                        ),
                                        Text('Product',
                                            style: GoogleFonts.quicksand(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12.sp,
                                                color: HexColor('#4758EF'))),
                                      ],
                                    ),
                                  ),
                                  13.ph,
                                  Text('Claim',
                                      style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14.sp,
                                          color: HexColor('#686868'))),
                                  6.ph,
                                  Row(
                                    children: [
                                      Container(
                                        height: 24.h,
                                        width: 101.w,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            border: Border.all(
                                                color: HexColor('#27BCEB'))),
                                        child: Center(
                                          child: Text(
                                            'Email Protected',
                                            style: GoogleFonts.quicksand(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 10.sp,
                                                color: HexColor('#27BCEB')),
                                          ),
                                        ),
                                      ),
                                      21.23.pw,
                                      Container(
                                        height: 24.h,
                                        width: 63.w,
                                        decoration: BoxDecoration(
                                          color: HexColor('#27BCEB'),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'contact',
                                            style: GoogleFonts.quicksand(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 10.sp,
                                                color: HexColor('#FFFFFF')),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            10.ph,
                            Text(
                              'Remarks'.toString(), // Replace with actual title
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w700,
                                fontSize: 16.sp,
                              ),
                            ),
                            12.ph,
                            AutoSizeText(
                              claim.remarks.toString(),
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                              ),
                            ),
                            20.ph,
                            Container(
                              width: 353.83331298828125.w,
                              //height: 186.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16).r,
                                  color: Colors.white),
                              child: Card(
                                margin: EdgeInsets.only(
                                        top: 16,
                                        bottom: 15,
                                        left: 24.66,
                                        right: 25.73)
                                    .r,
                                color: HexColor('#F3F4F5'),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                          left: 20,
                                          top: 10,
                                          right: 20,
                                          bottom: 20)
                                      .r,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Details',
                                        style: GoogleFonts.quicksand(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16.sp,
                                            color: HexColor('#0D0B0C')),
                                      ),
                                      16.ph,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Driver Cpr',
                                            style: GoogleFonts.quicksand(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.sp,
                                                color: HexColor('#6A7380')),
                                          ),
                                          //16.pw,
                                          Text(
                                            claim.driverCpr,
                                            style: GoogleFonts.quicksand(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14.sp,
                                                color: HexColor('#0D0B0C')),
                                          ),
                                        ],
                                      ),
                                      16.ph,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Survey Date',
                                            style: GoogleFonts.quicksand(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.sp,
                                                color: HexColor('#6A7380')),
                                          ),
                                          //16.pw,
                                          Text(
                                            claim.surveydate.toString(),
                                            style: GoogleFonts.quicksand(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14.sp,
                                                color: HexColor('#0D0B0C')),
                                          ),
                                        ],
                                      ),
                                      16.ph,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Owner Cpr',
                                            style: GoogleFonts.quicksand(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.sp,
                                                color: HexColor('#6A7380')),
                                          ),
                                          //16.pw,
                                          Text(
                                            claim.ownerCpr.toString(),
                                            style: GoogleFonts.quicksand(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14.sp,
                                                color: HexColor('#0D0B0C')),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            51.25.ph,
                            Row(
                              children: [
                                Container(
                                  height: 32.h,
                                  width: 140.w,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(16).r,
                                      border: Border.all(
                                          color: HexColor('#27BCEB'))),
                                  child: Center(
                                    child: Text(
                                      'Detail',
                                      style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 10.sp,
                                          color: HexColor('#27BCEB')),
                                    ),
                                  ),
                                ),
                                21.23.pw,
                                Container(
                                  width: 140.w,
                                  height: 32.h,
                                  decoration: BoxDecoration(
                                    color: HexColor('#27BCEB'),
                                    borderRadius: BorderRadius.circular(16).r,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Response',
                                      style: GoogleFonts.quicksand(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 10.sp,
                                          color: HexColor('#FFFFFF')),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return Center(child: Text('No data available'));
              }
            },
          ),
        );
      },
    );
  }
}

class QuoteCard extends StatelessWidget {
  final dynamic quote; // Replace dynamic with your Quote type

  const QuoteCard({Key? key, required this.quote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              quote.companyName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Sum Insured: ${quote.sumInsured}'),
            Text('Model Year: ${quote.modelYear}'),
            Text('Make: ${quote.make}'),
            Text('Model: ${quote.model}'),
            Text('Premium Price: ${quote.premiumPrice}'),
            Text('Total Premium Price: ${quote.totalPremiumPrice}'),
            SizedBox(height: 8),
            Text('Plate Number: ${quote.plateNumber}'),
            Text('Expiry Date: ${quote.expiryDate}'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle View Details action
              },
              child: Text('View Details'),
            ),
          ],
        ),
      ),
    );
  }
}
