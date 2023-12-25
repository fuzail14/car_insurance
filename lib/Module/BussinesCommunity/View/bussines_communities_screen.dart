import 'package:auto_size_text/auto_size_text.dart';
import 'package:car_insurance_app/Constants/Extensions/extensions.dart';
import 'package:car_insurance_app/Module/BussinesCommunity/Controller/bussines_communities_controller.dart';
import 'package:car_insurance_app/Widgets/AppBar/my_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../../Routes/set_routes.dart';
import '../../../../Widgets/My Back Button/my_back_button.dart';
import '../../../Constants/constants.dart';
import '../../../Data/Api Resp/api_response.dart';
import '../../../Widgets/Loader/loader.dart';

class BussinesCommunitiesScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BussinesCommunitiesController>(
      autoRemove: true,
      init: BussinesCommunitiesController(),
      builder: (controller) =>
          //CupertinoPageScaffold(
          // backgroundColor: HexColor('#F5F5F5'),
          // navigationBar: CupertinoNavigationBar(
          //   middle: Text(
          //     "Bussiness Communities",
          //     style: GoogleFonts.ubuntu(
          //         fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          //   ),
          //   trailing: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       CupertinoButton(
          //         child: Icon(
          //           CupertinoIcons.slider_horizontal_3,
          //           color: HexColor('#404345'),
          //         ),
          //         onPressed: () {
          //           showDialog(
          //             context: context,
          //             builder: (_) => CupertinoAlertDialog(
          //               title: Padding(
          //                 padding: EdgeInsets.only(bottom: 12.0),
          //                 child: Text(
          //                   'Choose a Type',
          //                   style: TextStyle(
          //                       fontSize: 18.sp, fontWeight: FontWeight.bold),
          //                 ),
          //               ),
          //               content: Container(
          //                 height: MediaQuery.of(context).size.height * 0.5,
          //                 child: SingleChildScrollView(
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       _buildDialogOption(
          //                           'Agriculture, Forestry and Fishing',
          //                           context,
          //                           controller),
          //                       Divider(
          //                         color: Color.fromARGB(255, 125, 125, 128),
          //                         thickness: 0.5,
          //                       ),
          //                       _buildDialogOption(
          //                           'Mining and quarrying', context, controller),
          //                       Divider(
          //                         color: Color.fromARGB(255, 125, 125, 128),
          //                         thickness: 0.5,
          //                       ),
          //                       _buildDialogOption(
          //                           'Manufacturing', context, controller),
          //                       Divider(
          //                         color: Color.fromARGB(255, 125, 125, 128),
          //                         thickness: 0.5,
          //                       ),
          //                       _buildDialogOption(
          //                           'Electricity, gas, steam and air conditioning supply',
          //                           context,
          //                           controller),
          //                       Divider(
          //                         color: Color.fromARGB(255, 125, 125, 128),
          //                         thickness: 0.5,
          //                       ),
          //                       _buildDialogOption(
          //                           'Water supply sewerage, waste management',
          //                           context,
          //                           controller),
          //                       Divider(
          //                         color: Color.fromARGB(255, 125, 125, 128),
          //                         thickness: 0.5,
          //                       ),
          //                       _buildDialogOption(
          //                           'Construction', context, controller),
          //                       Divider(
          //                         color: Color.fromARGB(255, 125, 125, 128),
          //                         thickness: 0.5,
          //                       ),
          //                       _buildDialogOption(
          //                           'Wholesale, retail trade; repair of vehicles',
          //                           context,
          //                           controller),
          //                       Divider(
          //                         color: Color.fromARGB(255, 125, 125, 128),
          //                         thickness: 0.5,
          //                       ),
          //                       _buildDialogOption('Transportation and storage',
          //                           context, controller),
          //                       Divider(
          //                         color: Color.fromARGB(255, 125, 125, 128),
          //                         thickness: 0.5,
          //                       ),
          //                       _buildDialogOption(
          //                           'Accommodation and food services activities',
          //                           context,
          //                           controller),
          //                       Divider(
          //                         color: Color.fromARGB(255, 125, 125, 128),
          //                         thickness: 0.5,
          //                       ),
          //                       _buildDialogOption(
          //                           'Information and Communication',
          //                           context,
          //                           controller),
          //                       Divider(
          //                         color: Color.fromARGB(255, 125, 125, 128),
          //                         thickness: 0.5,
          //                       ),
          //                       _buildDialogOption(
          //                           'Financial and insurance activities',
          //                           context,
          //                           controller),
          //                       Divider(
          //                         color: Color.fromARGB(255, 125, 125, 128),
          //                         thickness: 0.5,
          //                       ),
          //                       _buildDialogOption('Real estate activities',
          //                           context, controller),
          //                       Divider(
          //                         color: Color.fromARGB(255, 125, 125, 128),
          //                         thickness: 0.5,
          //                       ),
          //                       _buildDialogOption(
          //                           'Professional, scientific and technical activities',
          //                           context,
          //                           controller),
          //                       Divider(
          //                         color: Color.fromARGB(255, 125, 125, 128),
          //                         thickness: 0.5,
          //                       ),
          //                       _buildDialogOption(
          //                           'Administrative and support service activities',
          //                           context,
          //                           controller),
          //                       Divider(
          //                         color: Color.fromARGB(255, 125, 125, 128),
          //                         thickness: 0.5,
          //                       ),
          //                       _buildDialogOption(
          //                           'Public administration, defense; and social security',
          //                           context,
          //                           controller),
          //                       Divider(
          //                         color: Color.fromARGB(255, 125, 125, 128),
          //                         thickness: 0.5,
          //                       ),
          //                       _buildDialogOption(
          //                           'Education', context, controller),
          //                       Divider(
          //                         color: Color.fromARGB(255, 125, 125, 128),
          //                         thickness: 0.5,
          //                       ),
          //                       _buildDialogOption(
          //                           'Human health and social work activities',
          //                           context,
          //                           controller),
          //                       Divider(
          //                         color: Color.fromARGB(255, 125, 125, 128),
          //                         thickness: 0.5,
          //                       ),
          //                       _buildDialogOption(
          //                           'Arts, entertainment and recreation',
          //                           context,
          //                           controller),
          //                       Divider(
          //                         color: Color.fromARGB(255, 125, 125, 128),
          //                         thickness: 0.5,
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //               actions: [
          //                 CupertinoDialogAction(
          //                   child: Text('Cancel'),
          //                   onPressed: () {
          //                     Navigator.pop(context);
          //                   },
          //                 ),
          //               ],
          //             ),
          //           );
          //         },
          //       ),
          //       CupertinoButton(
          //         child: Icon(CupertinoIcons.arrow_up_arrow_down,
          //             color: HexColor('#404345')),
          //         onPressed: () {
          //           showCupertinoModalPopup(
          //             context: context,
          //             builder: (_) => CupertinoActionSheet(
          //               title: Text('Choose a Type'),
          //               actions: [
          //                 CupertinoActionSheetAction(
          //                   child: Text('Buyer'),
          //                   onPressed: () {
          //                     controller.CompanyBussinesFilterApi(
          //                         bussinestype: 'buyer');
          //                     Get.back();
          //                   },
          //                 ),
          //                 CupertinoActionSheetAction(
          //                   child: Text('Supplier'),
          //                   onPressed: () {
          //                     controller.CompanyBussinesFilterApi(
          //                         bussinestype: 'Supplier');
          //                     Get.back();
          //                   },
          //                 ),
          //                 CupertinoActionSheetAction(
          //                   child: Text('Service Provider'),
          //                   onPressed: () {
          //                     controller.CompanyBussinesFilterApi(
          //                         bussinestype: 'Service Provider');
          //                     Get.back();
          //                   },
          //                 ),
          //               ],
          //               cancelButton: CupertinoActionSheetAction(
          //                 child: Text('Cancel'),
          //                 onPressed: () {
          //                   Navigator.pop(context);
          //                 },
          //               ),
          //             ),
          //           );
          //         },
          //       ),
          //     ],
          //   ),
          // ),
          Scaffold(
        appBar: MyAppBar(
          title: "Bussiness Communities",
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            if (controller.responseStatus == Status.loading)
              const Loader()
            else if (controller.responseStatus == Status.completed) ...[
              26.ph,
              Row(
                children: [
                  Container(
                    width: 281.w,
                    height: 36.h,
                    padding: EdgeInsets.only(left: 20).r,
                    margin: EdgeInsets.only(left: 26).r,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(color: HexColor('#DEDEDE'))),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "What are you looking for?",
                        hintStyle: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                            color: HexColor('#75788D')),
                        suffixIcon: Container(
                          padding: EdgeInsets.only(right: 22).r,
                          width: 22.w,
                          height: 21.h,
                          child: SvgPicture.asset(
                            'assets/images/search.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  10.pw,
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 300, // Set the height of the bottom sheet
                              padding: EdgeInsets.all(
                                  16), // Add some padding inside the bottom sheet
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 10,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.shopping_basket),
                                    title: Text('Buyer'),
                                    onTap: () {
                                      controller.CompanyBussinesFilterApi(
                                          bussinestype: 'buyer');
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.store),
                                    title: Text('Supplier'),
                                    onTap: () {
                                      controller.CompanyBussinesFilterApi(
                                          bussinestype: 'Supplier');
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.handyman),
                                    title: Text('Service Provider'),
                                    onTap: () {
                                      controller.CompanyBussinesFilterApi(
                                          bussinestype: 'Service Provider');
                                      Navigator.pop(context);
                                    },
                                  ),
                                  SizedBox(height: 20),
                                  ElevatedButton(
                                    child: Text('Cancel'),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ],
                              ),
                            );
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.0),
                            ),
                          ),
                          isScrollControlled:
                              true, // Set this to true if you want to make the bottom sheet full-screen
                        );
                      },
                      icon: SvgPicture.asset('assets/images/filter.svg')),
                ],
              ),
              20.ph,
              Expanded(
                  child: ListView.builder(
                itemCount: controller.companiesApiList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      width: 386.w,
                      height: 177.h,
                      margin: EdgeInsets.only(
                        left: 24.w,
                        right: 24.w,
                        top: 12.h,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.4.r),
                          color: HexColor('#FCFCFC')),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 17, top: 18),
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/images/bccard.svg'),
                                30.pw,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 100.w,
                                      child: AutoSizeText(
                                        controller.companiesApiList[index]
                                            .companyName,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.ubuntu(
                                            color: HexColor('#404345'),
                                            fontStyle: FontStyle.normal,
                                            letterSpacing: 0.0015,
                                            fontSize: ScreenUtil().setSp(16),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Text(
                                      controller
                                          .companiesApiList[index].mobileNo
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.ubuntu(
                                          color: HexColor('#AAAAAA'),
                                          fontStyle: FontStyle.normal,
                                          letterSpacing: 0.0015,
                                          fontSize: ScreenUtil().setSp(12),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                40.pw,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SvgPicture.asset(
                                        'assets/images/phone_email_location.svg'),
                                    20.ph,
                                    Container(
                                      constraints: BoxConstraints(
                                        minWidth: 79.w,
                                        maxWidth: 79.w,
                                      ),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4.w),
                                      height: 22.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10).r,
                                        color: (controller
                                                    .companiesApiList[index]
                                                    .primaryActivity ==
                                                'buyer')
                                            ? Color(0x5933a7ed)
                                            : Color(0x594b6fff),
                                      ),
                                      child: Center(
                                        child: AutoSizeText(
                                            controller.companiesApiList[index]
                                                .primaryActivity
                                                .toString(),
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.5,
                                              color: HexColor('#2984BB'),
                                            ),
                                            minFontSize: 8),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          27.ph,
                          Divider(
                            indent: 25,
                            endIndent: 25,
                          ),
                          15.ph,
                          Container(
                            width: 300.w,
                            height: 27.h,
                            decoration: BoxDecoration(
                                color: HexColor('#F6F6F6'),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: HexColor('#E1E3E6'))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/bc_chat.svg',
                                  height: 14.h,
                                  width: 15.01.w,
                                ),
                                Text(
                                  'Chat',
                                  style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      color: HexColor('#4B6FFF')),
                                ),
                                VerticalDivider(
                                  color: HexColor('#E1E3E6'),
                                ),
                                SvgPicture.asset(
                                  'assets/images/bc_share.svg',
                                  height: 14.h,
                                  width: 15.01.w,
                                ),
                                Text('Share',
                                    style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                        color: HexColor('#4B6FFF'))),
                                VerticalDivider(
                                  color: HexColor('#E1E3E6'),
                                ),
                                SvgPicture.asset(
                                  'assets/images/bc_detail.svg',
                                  height: 14.h,
                                  width: 15.01.w,
                                ),
                                Text('Details',
                                    style: GoogleFonts.quicksand(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                        color: HexColor('#4B6FFF'))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ))
            ] else
              const Text("SomeThing went Wrong"),
          ],
        ),
      ),
      // ),
    );
  }

  Widget _buildDialogOption(String title, BuildContext context,
      BussinesCommunitiesController controller) {
    return CupertinoButton(
      onPressed: () {
        controller.BussinesCommunityIsicFilterApi(type: title);
        Navigator.pop(context);
      },
      child: AutoSizeText(
        title,
        style: TextStyle(
          color: CupertinoColors.activeBlue,
          fontSize: 16.sp,
        ),
        maxLines: 2,
      ),
    );
  }
}

Future<void> _showAlertDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // <-- SEE HERE
        title: const Text('Cancel booking'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Are you sure want to cancel booking?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
