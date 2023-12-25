import 'package:auto_size_text/auto_size_text.dart';
import 'package:car_insurance_app/Constants/Extensions/extensions.dart';
import 'package:car_insurance_app/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../Data/Api Resp/api_response.dart';
import '../../../Widgets/Loader/loader.dart';
import '../Controller/investMent_Opportunity_controller.dart';

class InvestMentOpportunityView extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvestMentOpportunityController>(
      autoRemove: true,
      init: InvestMentOpportunityController(),
      builder: (controller) => Scaffold(
        appBar: MyAppBar(
          title: 'Investment Opportunities',
        ),
        body: SafeArea(
          child: Column(
            children: [
              if (controller.responseStatus == Status.loading)
                const Loader()
              else if (controller.responseStatus == Status.completed)
                Expanded(
                    child: ListView.builder(
                  itemCount: controller.investmentsList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var investments = controller.investmentsList[index];
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        height: 461.h,
                        margin: EdgeInsets.only(top: 26, left: 27, right: 27).r,
                        padding: EdgeInsets.only(
                          top: 15,
                          left: 21,
                          right: 25,
                        ).r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5).r,
                          border:
                              Border.all(color: Color(0xff26BDEB), width: 2),
                          color: HexColor('#FFFFFF'),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: AutoSizeText(
                                investments.title.toString(),
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
                                investments.interest.toString(),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText(
                                  investments.interest.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      color: HexColor('#707070')),
                                ),
                                SvgPicture.asset('assets/images/msg_phone.svg'),
                              ],
                            ),
                            AutoSizeText(
                              investments.postedDesignation.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: HexColor('#707070')),
                            ),
                            17.ph,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText(
                                  'Location',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      color: HexColor('#707070')),
                                ),
                                AutoSizeText(
                                  'Industries',
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText(
                                  investments.locationPreference.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      color: HexColor('#707070')),
                                ),
                                AutoSizeText(
                                  investments.companies.primaryActivity
                                      .toString(),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText(
                                  'Posted By',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      color: HexColor('#707070')),
                                ),
                                AutoSizeText(
                                  'Established Date',
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AutoSizeText(
                                  investments.companies.companyName.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                      color: HexColor('#707070')),
                                ),
                                AutoSizeText(
                                  investments.establishedDate.toString(),
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
                              'Business for Sale',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color: HexColor('#707070')),
                            ),
                            AutoSizeText(
                              investments.targetSellingPrice.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: HexColor('#707070')),
                            ),
                            18.ph,
                            AutoSizeText(
                              'Description',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp,
                                  color: HexColor('#0D0B0C')),
                            ),
                            11.ph,
                            Container(
                              width: 307.w,
                              height: 82.h,
                              padding: EdgeInsets.only(
                                      left: 16, top: 11, bottom: 11, right: 33)
                                  .r,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(0xfff3f4f5)),
                              child: AutoSizeText(
                                investments.businessOverview.toString(),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 32.h,
                                  width: 120.w,
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
                                //30.pw,
                                Container(
                                  width: 120.w,
                                  height: 32.h,
                                  decoration: BoxDecoration(
                                    color: HexColor('#27BCEB'),
                                    borderRadius: BorderRadius.circular(16).r,
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
                ))
              else
                const Text("SomeThing went Wrong"),
            ],
          ),
        ),
      ),
    );
  }
}
