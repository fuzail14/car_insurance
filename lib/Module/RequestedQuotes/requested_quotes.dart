import 'package:auto_size_text/auto_size_text.dart';
import 'package:car_insurance_app/Constants/Extensions/extensions.dart';
import 'package:car_insurance_app/Module/RequestedQuotes/Quote.dart';
import 'package:car_insurance_app/Module/RequestedQuotes/requested_quotes_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

// ... Your imports ...

class RequestedQuote extends StatefulWidget {
  const RequestedQuote({super.key});

  @override
  State<RequestedQuote> createState() => _RequestedQuoteState();
}

class _RequestedQuoteState extends State<RequestedQuote> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestQouteController>(
      init: RequestQouteController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Requested Quote'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder<Quote>(
              future: controller.getQuotes(userid: controller.id!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData &&
                    snapshot.data!.quotes.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.quotes.length,
                      itemBuilder: (context, index) {
                        var quote = snapshot.data!.quotes[index];
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            height: 461.h,
                            margin:
                                EdgeInsets.only(top: 26, left: 27, right: 27).r,
                            padding: EdgeInsets.only(
                              top: 15,
                              left: 21,
                              right: 25,
                            ).r,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5).r,
                              border: Border.all(
                                  color: Color(0xff26BDEB), width: 2),
                              color: HexColor('#FFFFFF'),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: AutoSizeText(
                                    quote.companyName.toString(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                        color: HexColor('#707070')),
                                  ),
                                ),
                                Center(
                                  child: AutoSizeText(
                                    quote.sumInsured.toString(),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                        color: HexColor('#707070')),
                                  ),
                                ),
                                19.ph,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                      quote.modelYear.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                          color: HexColor('#707070')),
                                    ),
                                    //SvgPicture.asset('assets/images/msg_phone.svg'),
                                  ],
                                ),
                                AutoSizeText(
                                  quote.make.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      color: HexColor('#707070')),
                                ),
                                17.ph,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                      'Model',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                          color: HexColor('#707070')),
                                    ),
                                    AutoSizeText(
                                      'Premium Price',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                          color: HexColor('#707070')),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                      quote.model.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.sp,
                                          color: HexColor('#707070')),
                                    ),
                                    AutoSizeText(
                                      quote.premiumPrice.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.sp,
                                          color: HexColor('#707070')),
                                    ),
                                  ],
                                ),
                                11.ph,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                      'Total',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                          color: HexColor('#707070')),
                                    ),
                                    AutoSizeText(
                                      'Plate Number',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                          color: HexColor('#707070')),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    AutoSizeText(
                                      quote.totalPremiumPrice.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.sp,
                                          color: HexColor('#707070')),
                                    ),
                                    AutoSizeText(
                                      quote.plateNumber.toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.sp,
                                          color: HexColor('#707070')),
                                    ),
                                  ],
                                ),
                                11.ph,
                                AutoSizeText(
                                  'Expiry Date',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      color: HexColor('#707070')),
                                ),
                                AutoSizeText(
                                  quote.expiryDate.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      color: HexColor('#707070')),
                                ),
                                18.ph,
                                // AutoSizeText(
                                //   'Description',
                                //   maxLines: 1,
                                //   overflow: TextOverflow.ellipsis,
                                //   style: GoogleFonts.montserrat(
                                //       fontWeight: FontWeight.w600,
                                //       fontSize: 14.sp,
                                //       color: HexColor('#0D0B0C')),
                                // ),
                                11.ph,
                                Container(
                                  width: 307.w,
                                  height: 82.h,
                                  padding: EdgeInsets.only(
                                          left: 16,
                                          top: 11,
                                          bottom: 11,
                                          right: 33)
                                      .r,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Color(0xfff3f4f5)),
                                  child: AutoSizeText(
                                    '',
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                        color: HexColor('#707070')),
                                  ),
                                ),
                                20.ph,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 32.h,
                                      width: 120.w,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(16).r,
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
                                    //30.pw,
                                    Container(
                                      width: 120.w,
                                      height: 32.h,
                                      decoration: BoxDecoration(
                                        color: HexColor('#27BCEB'),
                                        borderRadius:
                                            BorderRadius.circular(16).r,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Respond',
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
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  return Center(child: Text('No data available'));
                }
              },
            ),
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
