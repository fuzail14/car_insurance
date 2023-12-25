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
import '../Controller/online_store_controller.dart';
import '../Model/Product.dart';

class OnlineStoreScreen extends GetView {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnlineStoreController>(
      autoRemove: true,
      init: OnlineStoreController(),
      builder: (controller) => Scaffold(
        appBar: MyAppBar(
          title: 'Online Store',
        ),
        body: SafeArea(
          child: Column(
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
                                height:
                                    300, // Set the height of the bottom sheet
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
                                        // controller.CompanyBussinesFilterApi(
                                        //     bussinestype: 'buyer');
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.store),
                                      title: Text('Supplier'),
                                      onTap: () {
                                        // controller.CompanyBussinesFilterApi(
                                        //     bussinestype: 'Supplier');
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.handyman),
                                      title: Text('Service Provider'),
                                      onTap: () {
                                        // controller.CompanyBussinesFilterApi(
                                        //     bussinestype: 'Service Provider');
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
                  itemCount: controller.productsApiList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var product = controller.productsApiList[index];
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        height: 282.h,
                        margin: EdgeInsets.only(
                                top: 15, left: 27, right: 27, bottom: 15)
                            .r,
                        padding:
                            EdgeInsets.only(left: 16, right: 16, top: 23).r,
                        color: HexColor('#F3F4F5'),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //first card
                            Container(
                              width: 328.w,
                              height: 132.h,
                              padding: EdgeInsets.only(
                                left: 10,
                                right: 10,
                                top: 10,
                              ).r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16).r,
                                color: Colors.white,
                              ),
                              child: Stack(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/bussines_sale.svg',
                                    width: 100.w,
                                    height: 105.h,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 110,
                                      top: 10,
                                      right: 30,
                                    ).r,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          product.name.toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16.sp,
                                              color: HexColor('#0D0B0C')),
                                        ),
                                        5.ph,
                                        AutoSizeText(
                                          product.companies.companyName
                                              .toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                              color: HexColor('#6A7380')),
                                        ),
                                        AutoSizeText(
                                          product.unitPrice.toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.sp,
                                              color: HexColor('#6A7380')),
                                        ),
                                        AutoSizeText(
                                          product.salePrice.toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.sp,
                                              color: HexColor('#0D0B0C')),
                                        ),
                                        5.ph,
                                        AutoSizeText(
                                          product.companies.companyCode
                                              .toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.quicksand(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                              color: HexColor('#0D0B0C')),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(
                                      Icons.favorite_border,
                                      size: 20.h,
                                      color: HexColor('#6A7380'),
                                    ),
                                  ),
                                  // Align(
                                  //   alignment: Alignment.bottomRight,
                                  //   child: AutoSizeText(
                                  //     product.productType.toString(),
                                  //     maxLines: 1,
                                  //     overflow: TextOverflow.ellipsis,
                                  //     style: GoogleFonts.quicksand(
                                  //         fontWeight: FontWeight.w500,
                                  //         fontSize: 10.sp,
                                  //         color: HexColor('#0D0B0C')),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            21.ph,
                            //detail
                            Text(
                              '5 Box (Min Order QTY)',
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color: HexColor('#0D0B0C')),
                            ),
                            5.ph,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Made in Saudia Arabia ',
                                  style: GoogleFonts.quicksand(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                      color: HexColor('#000000')),
                                ),
                                SvgPicture.asset(
                                    'assets/images/os_card_icon.svg')
                              ],
                            ),
                            9.ph,
                            Text(
                              'Manufacturer - Hp',
                              style: GoogleFonts.quicksand(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color: HexColor('#0D0B0C')),
                            ),
                            7.ph,
                            StarRating(
                              rating: 3,
                              color: HexColor('#FCAB10'),
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
      ),
    );
  }

  Widget _buildDialogOption(
      String title, BuildContext context, OnlineStoreController controller) {
    return CupertinoButton(
      onPressed: () {
        // controller.BussinesCommunityIsicFilterApi(type: title);

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

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  //final RatingChangeCallback onRatingChanged;
  final Color color;

  StarRating(
      {this.starCount = 5,
      this.rating = .0,
      //required this.onRatingChanged,
      required this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: HexColor('#B9B9B9'),
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: color ?? Theme.of(context).primaryColor,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color ?? Theme.of(context).primaryColor,
      );
    }
    return InkResponse(
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children:
            List.generate(starCount, (index) => buildStar(context, index)));
  }
}
